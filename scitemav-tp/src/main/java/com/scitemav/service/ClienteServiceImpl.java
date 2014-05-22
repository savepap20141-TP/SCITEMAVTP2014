package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.RevisionBean;
import com.scitemav.model.Cliente;
import com.scitemav.model.Distrito;
import com.scitemav.model.Persona;
import com.scitemav.model.Revision;
import com.scitemav.model.Usuario;
import com.scitemav.model.Vehiculo;

@Service
public class ClienteServiceImpl implements ClienteService{

	@Autowired
	EmailService emailService;
	
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
			emailService.EnviarMensaje(usu.getEmail());
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
		List<Cliente> _lc = new ArrayList<Cliente>();
		List<ClienteBean> _lcb = new ArrayList<ClienteBean>();		
		try {
			Query q = em.createQuery("SELECT c FROM Cliente c");
			_lc = q.getResultList();
			for(int i=0; i < _lc.size(); i++){
				Cliente c = _lc.get(i);
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
				
				_lcb.add(cb);
			}
		} catch (IllegalArgumentException e) {
			_lcb = null;			
		}

		return _lcb;
	}
	@Transactional
	public ClienteBean obtenerInfo(int idCliente) {
		ClienteBean rBean = null;		
		try {
			rBean = new ClienteBean();
			Query q = em.createQuery("from Cliente where idCliente="+idCliente);
			Cliente r = new Cliente();
			r = (Cliente) q.getSingleResult();
			
			rBean.setIdCliente(r.getIdCliente());
			rBean.setRazonSocial(r.getRazonSocial());
			rBean.setRuc(r.getRuc());			
			
			rBean.setDni(r.getCliPersona().getDni());
			rBean.setNombre(r.getCliPersona().getNombre());
			rBean.setApellidoPaterno(r.getCliPersona().getApellidoPaterno());
			rBean.setApellidoMaterno(r.getCliPersona().getApellidoMaterno());
			rBean.setSexo(r.getCliPersona().getSexo());
			rBean.setFechaNacimiento(r.getCliPersona().getFechaNacimiento());
			rBean.setIdDistrito(r.getCliPersona().getPerDistrito().getIdDistrito());
			rBean.setNombreDistrito(r.getCliPersona().getPerDistrito().getNombre());
			rBean.setDireccion(r.getCliPersona().getDireccion());
			rBean.setTelefono(r.getCliPersona().getTelefono());
			rBean.setCelular(r.getCliPersona().getCelular());
			rBean.setEmail(r.getCliPersona().getPerUsuario().getEmail());
			
		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());

		}
		return rBean;
	}

	@Transactional
	public boolean editInformacionCliente(ClienteBean rb) {
		boolean resultado = false;
		Cliente rev = new Cliente();
		try{
			rev.setIdCliente(rb.getIdCliente());
			//
			Persona per = new Persona();
			per.setIdPersona(rb.getIdPersona());						
			rev.setCliPersona(per);
			//
			rev.setRazonSocial(rb.getRazonSocial());
			rev.setRuc(rb.getRuc());
			
			em.merge(rev);
			resultado = true;
		} catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}
		
		return resultado;
	}

}
