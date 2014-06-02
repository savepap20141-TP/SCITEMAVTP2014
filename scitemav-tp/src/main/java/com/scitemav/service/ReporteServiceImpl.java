package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.model.EmpleadoRevision;
import com.scitemav.model.FallaRevision;
import com.scitemav.model.RepuestoRevision;
import com.scitemav.model.Revision;

@Service
public class ReporteServiceImpl implements ReporteService {

	@PersistenceContext
	EntityManager em;

	
	@SuppressWarnings("unchecked")
	@Transactional
	public String reporteRevision(Integer idRevision) {
		String html = "";		

		try{
			html+="<h1>Revision #"+idRevision+"</h1><br />";
			Query q = em.createQuery("SELECT r FROM Revision r WHERE idRevision ="+idRevision);
			Revision rev = (Revision) q.getSingleResult();			
			html+="Datos de la revisión: "+"<br />";
			html+="Fecha de inicio: "+rev.getFechaInicio().toString()+"<br />";
			html+="<br/>";
			html+="Datos del vehículo: "+"<br />";
			html+="Marca: "+rev.getRevVehiculo().getVehMarca().getNombre()+"<br />";
			html+="Modelo: "+rev.getRevVehiculo().getVehModelo().getNombre()+"<br />";
			html+="Tipo de vehiculo: "+rev.getRevVehiculo().getVehTipoVehiculo().getNombre()+"<br />";
			html+="Modelo: "+rev.getRevVehiculo().getVehModelo().getNombre()+"<br />";
			html+="Numero de placa: "+rev.getRevVehiculo().getNumeroPlaca()+"<br />";
			html+="Numero de motor: "+rev.getRevVehiculo().getNumeroMotor()+"<br />";
			html+="Color: "+rev.getRevVehiculo().getColor()+"<br />";
			html+="<br/>";
			html+="Datos del cliente: "+"<br />";
			html+="Nombre: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getNombre()+"<br />";
			html+="Apellido paterno: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getApellidoPaterno()+"<br />";
			html+="Apellido materno: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getApellidoMaterno()+"<br />";
			html+="Celular: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getCelular()+"<br />";
			html+="Direccion: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getDireccion()+"<br />";
			html+="Dni: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getDni()+"<br />";			
			html+="Telefono: "+rev.getRevVehiculo().getVehCliente().getCliPersona().getTelefono()+"<br />";
			html+="<br/>";
			html+="Datos de las fallas: "+"<br />";
			Query fallaQuery = em.createQuery("SELECT fxr FROM FallaRevision fxr WHERE farRevision.idRevision=:idR");
			fallaQuery.setParameter("idR", idRevision);
			List<FallaRevision> fallas = new ArrayList<>();
			fallas = fallaQuery.getResultList();
			
			for(int i=0; i<fallas.size(); i++){
				html+="Falla #"+(i+1)+" :<br />";
				html+="Descripcion: "+fallas.get(i).getFarFalla().getDescripcion()+"<br />";
				html+="Tipo de falla: "+fallas.get(i).getFarFalla().getFalTipoFalla().getNombreSistema()+"<br />";			
			}
			html+="<br/>";		
			html+="Datos de los repuestos: "+"<br />";
			Query repuestoQuery = em.createQuery("SELECT rxr FROM RepuestoRevision rxr WHERE rerRevision.idRevision=:idR");
			repuestoQuery.setParameter("idR", idRevision);
			List<RepuestoRevision> repuestos = new ArrayList<>();
			repuestos = repuestoQuery.getResultList();
			
			for(int i=0; i<repuestos.size(); i++){
				html+="Repuesto #"+(i+1)+" :<br />";
				html+="Nombre: "+repuestos.get(i).getRerRepuesto().getNombre()+"<br />";
				html+="Tipo de repuesto: "+repuestos.get(i).getRerRepuesto().getRepTipoRepuesto().getNombre()+"<br />";			
			}
			html+="<br/>";						
			html+="Datos de los empleados: "+"<br />";
			Query empleadoQuery = em.createQuery("SELECT exr FROM EmpleadoRevision exr WHERE reeRevision.idRevision=:idR");
			empleadoQuery.setParameter("idR", idRevision);
			List<EmpleadoRevision> empleados = new ArrayList<>();
			empleados = empleadoQuery.getResultList();
			
			for(int i=0; i<empleados.size(); i++){
				html+="Empleado #"+(i+1)+" :<br />";
				html+="Nombre: "+empleados.get(i).getReeEmpleado().getEmpPersona().getNombre()+"<br />";
				html+="Apellido Paterno: "+empleados.get(i).getReeEmpleado().getEmpPersona().getApellidoPaterno()+"<br />";
				html+="Apellido Materno: "+empleados.get(i).getReeEmpleado().getEmpPersona().getApellidoMaterno()+"<br />";
				html+="Celular: "+empleados.get(i).getReeEmpleado().getEmpPersona().getCelular()+"<br />";
				html+="Cargo: "+empleados.get(i).getReeEmpleado().getEmpCargo().getDescripcion()+"<br />";
			}								
			
		}
		catch(Exception ex){
			
		}	
		return html;
	}

}
