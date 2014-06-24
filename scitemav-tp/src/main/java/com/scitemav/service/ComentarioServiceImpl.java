package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.ArchivosBean;
import com.scitemav.bean.ComentarioBean;
import com.scitemav.model.Archivo;
import com.scitemav.model.Cliente;
import com.scitemav.model.Comentario;
import com.scitemav.model.Empleado;
import com.scitemav.model.Revision;
import com.scitemav.model.Usuario;
import com.scitemav.model.Vehiculo;

@Service
public class ComentarioServiceImpl implements ComentarioService  {

	@PersistenceContext
	EntityManager em;
	
	
	@Transactional
	public boolean registro(HttpSession session, ComentarioBean comentarioB, String tipoEntidad, String idEntidad) {
		
		boolean resultado = true;
		Comentario com = new Comentario();
		Usuario usu = new Usuario();
				
		try{
			
			if(tipoEntidad.equals("vehiculo")){
				Vehiculo veh = new Vehiculo();
				veh.setIdVehiculo(Integer.parseInt(idEntidad));
				com.setComVehiculo(veh);
			}
			else if(tipoEntidad.equals("revision")){
				Revision rev = new Revision();
				rev.setIdRevision(Integer.parseInt(idEntidad));
				com.setComRevision(rev);
			}
			else if(tipoEntidad.equals("cliente")){
				Cliente cli = new Cliente();
				cli.setIdCliente(Integer.parseInt(idEntidad));
				com.setComCliente(cli);
			}
			else if(tipoEntidad.equals("empleado")){
				Empleado emp = new Empleado();
				emp.setIdEmpleado(Integer.parseInt(idEntidad));
				com.setComEmpleado(emp);
			}
			
			com.setComentario(comentarioB.getComentario());
			java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
			java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());   
			com.setFechaCreacion(ts);	
			usu.setIdUsuario(Integer.parseInt(session.getAttribute("idUsuario").toString()));
			com.setComUsuario(usu);			
			com.setVisibilidad(comentarioB.getVisibilidad());
			
			em.persist(com);	
			resultado = true;
			
		} catch(IllegalArgumentException e){
			System.out.println(e.getMessage());
			resultado = false;
			
		}
		
		return resultado;
		 
		
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<ComentarioBean> listarComentarios(HttpSession session, String tipoEntidad, String idEntidad) {
		List<Comentario> _lc = new ArrayList<Comentario>();
		List<ComentarioBean> _lcb = new ArrayList<ComentarioBean>();
		try{
			Query query = null;
			if(tipoEntidad.equals("vehiculo")){
				String Squery = "";
				Squery = "SELECT c FROM Comentario c JOIN c.comVehiculo cv WHERE cv.idVehiculo=:idvehiculo";
				query = em.createQuery(Squery);
				if(session.getAttribute("role").toString().equals("cliente")){
					Squery += " AND c.visibilidad='Privado (Empleados & Clientes)' AND c.visibilidad='Privado (Cliente)' ";
				}else if(session.getAttribute("role").toString().equals("supervisor") ||
						session.getAttribute("role").toString().equals("Tecnico automotriz") || 
						session.getAttribute("role").toString().equals("Jefe automotriz")){
					Squery += " AND c.visibilidad='Privado (Empleados & Clientes)' AND c.visibilidad='Privado (Cliente)' ";
				}
			    query.setParameter("idvehiculo", Integer.parseInt(idEntidad));
				
			}
			else if(tipoEntidad.equals("revision")){
				String Squery = "";
				Squery = "SELECT c FROM Comentario c JOIN c.comRevision cr WHERE cr.idRevision=:idrevision";
				if(session.getAttribute("role").toString().equals("cliente")){
					Squery += " AND c.visibilidad='Privado (Empleados & Clientes)' AND c.visibilidad='Privado (Cliente)' ";
				}else if(session.getAttribute("role").toString().equals("supervisor") ||
						session.getAttribute("role").toString().equals("tecnico automotriz") || 
						session.getAttribute("role").toString().equals("jefe automotriz")){
					Squery += " AND c.visibilidad='Privado (Empleados & Clientes)' AND c.visibilidad='Privado (Cliente)' ";
				}
				query = em.createQuery(Squery);
			    query.setParameter("idrevision", Integer.parseInt(idEntidad));				
			}	
			else if(tipoEntidad.equals("cliente")){
				String Squery = "";
				Squery = "SELECT c FROM Comentario c JOIN c.comCliente cc WHERE cc.idCliente=:idcliente";
				query = em.createQuery(Squery);
			    query.setParameter("idcliente", Integer.parseInt(idEntidad));				
			}
			else if(tipoEntidad.equals("empleado")){
				String Squery = "";
				Squery = "SELECT c FROM Comentario c JOIN c.comEmpleado ce WHERE ce.idEmpleado=:idempleado";
				query = em.createQuery(Squery);
			    query.setParameter("idempleado", Integer.parseInt(idEntidad));				
			}
			
			_lc = query.getResultList();
			for(int i =0; i < _lc.size(); i++){
				Comentario c = _lc.get(i);
				ComentarioBean cb = new ComentarioBean();
				cb.setComentario(c.getComentario());
				cb.setFechaCreacion(c.getFechaCreacion());
				cb.setIdComentario(c.getIdComentario());
				cb.setIdUsuario(c.getComUsuario().getIdUsuario());
				cb.setNombreUsuario(c.getComUsuario().getUsuPersona().getNombre()+" "+c.getComUsuario().getUsuPersona().getApellidoPaterno()+" "+c.getComUsuario().getUsuPersona().getApellidoMaterno());
				cb.setVisibilidad(c.getVisibilidad());
				_lcb.add(cb);
			}
			
			
		} catch(IllegalArgumentException e){
			_lcb = null;
		}
		
		return _lcb;
		
	}

	@Transactional
	public boolean editComentario(ComentarioBean cb, HttpServletRequest req) {
		boolean resultado = false;
		Comentario co = new Comentario();
		try{
			
			Query q = em.createQuery("SELECT c FROM Comentario c WHERE idComentario=:idComent");
			//Query q = em.createNativeQuery("SELECT vehiculo.* FROM EmpleadoRevision er JOIN Revision JOIN Vehiculo WHERE er.idEmpleado=:idEmp and er.idRevision=Revision.idRevision", Vehiculo.class);
			q.setParameter("idComent", cb.getIdComentario());
			
			co = (Comentario) q.getSingleResult();
			co.setComentario(cb.getComentario());
			
			em.merge(co);
			
			
			resultado = true;			
		}
		catch(IllegalArgumentException ex){
			System.out.println(ex);
			resultado = false;
		}
		return resultado;
	}

}
