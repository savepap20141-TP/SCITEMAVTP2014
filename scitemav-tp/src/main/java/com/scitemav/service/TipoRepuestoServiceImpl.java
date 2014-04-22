package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.TipoRepuestoBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.TipoRepuesto;
import com.scitemav.model.TipoVehiculo;
@Service
public class TipoRepuestoServiceImpl implements TipoRepuestoService {

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(TipoRepuesto tr) {
		boolean resultado = false;

		//TipoVehiculo tipovehiculo = new TipoVehiculo();

		try {
			if(!(tr.getNombre().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				if(tr.getIdTipoRepuesto()==null){
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
	public List<TipoRepuestoBean> listarTipoRepuestos() {
		List<TipoRepuesto> tr = new ArrayList<TipoRepuesto>();
		List<TipoRepuestoBean> trb = new ArrayList<TipoRepuestoBean>();		
		try {
			Query q = em.createQuery("SELECT tr FROM TipoRepuesto tr");
			tr = q.getResultList();
			for(int i=0; i < tr.size(); i++){
				TipoRepuesto trep = tr.get(i);
				TipoRepuestoBean trepb = new TipoRepuestoBean();
				trepb.setIdTipoRepuesto((trep.getIdTipoRepuesto()));
				trepb.setNombre(trep.getNombre());
				trb.add(trepb);
			}
		} catch (IllegalArgumentException e) {
			trb = null;			
		}

		return trb;
	}

}
