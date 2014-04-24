package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.EspecialidadBean;
import com.scitemav.model.Especialidad;

public class EspecialidadServiceImpl implements EspecialidadService{

	@PersistenceContext
	EntityManager em;

	@SuppressWarnings("unchecked")
	@Transactional
	public List<EspecialidadBean> listarEspecialidades() {
		List<Especialidad> lesp = new ArrayList<Especialidad>();
		List<EspecialidadBean> lespb = new ArrayList<EspecialidadBean>();		
		try {
			Query q = em.createQuery("SELECT es FROM Especialidad es");
			lesp = q.getResultList();
			for(int i=0; i < lesp.size(); i++){
				Especialidad c = lesp.get(i);
				EspecialidadBean cb = new EspecialidadBean();
				cb.setIdEspecialidad(c.getIdEspecialidad());
				cb.setDescripcion(c.getDescripcion());
				lespb.add(cb);
			}
		} catch (IllegalArgumentException e) {
			lespb = null;			
		}

		return lespb;
	}
}
