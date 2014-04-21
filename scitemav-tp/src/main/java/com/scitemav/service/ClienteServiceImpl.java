package com.scitemav.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
			usu.setPassword("pass");
			
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

}
