package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.CargoBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Cargo;
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

	@SuppressWarnings("unchecked")
	@Transactional
	public List<TipoVehiculoBean> listarTipoVehiculos() {
		List<TipoVehiculo> tipveh = new ArrayList<TipoVehiculo>();
		List<TipoVehiculoBean> tipvehb = new ArrayList<TipoVehiculoBean>();		
		try {
			Query q = em.createQuery("SELECT tv FROM TipoVehiculo tv");
			tipveh = q.getResultList();
			for(int i=0; i < tipveh.size(); i++){
				TipoVehiculo tv = tipveh.get(i);
				TipoVehiculoBean tvb = new TipoVehiculoBean();
				tvb.setIdTipoVehiculo(tv.getIdTipoVehiculo());
				tvb.setNombre(tv.getNombre());
				tipvehb.add(tvb);
			}
		} catch (IllegalArgumentException e) {
			tipvehb = null;			
		}

		return tipvehb;
	}
}
