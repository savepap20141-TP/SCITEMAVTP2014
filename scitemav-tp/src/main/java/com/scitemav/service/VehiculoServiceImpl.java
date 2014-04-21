package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.model.Vehiculo;

@Service
public class VehiculoServiceImpl implements VehiculoService {

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(Vehiculo vehiculo) {
		boolean resultado = false;		

		try {
			if(!(vehiculo.getFabricacion().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				if(vehiculo.getIdVehiculo()==null){
					em.persist(vehiculo);
				}else{
					em.merge(vehiculo);
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
	public List<VehiculoBean> listarVehiculos() {
		List<Vehiculo> listaVehiculo = new ArrayList<Vehiculo>();
		List<VehiculoBean> listaVehiculoBean = new ArrayList<VehiculoBean>();		
		try {
			Query q = em.createQuery("SELECT v FROM Vehiculo v");
			listaVehiculo = q.getResultList();
			for(int i=0; i < listaVehiculo.size(); i++){
				Vehiculo v = listaVehiculo.get(i);
				VehiculoBean vb = new VehiculoBean();
				vb.setIdVehiculo(v.getIdVehiculo());
				vb.setAltura(v.getAltura());
				vb.setAncho(v.getAncho());
				vb.setCargaUtil(v.getCargaUtil());
				vb.setColor(v.getColor());
				vb.setFabricacion(v.getFabricacion());
				vb.setLongitud(v.getLongitud());
				vb.setNumeroAsientos(v.getNumeroAsientos());
				vb.setNumeroCilindros(v.getNumeroCilindros());
				vb.setNumeroEjes(v.getNumeroEjes());
				vb.setNumeroMotor(v.getNumeroMotor());
				vb.setNumeroPasajeros(v.getNumeroPasajeros());
				vb.setNumeroPlaca(v.getNumeroPlaca());
				vb.setNumeroRuedas(v.getNumeroRuedas());
				vb.setNumeroSerie(v.getNumeroSerie());
				vb.setPesoBruto(v.getPesoBruto());
				vb.setPesoSeco(v.getPesoSeco());
				vb.setVehCliente(v.getVehCliente());
				vb.setVehMarca(v.getVehMarca());
				vb.setVehModelo(v.getVehModelo());
				vb.setVehTipoVehiculo(v.getVehTipoVehiculo());				
				listaVehiculoBean.add(vb);
			}
		} catch (IllegalArgumentException e) {
			listaVehiculoBean = null;			
		}

		return listaVehiculoBean;
	}

}
