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
import com.scitemav.model.Cliente;
import com.scitemav.model.Marca;
import com.scitemav.model.Modelo;
import com.scitemav.model.TipoVehiculo;
import com.scitemav.model.Vehiculo;

@Service
public class VehiculoServiceImpl implements VehiculoService {

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(VehiculoBean vb) {
		boolean resultado = false;		
		Vehiculo veh = new Vehiculo();
		try {
			Cliente cli = new Cliente();
			cli.setIdCliente(vb.getIdCliente());			
			veh.setVehCliente(cli);
			//
			Marca mar = new Marca();
			mar.setIdMarca(vb.getIdMarca());
			veh.setVehMarca(mar);
			//
			TipoVehiculo tv = new TipoVehiculo();
			tv.setIdTipoVehiculo(vb.getIdTipoVehiculo());
			veh.setVehTipoVehiculo(tv);
			//
			Modelo mod = new Modelo();
			mod.setIdModelo(vb.getIdModelo());
			veh.setVehModelo(mod);
			//
			veh.setAltura(vb.getAltura());
			veh.setAncho(vb.getAncho());
			veh.setCargaUtil(vb.getCargaUtil());
			veh.setColor(vb.getColor());
			veh.setFabricacion(vb.getFabricacion());
			veh.setLongitud(vb.getLongitud());
			veh.setNumeroAsientos(vb.getNumeroAsientos());
			veh.setNumeroCilindros(vb.getNumeroCilindros());
			veh.setNumeroEjes(vb.getNumeroEjes());
			veh.setNumeroMotor(vb.getNumeroMotor());
			veh.setNumeroPasajeros(vb.getNumeroPasajeros());
			veh.setNumeroPlaca(vb.getNumeroPlaca());
			veh.setNumeroRuedas(vb.getNumeroRuedas());
			veh.setNumeroSerie(vb.getNumeroSerie());
			veh.setPesoBruto(vb.getPesoBruto());
			veh.setPesoSeco(vb.getPesoSeco());
			em.persist(veh);
			resultado = true;
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
				vb.setIdCliente(v.getVehCliente().getIdCliente());
				vb.setIdMarca(v.getVehMarca().getIdMarca());
				vb.setIdModelo(v.getVehModelo().getIdModelo());
				vb.setIdTipoVehiculo(v.getVehTipoVehiculo().getIdTipoVehiculo());				
				listaVehiculoBean.add(vb);
			}
		} catch (IllegalArgumentException e) {
			listaVehiculoBean = null;			
		}

		return listaVehiculoBean;
	}

}
