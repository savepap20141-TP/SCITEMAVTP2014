package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;//MD5
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.PersonaBean;
import com.scitemav.model.Persona;
import com.scitemav.model.Usuario;

@Service
public class UsuarioServiceImpl implements UsuarioService{

	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static Random rnd = new Random();
	
	@PersistenceContext
	EntityManager em;

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean login(Usuario usu, HttpSession session) {
		boolean resultado = false;
		try{
			Query q = em.createQuery("SELECT u FROM Usuario u WHERE u.email =:email AND u.password =:password AND (u.activo =:activo OR u.estado=:estado)");
			q.setParameter("email", usu.getEmail());
	    	//String md5 = DigestUtils.md5Hex(usu.getPassword());
			String md5 = DigestUtils.md5Hex(usu.getPassword());
			q.setParameter("password", md5);
			q.setParameter("activo", true);
			q.setParameter("estado", "habilitado");
			
			Usuario userResult = (Usuario) q.getSingleResult();
			
			session.setAttribute("email", userResult.getEmail());
			session.setAttribute("idUsuario", userResult.getIdUsuario());
			// es Valido
			session.setAttribute("isValid", true);
			resultado = true;
		}catch(NoResultException ex){
			resultado = false;
		}
		return resultado;
	}
	
	@Transactional
	public boolean registro(PersonaBean perbean) {
		boolean resultado = false;
		Persona persona = new Persona();
		Usuario usuario = new Usuario();
		
		//Generacion de password automatica aleatorio
		StringBuilder sb = new StringBuilder(10);
		String firstPassword = "pass";
		
		for( int i = 0; i < 10; i++ ) 
		      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
		
		firstPassword = sb.toString();
		
		//
		try{
			usuario.setEmail(perbean.getEmail());
			//Convertimos el password en caracteres encriptados
			String md5 = DigestUtils.md5Hex(perbean.getPassword());
			usuario.setPassword(md5);
			//
			usuario.setActivo(true);
			usuario.setEstado("habilitado");
			em.persist(usuario);
			persona.setPerUsuario(usuario);
			persona.setNombre(perbean.getNombre());
			persona.setApellidoPaterno(perbean.getApellidoPaterno());
			persona.setApellidoMaterno(perbean.getApellidoMaterno());
			persona.setTelefono(perbean.getTelefono());	
			em.persist(persona);
			resultado = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}
		
		return resultado;
	}
	
	@Transactional
	public List<String> administrarLogin(String[] ids, String[] state) {
		List<String> enviados = new ArrayList<String>();
		try {
			for (int i = 0; i < ids.length; i++) {				
				Usuario usu = em.find(Usuario.class, Integer.parseInt(ids[i]));
				if(usu.getEstado().equals("creado")){										
						//Enviar Email al usuario
						if(!state[i].equals("deshabilitado")){
							enviados.add( usu.getUsuPersona().getNombre()+" "+usu.getUsuPersona().getApellidoPaterno()+" "+usu.getUsuPersona().getApellidoMaterno());
							//Agregar metodo que envia correos electronicos
							
						}
				}
				Usuario userx = em.merge(usu);
				userx.setEstado(state[i]);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return enviados;
	}
}
