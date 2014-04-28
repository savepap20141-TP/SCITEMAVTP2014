package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.EspecialidadBean;
import com.scitemav.model.Especialidad;
@Service
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
				Especialidad e = lesp.get(i);
				EspecialidadBean eb = new EspecialidadBean();
				eb.setIdEspecialidad(e.getIdEspecialidad());
				eb.setDescripcion(e.getDescripcion());
				lespb.add(eb);
			}
		} catch (IllegalArgumentException e) {
			lespb = null;			
		}

		return lespb;
	}
}
