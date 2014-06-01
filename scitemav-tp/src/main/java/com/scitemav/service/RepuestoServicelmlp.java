package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.RepuestoBean;
import com.scitemav.model.Cliente;
import com.scitemav.model.Distrito;
import com.scitemav.model.Empleado;
import com.scitemav.model.Persona;
import com.scitemav.model.Repuesto;
import com.scitemav.model.RepuestoRevision;
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
		
			em.persist(rp);
		
			
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
				listaRepuestoBean.add(rb);
			}
		} catch (IllegalArgumentException e) {
			listaRepuestoBean = null;			
		}

		return listaRepuestoBean;
	}
	
}
