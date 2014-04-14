package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.CargoBean;
import com.scitemav.model.Cargo;

@Service
public class CargoServiceImpl implements CargoService {

	@PersistenceContext
	EntityManager em;

	@SuppressWarnings("unchecked")
	@Transactional
	public List<CargoBean> listarCargos() {
		List<Cargo> cargos = new ArrayList<Cargo>();
		List<CargoBean> cargosb = new ArrayList<CargoBean>();		
		try {
			Query q = em.createQuery("SELECT c FROM Cargo c");
			cargos = q.getResultList();
			for(int i=0; i < cargos.size(); i++){
				Cargo c = cargos.get(i);
				CargoBean cb = new CargoBean();
				cb.setIdCargo(c.getIdCargo());
				cb.setDescripcion(c.getDescripcion());
				cargosb.add(cb);
			}
		} catch (IllegalArgumentException e) {
			cargosb = null;			
		}

		return cargosb;
	}

}
