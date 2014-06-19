package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.RepuestoBean;
import com.scitemav.bean.RepuestoRevisionBean;
import com.scitemav.model.Cliente;
import com.scitemav.model.Distrito;
import com.scitemav.model.Empleado;
import com.scitemav.model.EmpleadoRevision;
import com.scitemav.model.FallaRevision;
import com.scitemav.model.Persona;
import com.scitemav.model.Repuesto;
import com.scitemav.model.RepuestoRevision;
import com.scitemav.model.Revision;
import com.scitemav.model.TipoRepuesto;
import com.scitemav.model.Usuario;
@Service
public class RepuestoServicelmlp implements RepuestoService {

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(RepuestoBean tipv) {
		boolean resultado = false;
		TipoRepuesto tr = new TipoRepuesto();
		Repuesto rp = new Repuesto();				

		try{			
			tr.setIdTipoRepuesto(tipv.getIdTipoRepuesto());
			rp.setRepTipoRepuesto(tr);
			rp.setNombre(tipv.getNombre());
			if(tipv.getIdRepuesto()==null){
				em.persist(rp);
			}else{
				rp.setIdRepuesto(tipv.getIdRepuesto());
				em.merge(rp);
			}
			
		
			
			resultado = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}		
		return resultado;

	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<RepuestoBean> listarRepuestos() {
		List<Repuesto> lc = new ArrayList<Repuesto>();
		List<RepuestoBean> lcb = new ArrayList<RepuestoBean>();		
		try {
			Query q = em.createQuery("SELECT r FROM Repuesto r");
			lc = q.getResultList();
			for(int i=0; i < lc.size(); i++){
				Repuesto r = lc.get(i);
				RepuestoBean rb = new RepuestoBean();
				rb.setIdRepuesto(r.getIdRepuesto());
				rb.setNombre(r.getNombre());
				rb.setIdTipoRepuesto(r.getRepTipoRepuesto().getIdTipoRepuesto());
				rb.setNombreTipoRepuesto(r.getRepTipoRepuesto().getNombre());
				lcb.add(rb);
			}
		} catch (IllegalArgumentException e) {
			lcb = null;			
		}

		return lcb;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<RepuestoBean> listarRepuestosRevision(Integer idRevision) {
		List<RepuestoRevision> listaRepuesto = new ArrayList<RepuestoRevision>();
		List<RepuestoBean> listaRepuestoBean = new ArrayList<RepuestoBean>();		
		try {
			Query q = em.createQuery("SELECT rr FROM RepuestoRevision rr JOIN rr.rerRevision r WHERE r.idRevision=:idRevision");
			q.setParameter("idRevision", idRevision);
			listaRepuesto = q.getResultList();
			for(int i=0; i < listaRepuesto.size(); i++){
				RepuestoRevision r = listaRepuesto.get(i);
				RepuestoBean rb = new RepuestoBean();
				rb.setIdRepuesto(r.getRerRepuesto().getIdRepuesto());
				rb.setComentario(r.getComentario());
				rb.setCostoUnitario(r.getCostoUnitario());
				rb.setNombre(r.getRerRepuesto().getNombre());
				rb.setNombreTipoRepuesto(r.getRerRepuesto().getRepTipoRepuesto().getNombre());
				rb.setCostoTotal(r.getRerRevision().getCostoTotal());
				//
				rb.setCantidad(r.getCantidad());
				rb.setCostoUnitario(r.getCostoUnitario());
				rb.setCosto(r.getCosto());
				
				listaRepuestoBean.add(rb);
			}
		} catch (IllegalArgumentException e) {
			listaRepuestoBean = null;			
		}

		return listaRepuestoBean;
	}

	@Transactional
	public List<String> administrarRepuestosRevision(String[] ids,String[] cantidadR,String[] costoUR, Integer IdRevision) {
		List<String> enviados = new ArrayList<String>();
		try {
			for (int i = 0; i < ids.length; i++) {				
				RepuestoRevision repuestov = new RepuestoRevision();
				Repuesto rep = em.find(Repuesto.class, Integer.parseInt(ids[i]));
				//Revision rev = new Revision();
				//rev.setIdRevision(IdRevision);
				Revision rev = em.find(Revision.class, IdRevision);
				repuestov.setRerRepuesto(rep);
				repuestov.setRerRevision(rev);
				repuestov.setCantidad(Integer.parseInt(cantidadR[i]));
				repuestov.setCostoUnitario(Double.parseDouble(costoUR[i]));
				repuestov.setCosto(repuestov.getCostoUnitario()*repuestov.getCantidad());
				enviados.add( rep.getNombre()+" "+rep.getRepTipoRepuesto().getNombre());
				em.persist(repuestov);
				sumarCostoTotal(IdRevision);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return enviados;
	}

	@Transactional
	public boolean eliminarRepuestoRev(RepuestoRevisionBean RepuestoRevisionB) {
		boolean resultado = false;

		
		RepuestoRevision repuestorevision = new RepuestoRevision();

		try {					
			Query q1 = em.createQuery("SELECT rr FROM RepuestoRevision rr JOIN rr.rerRevision r JOIN rr.rerRepuesto p WHERE r.idRevision=:idrevision AND p.idRepuesto=:idrepuesto");
			q1.setParameter("idrevision", RepuestoRevisionB.getIdRevision());
			q1.setParameter("idrepuesto", RepuestoRevisionB.getIdRepuesto());			
			repuestorevision = (RepuestoRevision) q1.getSingleResult();	
			
			
	        em.remove(repuestorevision);				
	        sumarCostoTotal(RepuestoRevisionB.getIdRevision());
		    resultado = true;
			
				
			
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}

	@Transactional
	public boolean editarRepuestoRev(RepuestoRevisionBean repuestoRevisionB,HttpServletRequest req) {
		boolean resultado = false;
				
		RepuestoRevision repuestoRevision = new RepuestoRevision();
		Repuesto rep = new Repuesto();
		Revision rev = new Revision();
		
		try{
			
			Query q1 = em.createQuery("SELECT rr FROM RepuestoRevision rr JOIN rr.rerRevision r JOIN rr.rerRepuesto p WHERE r.idRevision=:idrevision AND p.idRepuesto=:idrepuesto");
			q1.setParameter("idrevision", repuestoRevisionB.getIdRevision());
			q1.setParameter("idrepuesto", repuestoRevisionB.getIdRepuesto());			
			repuestoRevision = (RepuestoRevision) q1.getSingleResult();
			
			repuestoRevision.setComentario(repuestoRevisionB.getComentario());
			repuestoRevision.setCantidad(repuestoRevisionB.getCantidad());
			repuestoRevision.setCostoUnitario(repuestoRevisionB.getCostoUnitario());
			repuestoRevision.setCosto(repuestoRevision.getCostoUnitario()*repuestoRevision.getCantidad());
			
			
			em.merge(repuestoRevision);
			sumarCostoTotal(repuestoRevisionB.getIdRevision());
			resultado = true;			
			
			
		} catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}
		
		return resultado;
		
		
		
		
	}
	
	@Transactional
	public void sumarCostoTotal(Integer idRevision) {
		Double costo=0.0;
		Revision rev = em.find(Revision.class, idRevision);
		try{
			
			
			Query q = em.createQuery("SELECT SUM(costo) FROM EmpleadoRevision WHERE idRevision=:idRevision");
			q.setParameter("idRevision", idRevision);
			if(q.getSingleResult()!=null){
			costo += Double.parseDouble(q.getSingleResult().toString());
			}
			
			Query q1 = em.createQuery("SELECT SUM(costo) FROM RepuestoRevision WHERE idRevision=:idRevision");
			q1.setParameter("idRevision", idRevision);
			if(q1.getSingleResult()!=null){
			costo+= Double.parseDouble(q1.getSingleResult().toString());
			}
		
			rev.setCostoTotal(costo);
			em.merge(rev);
			
		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());			
		}

	}
}
