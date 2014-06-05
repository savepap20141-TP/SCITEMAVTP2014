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
import com.scitemav.model.Vehiculo;

@Service
public class ReporteServiceImpl implements ReporteService {

	@PersistenceContext
	EntityManager em;

	
	@SuppressWarnings("unchecked")
	@Transactional
	public String reporteRevision(Integer idRevision) {
		String html = "<html><head>" +
					  "</head><body style='font-family: arial;'>";		

		try{		
			html+="<h2 style='text-align: center; text-transform:uppercase;'>Revision #"+idRevision+"</h2><br />";
			Query q = em.createQuery("SELECT r FROM Revision r WHERE idRevision ="+idRevision);
			Revision rev = (Revision) q.getSingleResult();				
			html+="<h3>Datos de la revisión:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>Fecha de inicio</th>";
			html+="<th>Fecha de fin</th>";
			html+="<th>Fecha de Próxima Revision</th>";
			html+="<th>Kilometraje actual</th>";
			html+="<th>Kilometraje próximo</th>";
			html+="<th>Costo total</th>";
			
			html+="</tr></thead><tbody><tr>";
			html+="<td>"+rev.getFechaInicio().toString()+"</td>";
			if(rev.getFechaFin() == null){
				html+="<td>No se ha definido</td>";
			}
			else{
				html+="<td>"+rev.getFechaFin().toString()+"</td>";
			}			
			if(rev.getFechaProxima() == null){
				html+="<td>No se ha definido</td>";
			}
			else{
				html+="<td>"+rev.getFechaProxima().toString()+"</td>";
			}
			if(rev.getKilometrajeActual() == null){
				html+="<td>No se ha definido</td>";
			}
			else{
				html+="<td>"+rev.getKilometrajeActual()+"</td>";
			}			
			if(rev.getKilometrajeProximo() == null){
				html+="<td>No se ha definido</td>";
			}
			else{
				html+="<td>"+rev.getKilometrajeProximo()+"</td>";
			}
			if(rev.getCostoTotal() == null){
				html+="<td>No se ha definido</td>";
			}
			else{
				html+="<td>"+rev.getCostoTotal().toString()+"</td>";
			}
			
			html+="</tr></tbody></table>";
			html+="<br/>";
			
			html+="<h3>Datos del vehículo:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>Marca</th>";
			html+="<th>Modelo</th>";
			html+="<th>Tipo de vehiculo</th>";
			html+="<th>Numero Placa</th>";
			html+="<th>Numero Motor</th>";
			html+="<th>Color</th>";
			html+="</tr></thead><tbody><tr>";
			html+="<td>"+rev.getRevVehiculo().getVehMarca().getNombre()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehModelo().getNombre()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehTipoVehiculo().getNombre()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getNumeroPlaca()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getNumeroMotor()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getColor()+"</td>";
			html+="</tr></tbody></table>";
			html+="<br/>";
			
			html+="<h3>Datos del cliente:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>Nombre</th>";
			html+="<th>Ap. Paterno</th>";
			html+="<th>Ap. Materno</th>";
			html+="<th>Celular</th>";
			html+="<th>Direccion</th>";
			html+="<th>DNI</th>";
			html+="<th>Telefono</th>";
			html+="</tr></thead><tbody><tr>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getNombre()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getApellidoPaterno()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getApellidoMaterno()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getCelular()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getDireccion()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getDni()+"</td>";
			html+="<td>"+rev.getRevVehiculo().getVehCliente().getCliPersona().getTelefono()+"</td>";
			html+="</tr></tbody></table>";
			html+="<br/>";
			
			
			
			Query fallaQuery = em.createQuery("SELECT fxr FROM FallaRevision fxr WHERE farRevision.idRevision=:idR");
			fallaQuery.setParameter("idR", idRevision);
			List<FallaRevision> fallas = new ArrayList<>();
			fallas = fallaQuery.getResultList();
			if(fallas.size()!=0){
			html+="<h3>Datos de las fallas:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>#</th>";
			html+="<th>Descripcion</th>";
			html+="<th>Tipo de falla</th>";
			html+="</tr></thead><tbody>";
			for(int i=0; i<fallas.size(); i++){
				html+="<tr>";
				html+="<td>"+(i+1)+"</td>";
				html+="<td>"+fallas.get(i).getFarFalla().getDescripcion()+"</td>";
				html+="<td>"+fallas.get(i).getFarFalla().getFalTipoFalla().getNombreSistema()+"</td>";
				html+="</tr>";
			}
			html+="</tbody></table>";
			html+="<br/>";		
		}
			
			
			Query repuestoQuery = em.createQuery("SELECT rxr FROM RepuestoRevision rxr WHERE rerRevision.idRevision=:idR");
			repuestoQuery.setParameter("idR", idRevision);
			List<RepuestoRevision> repuestos = new ArrayList<>();
			repuestos = repuestoQuery.getResultList();
			if(repuestos.size()!=0){
			html+="<h3>Datos de los repuestos:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>#</th>";
			html+="<th>Nombre</th>";
			html+="<th>Tipo de Repuesto</th>";
			html+="</tr></thead><tbody>";		
			for(int i=0; i<repuestos.size(); i++){
				html+="<tr>";
				html+="<td>"+(i+1)+"</td>";
				html+="<td>"+repuestos.get(i).getRerRepuesto().getNombre()+"</td>";
				html+="<td>"+repuestos.get(i).getRerRepuesto().getRepTipoRepuesto().getNombre()+"</td>";
				html+="</tr>";
			}
			html+="</tbody></table>";
			html+="<br/>";			
			}
			
			
			Query empleadoQuery = em.createQuery("SELECT exr FROM EmpleadoRevision exr WHERE reeRevision.idRevision=:idR");
			empleadoQuery.setParameter("idR", idRevision);
			List<EmpleadoRevision> empleados = new ArrayList<>();
			empleados = empleadoQuery.getResultList();
			if(empleados.size()!=0){
			html+="<h3>Datos de los empleados:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>#</th>";
			html+="<th>Nombre</th>";
			html+="<th>Apellido Paterno</th>";
			html+="<th>Apellido Materno</th>";
			html+="<th>Celular</th>";
			html+="<th>Cargo</th>";
			html+="</tr></thead><tbody>";		
			for(int i=0; i<empleados.size(); i++){
				html+="<tr>";
				html+="<td>"+(i+1)+"</td>";
				html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getNombre()+"</td>";
				html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getApellidoPaterno()+"</td>";
				html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getApellidoMaterno()+"</td>";
				html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getCelular()+"</td>";
				html+="<td>"+empleados.get(i).getReeEmpleado().getEmpCargo().getDescripcion()+"</td>";
				html+="</tr>";
			}		
			html+="</tbody></table>";
			html+="<br/>";	
			}
			
		}
		catch(Exception ex){
			
		}	
		html+="</body></html>";
		return html;
	}


