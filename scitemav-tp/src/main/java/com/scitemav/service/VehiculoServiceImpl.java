package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

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
			vb.setIdVehiculo(veh.getIdVehiculo());
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
				vb.setNombreCliente(v.getVehCliente().getCliPersona().getNombre()+" "+v.getVehCliente().getCliPersona().getApellidoPaterno()+" "+v.getVehCliente().getCliPersona().getApellidoMaterno());
				vb.setIdMarca(v.getVehMarca().getIdMarca());
				vb.setNombreMarca(v.getVehMarca().getNombre());
				vb.setIdModelo(v.getVehModelo().getIdModelo());
				vb.setNombreModelo(v.getVehModelo().getNombre());
				vb.setIdTipoVehiculo(v.getVehTipoVehiculo().getIdTipoVehiculo());		
				vb.setNombreTipoVehiculo(v.getVehTipoVehiculo().getNombre());
				listaVehiculoBean.add(vb);
			}
		} catch (IllegalArgumentException e) {
			listaVehiculoBean = null;			
		}

		return listaVehiculoBean;
	}

	@Transactional
	public VehiculoBean obtenerInfo(int idVehiculo) {
		VehiculoBean vBean = null;	
		try{
			vBean = new VehiculoBean();
			Query q = em.createQuery("from Vehiculo where idVehiculo="+idVehiculo);
			Vehiculo v = new Vehiculo();
			v = (Vehiculo)q.getSingleResult();
			
			vBean.setAltura(v.getAltura());
			vBean.setAncho(v.getAncho());
			vBean.setCargaUtil(v.getCargaUtil());
			vBean.setColor(v.getColor());
			vBean.setFabricacion(v.getFabricacion());
			vBean.setIdCliente(v.getVehCliente().getIdCliente());
			vBean.setIdMarca(v.getVehMarca().getIdMarca());
			vBean.setIdModelo(v.getVehModelo().getIdModelo());
			vBean.setIdVehiculo(v.getIdVehiculo());
			vBean.setLongitud(v.getLongitud());
			vBean.setNumeroAsientos(v.getNumeroAsientos());
			vBean.setNumeroCilindros(v.getNumeroCilindros());
			vBean.setNumeroEjes(v.getNumeroEjes());
			vBean.setNumeroMotor(v.getNumeroMotor());
			vBean.setNumeroPasajeros(v.getNumeroPasajeros());
			vBean.setNumeroPlaca(v.getNumeroPlaca());
			vBean.setNumeroRuedas(v.getNumeroRuedas());
			vBean.setNumeroSerie(v.getNumeroSerie());
			vBean.setPesoBruto(v.getPesoBruto());
			vBean.setPesoSeco(v.getPesoSeco());	
			vBean.setNombreCliente(v.getVehCliente().getCliPersona().getNombre()+" "+v.getVehCliente().getCliPersona().getApellidoPaterno());
			vBean.setNombreMarca(v.getVehMarca().getNombre());
			vBean.setNombreModelo(v.getVehModelo().getNombre());
			vBean.setNombreTipoVehiculo(v.getVehTipoVehiculo().getNombre());
			vBean.setPrimerNombreCliente(v.getVehCliente().getCliPersona().getNombre());
			vBean.setApePaternoCliente(v.getVehCliente().getCliPersona().getApellidoPaterno());
			vBean.setApeMaternoCliente(v.getVehCliente().getCliPersona().getApellidoMaterno());
			vBean.setCelularCliente(v.getVehCliente().getCliPersona().getCelular());
			vBean.setTelefonoCliente(v.getVehCliente().getCliPersona().getTelefono());
			vBean.setDniCliente(v.getVehCliente().getCliPersona().getDni().toString());
		}
		catch(IllegalArgumentException e){
			System.out.println(e.getMessage());
		}
		return vBean;
	}

	@Transactional
	public boolean editInformacionVehiculo(VehiculoBean vb) {
		boolean resultado = false;		
		Vehiculo veh = new Vehiculo();
		try {

			veh.setIdVehiculo(vb.getIdVehiculo());
			//
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
			em.merge(veh);
			resultado = true;
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<VehiculoBean> listarVehiculosCliente(Integer idCliente) {
		List<Vehiculo> listaVehiculo = new ArrayList<Vehiculo>();
		List<VehiculoBean> listaVehiculoBean = new ArrayList<VehiculoBean>();		
		try {
			Query q = em.createQuery("SELECT v FROM Vehiculo v JOIN v.vehCliente c WHERE c.idCliente=:idCliente");
			q.setParameter("idCliente", idCliente);
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
				vb.setNombreCliente(v.getVehCliente().getCliPersona().getNombre()+" "+v.getVehCliente().getCliPersona().getApellidoPaterno()+" "+v.getVehCliente().getCliPersona().getApellidoMaterno());
				vb.setIdMarca(v.getVehMarca().getIdMarca());
				vb.setNombreMarca(v.getVehMarca().getNombre());
				vb.setIdModelo(v.getVehModelo().getIdModelo());
				vb.setNombreModelo(v.getVehModelo().getNombre());
				vb.setIdTipoVehiculo(v.getVehTipoVehiculo().getIdTipoVehiculo());		
				vb.setNombreTipoVehiculo(v.getVehTipoVehiculo().getNombre());
				listaVehiculoBean.add(vb);
			}
		} catch (IllegalArgumentException e) {
			listaVehiculoBean = null;			
		}

		return listaVehiculoBean;
	}
	
	@Transactional
	public Boolean getDuplicatePlaca(String numPlaca) {
		Integer encontro = 0;
		Boolean resultado = false;
		try {
			Query q = em.createQuery("SELECT COUNT(v.idVehiculo) FROM Vehiculo v WHERE v.numeroPlaca=:numeroPlaca");
			q.setParameter("numeroPlaca", numPlaca);
			encontro = Integer.parseInt(q.getSingleResult().toString());
			if(encontro > 0){
				resultado=true;
			}else{
				resultado=false;
			}		
		} catch (IllegalArgumentException e) {
			resultado = false;			
		}

		return resultado;
	}
}
