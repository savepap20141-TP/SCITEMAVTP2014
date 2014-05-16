package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.FallaBean;
import com.scitemav.model.Falla;
import com.scitemav.model.TipoFalla;
@Service
public class FallaServicelmpl implements FallaService{
	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(FallaBean fal) {
		boolean falla = false;
		TipoFalla tr = new TipoFalla();
		Falla rp = new Falla();				

		try{			
			TipoFalla tfa  = new TipoFalla();
			tfa.setIdTipoFalla(fal.getIdTipoFalla());
			
			rp.setFalTipoFalla(tfa);
			rp.setDescripcion(fal.getDescripcion());
		 
			em.persist(rp);
		
			
			falla = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			falla = false;
		}		
		return falla;

	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<FallaBean> listarFallas() {
		List<Falla> lc = new ArrayList<Falla>();
		List<FallaBean> lcb = new ArrayList<FallaBean>();		
		try {
			Query q = em.createQuery("SELECT f FROM Falla f");
			lc = q.getResultList();
			for(int i=0; i < lc.size(); i++){
				Falla r = lc.get(i);
				FallaBean rb = new FallaBean();
				rb.setIdFalla(r.getIdFalla());
				rb.setDescripcion(r.getDescripcion());
				rb.setIdTipoFalla(r.getFalTipoFalla().getIdTipoFalla());
				rb.setNombreTipoFalla(r.getFalTipoFalla().getNombreSistema());
				lcb.add(rb);
			}
		} catch (IllegalArgumentException e) {
			lcb = null;			
		}

		return lcb;
	}
}