package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.ModeloBean;
import com.scitemav.model.Cliente;
import com.scitemav.model.Distrito;
import com.scitemav.model.Marca;
import com.scitemav.model.Modelo;
import com.scitemav.model.Persona;
import com.scitemav.model.Usuario;

@Service
public class ModeloServiceImpl implements ModeloService  {

	
	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(ModeloBean modeloBean) {
		boolean resultado = false;
		
		Modelo modelo = new Modelo();
		Marca marca = new Marca();

		try{
			
			marca.setIdMarca(modeloBean.getIdMarca());
			
			modelo.setModMarca(marca);
			modelo.setNombre(modeloBean.getNombre());
			
			em.persist(modelo);
			
			resultado = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}		
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<ModeloBean> listarModelos() {
		List<Modelo> lm = new ArrayList<Modelo>();
		List<ModeloBean> lmb = new ArrayList<ModeloBean>();		
		try {
			Query q = em.createQuery("SELECT m FROM Modelo m");
			lm = q.getResultList();
			for(int i=0; i < lm.size(); i++){
				Modelo m = lm.get(i);
				ModeloBean mb = new ModeloBean();
				
				mb.setIdModelo(m.getIdModelo());
				mb.setNombre(m.getNombre());
				mb.setIdMarca(m.getModMarca().getIdMarca());
				
				lmb.add(mb);
			}
		} catch (IllegalArgumentException e) {
			lmb = null;			
		}

		return lmb;
	}

}