	@SuppressWarnings("unchecked")
	@Transactional
	public String reporteVehiculo(Integer idVehiculo, String rutaAbsoluta) {		
		String html = "<html><head>" +
				  "</head><body style='font-family: arial;'>";
		try{
			html+="<h2 style='text-align: center; text-transform:uppercase;'>Vehiculo #"+idVehiculo+"</h2><br />";			
			Query q = em.createQuery("SELECT v FROM Vehiculo v WHERE idVehiculo ="+idVehiculo);
			Vehiculo veh = (Vehiculo) q.getSingleResult();
			if(veh.getUrlImagen() == null){
				html+="<img align='middle' src='"+rutaAbsoluta+"vehiculo_defecto.jpg' height='300px;' width='300px;' ></img>";
				
			}
			else{
				html+="<img align='middle' src='"+rutaAbsoluta+veh.getUrlImagen()+"' height='300px;' width='300px;' ></img>";	
			}			
			
			html+="<h3>Datos del vehículo:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>Marca</th>";
			html+="<th>Modelo</th>";
			html+="<th>Tipo de vehículo</th>";
			html+="<th>Numero de placa</th>";
			html+="<th>Numero de motor</th>";
			html+="<th>Color</th>";
			html+="</tr></thead><tbody><tr>";
			html+="<td>"+veh.getVehMarca().getNombre()+"</td>";
			html+="<td>"+veh.getVehModelo().getNombre()+"</td>";
			html+="<td>"+veh.getVehTipoVehiculo().getNombre()+"</td>";
			html+="<td>"+veh.getNumeroPlaca()+"</td>";
			html+="<td>"+veh.getNumeroMotor()+"</td>";
			html+="<td>"+veh.getColor()+"</td>";
			html+="</tr></tbody></table>";								
			html+="<br/>";
			
			html+="<h3>Datos del cliente:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>Nombre</th>";
			html+="<th>Ap. Paterno</th>";
			html+="<th>Ap. Materno</th>";
			html+="<th>Celular</th>";
			html+="<th>Direccion</th>";
			html+="<th>DNI</th>";
			html+="<th>Telefono</th>";
			html+="</tr></thead><tbody><tr>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getNombre()+"</td>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getApellidoPaterno()+"</td>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getApellidoMaterno()+"</td>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getCelular()+"</td>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getDireccion()+"</td>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getDni()+"</td>";
			html+="<td>"+veh.getVehCliente().getCliPersona().getTelefono()+"</td>";
			html+="</tr></tbody></table>";	
			html+="<br/>";
						
			Query queryRevision = em.createQuery("SELECT r FROM Revision r WHERE revVehiculo.idVehiculo ="+idVehiculo);
			List<Revision> revisiones = new ArrayList<>();
			revisiones = (List<Revision>) queryRevision.getResultList();
			
			html+="<h3>Revisiones:</h3> "+"<br />";
			
			for(int i=0; i<revisiones.size(); i++){
				html+="<h4>Revision #"+(i+1)+"</h4><br />";
				html=auxiliarVehiculo(revisiones.get(i).getIdRevision(), html);
				html+="<br />";
			}			
			
		}
		catch(Exception e){
			
		}			
		html+="</body></html>";
		System.out.print(html);
		return html	;
	}
		
