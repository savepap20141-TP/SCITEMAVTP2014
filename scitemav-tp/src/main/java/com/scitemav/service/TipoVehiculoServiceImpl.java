package com.scitemav.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoVehiculo;

@Service
public class TipoVehiculoServiceImpl implements TipoVehiculoService {

	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean registro(TipoVehiculo tipv) {

		boolean resultado = false;

		//TipoVehiculo tipovehiculo = new TipoVehiculo();

		try {
			if(!(tipv.getNombre().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				em.persist(tipv);
				resultado = true;
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}

}
