package com.scitemav.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.PersonaBean;
import com.scitemav.model.Persona;
import com.scitemav.model.Usuario;

@Service
public class PersonaServiceImpl implements PersonaService{

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public PersonaBean getInformationPerfil(HttpSession session) {
		PersonaBean personabean = new PersonaBean();
		Persona persona = new Persona();		
		Query q1 = em.createQuery("SELECT p FROM Persona p JOIN p.perUsuario u WHERE u.idUsuario = :idUsuario AND u.estado =:activo");
		q1.setParameter("idUsuario", Integer.parseInt(session.getAttribute("idUsuario").toString()));
		q1.setParameter("activo", "habilitado");
		persona = (Persona) q1.getSingleResult();
		personabean.setNombre(persona.getNombre());
		personabean.setApellidoPaterno(persona.getApellidoPaterno());
		personabean.setApellidoMaterno(persona.getApellidoMaterno());
		personabean.setTelefono(persona.getTelefono());
		personabean.setEmail(persona.getPerUsuario().getEmail());
		
		personabean.setFechaNacimiento(persona.getFechaNacimiento());
		personabean.setDireccion(persona.getDireccion());
		personabean.setCelular(persona.getCelular());
		personabean.setIdDistrito(persona.getPerDistrito().getIdDistrito());
		personabean.setSexo(persona.getSexo());
		personabean.setDni(persona.getDni());
		
		return personabean;
	}

	@Transactional
	public boolean editInformacionPerfil(PersonaBean perbean,HttpSession session) {
		boolean resultado = false;
		Persona personaX = new Persona();
		try{
			Query q1 = em.createQuery("SELECT p FROM Persona p JOIN p.perUsuario u WHERE u.idUsuario = :idUsuario AND u.estado =:activo");
			q1.setParameter("idUsuario", Integer.parseInt(session.getAttribute("idUsuario").toString()));
			q1.setParameter("activo", "habilitado");
			personaX = (Persona) q1.getSingleResult();			
			Persona profileY = em.merge(personaX);
			profileY.setNombre(perbean.getNombre());
			profileY.setApellidoPaterno(perbean.getApellidoPaterno());
			profileY.setApellidoMaterno(perbean.getApellidoMaterno());
			profileY.setTelefono(perbean.getTelefono());
			profileY.setFechaNacimiento(perbean.getFechaNacimiento());
			profileY.setDireccion(perbean.getDireccion());
			profileY.setCelular(perbean.getCelular());
			profileY.setDni(perbean.getDni());
			Usuario usuarioY = em.merge(personaX.getPerUsuario());
			usuarioY.setEmail(perbean.getEmail());	
			resultado = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}
		
		return resultado;
	}

}
