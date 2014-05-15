package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.TipoFallaBean;
import com.scitemav.model.TipoFalla;
@Service
public class TipoFallaServicelmpl implements TipoFallaService {
	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(TipoFalla tr) {
		boolean resultado = false;

		try {
			if(!(tr.getNombreSistema().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				if(tr.getIdTipoFalla()==null){
					em.persist(tr);
				}else{
					em.merge(tr);
				}
				resultado = true;
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<TipoFallaBean> listarTipoFallas() {
		List<TipoFalla> tr = new ArrayList<TipoFalla>();
		List<TipoFallaBean> trb = new ArrayList<TipoFallaBean>();		
		try {
			Query q = em.createQuery("SELECT tr FROM TipoFalla tr");
			tr = q.getResultList();
			for(int i=0; i < tr.size(); i++){
				TipoFalla trep = tr.get(i);
				TipoFallaBean trepb = new TipoFallaBean();
				trepb.setIdTipoFalla((trep.getIdTipoFalla()));
				trepb.setNombreTipoFalla(trep.getNombreSistema());
				trb.add(trepb);
			}
		} catch (IllegalArgumentException e) {
			trb = null;			
		}

		return trb;
	}

}
