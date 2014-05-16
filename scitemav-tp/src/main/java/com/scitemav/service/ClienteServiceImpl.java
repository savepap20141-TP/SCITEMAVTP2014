package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.ClienteBean;
import com.scitemav.model.Cliente;
import com.scitemav.model.Distrito;
import com.scitemav.model.Persona;
import com.scitemav.model.Usuario;

@Service
public class ClienteServiceImpl implements ClienteService{

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registroCliente(ClienteBean clib) {
		boolean resultado = false;
		Usuario usu = new Usuario();
		Persona per = new Persona();
		Cliente cli = new Cliente();		

		try{
			usu.setEmail(clib.getEmail());
			String md5 = DigestUtils.md5Hex("pass");
			usu.setPassword(md5);
			usu.setEstado("creado");
			java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
			java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());   
			usu.setFechaCreacion(ts);	
			usu.setActivo(false);
			em.persist(usu);
			
			per.setPerUsuario(usu);			
			per.setNombre(clib.getNombre());
			per.setApellidoPaterno(clib.getApellidoPaterno());
			per.setApellidoMaterno(clib.getApellidoMaterno());
			per.setTelefono(clib.getTelefono());
			per.setDni(clib.getDni());
			per.setCelular(clib.getCelular());
			per.setDireccion(clib.getDireccion());
			per.setFechaNacimiento(clib.getFechaNacimiento());
			per.setSexo(clib.getSexo());
			per.setActivo(false);
		
			Distrito dis = new Distrito();
			dis.setIdDistrito(clib.getIdDistrito());
			per.setPerDistrito(dis);
			
			em.persist(per);
			
			cli.setCliPersona(per);
			cli.setRazonSocial(clib.getRazonSocial());
			cli.setRuc(clib.getRuc());
			
			em.persist(cli);
			resultado = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}		
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<ClienteBean> listarClientes() {
		List<Cliente> lc = new ArrayList<Cliente>();
		List<ClienteBean> lcb = new ArrayList<ClienteBean>();		
		try {
			Query q = em.createQuery("SELECT c FROM Cliente c");
			lc = q.getResultList();
			for(int i=0; i < lc.size(); i++){
				Cliente c = lc.get(i);
				ClienteBean cb = new ClienteBean();
				cb.setIdCliente(c.getIdCliente());
				cb.setDni(c.getCliPersona().getDni());
				cb.setNombre(c.getCliPersona().getNombre());
				cb.setApellidoPaterno(c.getCliPersona().getApellidoPaterno());
				cb.setApellidoMaterno(c.getCliPersona().getApellidoMaterno());
				cb.setSexo(c.getCliPersona().getSexo());
				cb.setFechaNacimiento(c.getCliPersona().getFechaNacimiento());
				cb.setIdDistrito(c.getCliPersona().getPerDistrito().getIdDistrito());
				cb.setNombreDistrito(c.getCliPersona().getPerDistrito().getNombre());
				cb.setDireccion(c.getCliPersona().getDireccion());
				cb.setTelefono(c.getCliPersona().getTelefono());
				cb.setCelular(c.getCliPersona().getCelular());
				cb.setEmail(c.getCliPersona().getPerUsuario().getEmail());
				
				lcb.add(cb);
			}
		} catch (IllegalArgumentException e) {
			lcb = null;			
		}

		return lcb;
	}
}
