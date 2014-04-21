package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.DistritoBean;
import com.scitemav.model.Distrito;

@Service
public class DistritoServiceImpl implements DistritoService{
	
	@PersistenceContext
	EntityManager em;

	@SuppressWarnings("unchecked")
	@Transactional
	public List<DistritoBean> listarDistritos() {
		List<Distrito> distrito = new ArrayList<Distrito>();
		List<DistritoBean> dbs = new ArrayList<DistritoBean>();
		try {
			Query q = em.createQuery("SELECT d FROM Distrito d");
			distrito = q.getResultList();		
			for(int i = 0 ; i < distrito.size(); i++ ){
				Distrito d = distrito.get(i);
				DistritoBean db = new DistritoBean();
				db.setIdDistrito(d.getIdDistrito());
				db.setNombre(d.getNombre());
				dbs.add(db);
			}
		} catch (IllegalArgumentException e) {
			dbs = null;			
		}

		return dbs;
	}


}