	@SuppressWarnings("unchecked")
	@Transactional
	public String auxiliarVehiculo(Integer idRevision, String html){
		Revision rev = em.find(Revision.class, idRevision);
		
		html+="<table align='center' border='1'><thead><tr>";
		html+="<th>Fecha de inicio</th>";
		html+="<th>Fecha de fin</th>";
		html+="<th>Fecha de Próxima Revision</th>";
		html+="<th>Kilometraje actual</th>";
		html+="<th>Kilometraje próximo</th>";
		html+="<th>Costo total</th>";
		
		html+="</tr></thead><tbody><tr>";
		html+="<td>"+rev.getFechaInicio().toString()+"</td>";
		if(rev.getFechaFin() == null){
			html+="<td>No se ha definido</td>";
		}
		else{
			html+="<td>"+rev.getFechaFin().toString()+"</td>";
		}			
		if(rev.getFechaProxima() == null){
			html+="<td>No se ha definido</td>";
		}
		else{
			html+="<td>"+rev.getFechaProxima().toString()+"</td>";
		}
		if(rev.getKilometrajeActual() == null){
			html+="<td>No se ha definido</td>";
		}
		else{
			html+="<td>"+rev.getKilometrajeActual()+"</td>";
		}			
		if(rev.getKilometrajeProximo() == null){
			html+="<td>No se ha definido</td>";
		}
		else{
			html+="<td>"+rev.getKilometrajeProximo()+"</td>";
		}
		if(rev.getCostoTotal() == null){
			html+="<td>No se ha definido</td>";
		}
		else{
			html+="<td>"+rev.getCostoTotal().toString()+"</td>";
		}
		
		html+="</tr></tbody></table>";
		html+="<br/>";
						
		
		
		Query fallaQuery = em.createQuery("SELECT fxr FROM FallaRevision fxr WHERE farRevision.idRevision=:idR");
		fallaQuery.setParameter("idR", idRevision);
		List<FallaRevision> fallas = new ArrayList<>();
		fallas = fallaQuery.getResultList();
		if(fallas.size()!=0){
			html+="<h3>Datos de las fallas:</h3> "+"<br />";
			html+="<table align='center' border='1'><thead><tr>";
			html+="<th>#</th>";
			html+="<th>Descripcion</th>";
			html+="<th>Tipo de falla</th>";
			html+="</tr></thead><tbody>";
								
		for(int i=0; i<fallas.size(); i++){
			html+="<tr>";
			html+="<td>"+(i+1)+"</td>";
			html+="<td>"+fallas.get(i).getFarFalla().getDescripcion()+"</td>";
			html+="<td>"+fallas.get(i).getFarFalla().getFalTipoFalla().getNombreSistema()+"</td>";			
			html+="</tr>";
		}
		html+="</tbody></table>";
		html+="<br/>";		
		}
		
		
		Query repuestoQuery = em.createQuery("SELECT rxr FROM RepuestoRevision rxr WHERE rerRevision.idRevision=:idR");
		repuestoQuery.setParameter("idR", idRevision);
		List<RepuestoRevision> repuestos = new ArrayList<>();
		repuestos = repuestoQuery.getResultList();
		if(repuestos.size()!=0){			
		html+="<h3>Datos de los repuestos:</h3> "+"<br />";
		html+="<table align='center' border='1'><thead><tr>";
		html+="<th>#</th>";
		html+="<th>Nombre</th>";
		html+="<th>Tipo de Repuesto</th>";
		html+="</tr></thead><tbody>";		
		
		for(int i=0; i<repuestos.size(); i++){
			html+="<tr>";
			html+="<td>"+(i+1)+"</td>";
			html+="<td>"+repuestos.get(i).getRerRepuesto().getNombre()+"</td>";
			html+="<td>"+repuestos.get(i).getRerRepuesto().getRepTipoRepuesto().getNombre()+"</td>";
			html+="</tr>";			
		}
		html+="</tbody></table>";
		html+="<br/>";		
		}
						
		
		Query empleadoQuery = em.createQuery("SELECT exr FROM EmpleadoRevision exr WHERE reeRevision.idRevision=:idR");
		empleadoQuery.setParameter("idR", idRevision);
		List<EmpleadoRevision> empleados = new ArrayList<>();
		empleados = empleadoQuery.getResultList();
		
		if(empleados.size()!=0){
		html+="<h3>Datos de los empleados:</h3> "+"<br />";
		html+="<table align='center' border='1'><thead><tr>";
		html+="<th>#</th>";
		html+="<th>Nombre</th>";
		html+="<th>Apellido Paterno</th>";
		html+="<th>Apellido Materno</th>";
		html+="<th>Celular</th>";
		html+="<th>Cargo</th>";
		html+="</tr></thead><tbody>";
		
		for(int i=0; i<empleados.size(); i++){
			html+="<tr>";
			html+="<td>"+(i+1)+"</td>";
			html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getNombre()+"</td>";
			html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getApellidoPaterno()+"</td>";
			html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getApellidoMaterno()+"</td>";
			html+="<td>"+empleados.get(i).getReeEmpleado().getEmpPersona().getCelular()+"</td>";
			html+="<td>"+empleados.get(i).getReeEmpleado().getEmpCargo().getDescripcion()+"</td>";
			html+="</tr>";
		}		
		html+="</tbody></table>";
		html+="<br/>";								
		}
	return html;	
	}
	
	

}
