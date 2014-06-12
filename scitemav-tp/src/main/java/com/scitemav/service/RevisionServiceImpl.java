package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.MarcaBean;
import com.scitemav.bean.RevisionBean;
import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.Empleado;
import com.scitemav.model.EmpleadoRevision;
import com.scitemav.model.Marca;
import com.scitemav.model.Persona;
import com.scitemav.model.Revision;
import com.scitemav.model.Vehiculo;

@Service
public class RevisionServiceImpl implements RevisionService {

	@PersistenceContext
	EntityManager em;
	
	@Autowired
	EmailService emailService;

	@Transactional
	public boolean registrarRevision(RevisionBean revision) {

		boolean flag = true;
		Revision rev = new Revision();
		Vehiculo veh = new Vehiculo();
      
		
		try {
			veh.setIdVehiculo(revision.getIdVehiculo());

			rev.setRevVehiculo(veh);
			rev.setCostoTotal(revision.getCostoTotal());
			rev.setFechaFin(revision.getFechaFin());
			rev.setFechaInicio(revision.getFechaInicio());
			rev.setFechaProxima(revision.getFechaProxima());
			rev.setKilometrajeActual(revision.getKilometrajeActual());
			rev.setKilometrajeProximo(revision.getKilometrajeProximo());
			rev.setEstado("Creada");

			em.persist(rev);
			revision.setIdRevision(rev.getIdRevision());

			flag = true;

		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			flag = false;
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<RevisionBean> listarRevisiones() {
		List<Revision> _rev = new ArrayList<Revision>();
		List<RevisionBean> _revBean = new ArrayList<RevisionBean>();

		try {
			Query query = em.createQuery("SELECT r FROM Revision r");
			_rev = query.getResultList();

			for (int i = 0; i < _rev.size(); i++) {
				Revision rev = _rev.get(i);
				RevisionBean revBean = new RevisionBean();								
				
				revBean.setCostoTotal(rev.getCostoTotal());
				revBean.setFechaFin(rev.getFechaFin());
				revBean.setFechaInicio(rev.getFechaInicio());
				revBean.setFechaProxima(rev.getFechaProxima());
				revBean.setKilometrajeActual(rev.getKilometrajeActual());
				revBean.setKilometrajeProximo(rev.getKilometrajeProximo());
				revBean.setIdRevision(rev.getIdRevision());
				revBean.setIdVehiculo(rev.getRevVehiculo().getIdVehiculo());
				revBean.setIdCliente(rev.getRevVehiculo().getVehCliente().getIdCliente());
				revBean.setNumeroPlaca(rev.getRevVehiculo().getNumeroPlaca());
				revBean.setNombreMarca(rev.getRevVehiculo().getVehMarca().getNombre());
				revBean.setNombreModelo(rev.getRevVehiculo().getVehModelo().getNombre());
				if(rev.getNotificacion()!=null){
					if(rev.getNotificacion()==true){
						revBean.setNotificacion(true);
					}else{
						revBean.setNotificacion(false);
					}
				}else{
					revBean.setNotificacion(false);
				}
				Persona per = rev.getRevVehiculo().getVehCliente().getCliPersona();
				revBean.setNombreCliente(per.getNombre()+" "+per.getApellidoPaterno()+" "+per.getApellidoMaterno());
				
				_revBean.add(revBean);
			}

		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			_revBean = null;
		}

		return _revBean;
	}

	@Transactional
	public RevisionBean obtenerInfo(int idRevision) {
		RevisionBean rBean = null;		
		try {
			rBean = new RevisionBean();
			Query q = em.createQuery("from Revision where idRevision="+idRevision);
			Revision r = new Revision();
			r = (Revision) q.getSingleResult();
			
			rBean.setIdRevision(r.getIdRevision());
			rBean.setCostoTotal(r.getCostoTotal());
			rBean.setFechaInicio(r.getFechaInicio());
			rBean.setFechaFin(r.getFechaFin());
			rBean.setFechaProxima(r.getFechaProxima());
			rBean.setKilometrajeActual(r.getKilometrajeActual());
			rBean.setKilometrajeProximo(r.getKilometrajeProximo());
			
			
			rBean.setAltura(r.getRevVehiculo().getAltura());
			rBean.setAncho(r.getRevVehiculo().getAncho());
			rBean.setCargaUtil(r.getRevVehiculo().getCargaUtil());
			rBean.setColor(r.getRevVehiculo().getColor());
			rBean.setFabricacion(r.getRevVehiculo().getFabricacion());
			rBean.setIdCliente(r.getRevVehiculo().getVehCliente().getIdCliente());
			rBean.setIdMarca(r.getRevVehiculo().getVehMarca().getIdMarca());
			rBean.setIdModelo(r.getRevVehiculo().getVehModelo().getIdModelo());
			rBean.setIdTipoVehiculo(r.getRevVehiculo().getVehTipoVehiculo().getIdTipoVehiculo());
			rBean.setIdVehiculo(r.getRevVehiculo().getIdVehiculo());
			rBean.setLongitud(r.getRevVehiculo().getLongitud());			
			rBean.setNumeroAsientos(r.getRevVehiculo().getNumeroAsientos());
			rBean.setNumeroCilindros(r.getRevVehiculo().getNumeroCilindros());
			rBean.setNumeroEjes(r.getRevVehiculo().getNumeroEjes());
			rBean.setNumeroMotor(r.getRevVehiculo().getNumeroMotor());
			rBean.setNumeroPasajeros(r.getRevVehiculo().getNumeroPasajeros());
			rBean.setNumeroPlaca(r.getRevVehiculo().getNumeroPlaca());
			rBean.setNumeroRuedas(r.getRevVehiculo().getNumeroRuedas());
			rBean.setNumeroSerie(r.getRevVehiculo().getNumeroSerie());
			rBean.setPesoBruto(r.getRevVehiculo().getPesoBruto());
			rBean.setPesoSeco(r.getRevVehiculo().getPesoSeco());	
			rBean.setNombreMarca(r.getRevVehiculo().getVehMarca().getNombre());
			rBean.setNombreModelo(r.getRevVehiculo().getVehModelo().getNombre());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
		return rBean;
	}

	@Transactional
	public boolean editInformacionRevision(RevisionBean rb) {
		boolean result = false;
		Revision rev = new Revision();
		try{
			rev.setIdRevision(rb.getIdRevision());
			//
			Vehiculo veh = new Vehiculo();
			veh.setIdVehiculo(rb.getIdVehiculo());
			rev.setRevVehiculo(veh);
			//
			rev.setCostoTotal(rb.getCostoTotal());
			rev.setFechaInicio(rb.getFechaInicio());
			rev.setFechaFin(rb.getFechaFin());
			rev.setFechaProxima(rb.getFechaProxima());
			rev.setKilometrajeActual(rb.getKilometrajeActual());
			rev.setKilometrajeProximo(rb.getKilometrajeProximo());
			rev.setEstado("Inspeccionada");
			em.merge(rev);
			result = true;			
		} catch(IllegalArgumentException e){
			System.out.println(e);
			result = false;
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<RevisionBean> listarRevisionesVehiculo(Integer idVehiculo) {
		List<Revision> _rev = new ArrayList<Revision>();
		List<RevisionBean> _revBean = new ArrayList<RevisionBean>();

		try {
			Query query = em.createQuery("SELECT r FROM Revision r JOIN r.revVehiculo v WHERE v.idVehiculo=:idVehiculo");
			query.setParameter("idVehiculo", idVehiculo);
			_rev = query.getResultList();

			for (int i = 0; i < _rev.size(); i++) {
				Revision rev = _rev.get(i);
				RevisionBean revBean = new RevisionBean();								
				
				revBean.setCostoTotal(rev.getCostoTotal());
				revBean.setFechaFin(rev.getFechaFin());
				revBean.setFechaInicio(rev.getFechaInicio());
				revBean.setFechaProxima(rev.getFechaProxima());
				revBean.setKilometrajeActual(rev.getKilometrajeActual());
				revBean.setKilometrajeProximo(rev.getKilometrajeProximo());
				revBean.setIdRevision(rev.getIdRevision());
				revBean.setIdVehiculo(rev.getRevVehiculo().getIdVehiculo());
				revBean.setNumeroPlaca(rev.getRevVehiculo().getNumeroPlaca());
				revBean.setNombreMarca(rev.getRevVehiculo().getVehMarca().getNombre());
				revBean.setNombreModelo(rev.getRevVehiculo().getVehModelo().getNombre());
				_revBean.add(revBean);
			}

		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			_revBean = null;
		}

		return _revBean;
	}
	
	@Transactional
	public List<String> notificarRevisionesClientes(String[] ids) {
		List<String> enviados = new ArrayList<String>();
		try {
			for (int i = 0; i < ids.length; i++) {				
				Revision rev = em.find(Revision.class, Integer.parseInt(ids[i]));
				Revision revY = em.merge(rev);
				revY.setNotificacion(true);
				Persona per = rev.getRevVehiculo().getVehCliente().getCliPersona();
				enviados.add( per.getNombre()+" "+per.getApellidoPaterno()+" "+per.getApellidoMaterno());
				//Metodo para enviar correo
				emailService.NotificarRevisionesUsuario(Integer.parseInt(ids[i]), per.getPerUsuario().getIdUsuario());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return enviados;
	}
}
