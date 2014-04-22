package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.MarcaBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Marca;
import com.scitemav.model.TipoVehiculo;

@Service
public class MarcaServiceImpl implements MarcaService {
	
	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean registro(Marca marca) {
		boolean resultado = false;

		//TipoVehiculo tipovehiculo = new TipoVehiculo();

		try {
			if(!(marca.getNombre().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				if(marca.getIdMarca()==null){
					em.persist(marca);
				}else{
					em.merge(marca);
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
	public List<MarcaBean> listarMarcas() {
		List<Marca> listaMarca = new ArrayList<Marca>();
		List<MarcaBean> listaMarcaBean = new ArrayList<MarcaBean>();		
		try {
			Query q = em.createQuery("SELECT m FROM Marca m");
			listaMarca = q.getResultList();
			for(int i=0; i < listaMarca.size(); i++){
				Marca marca = listaMarca.get(i);
				MarcaBean marcaBean = new MarcaBean();
				marcaBean.setIdMarca(marca.getIdMarca());
				marcaBean.setNombre(marca.getNombre());				
				listaMarcaBean.add(marcaBean);
			}
		} catch (IllegalArgumentException e) {
			listaMarcaBean = null;			
		}

		return listaMarcaBean;
	}

}
