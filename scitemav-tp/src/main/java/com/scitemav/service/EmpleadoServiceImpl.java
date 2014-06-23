package com.scitemav.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoRevisionBean;
import com.scitemav.bean.RepuestoRevisionBean;
import com.scitemav.bean.RevisionBean;
import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.Cargo;
import com.scitemav.model.Empleado;
import com.scitemav.model.Empleado;
import com.scitemav.model.Distrito;
import com.scitemav.model.Empleado;
import com.scitemav.model.EmpleadoRevision;
import com.scitemav.model.Especialidad;
import com.scitemav.model.FallaRevision;
import com.scitemav.model.Persona;
import com.scitemav.model.Repuesto;
import com.scitemav.model.RepuestoRevision;
import com.scitemav.model.Revision;
import com.scitemav.model.Usuario;
import com.scitemav.model.Vehiculo;

@Service
public class EmpleadoServiceImpl implements EmpleadoService{

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(EmpleadoBean empb) {
		boolean resultado = false;
		
		
		Empleado emp = new Empleado();		

		try{
			
			Usuario usu = new Usuario();
			usu.setEmail(empb.getEmail());
			String md5 = DigestUtils.md5Hex("pass");
			usu.setPassword(md5);
			usu.setEstado("creado");
			java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
			java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());   
			usu.setFechaCreacion(ts);	
			usu.setActivo(false);
			em.persist(usu);
			//
			Persona per = new Persona();
			per.setPerUsuario(usu);			
			per.setNombre(empb.getNombre());
			per.setApellidoPaterno(empb.getApellidoPaterno());
			per.setApellidoMaterno(empb.getApellidoMaterno());
			per.setTelefono(empb.getTelefono());
			per.setDni(empb.getDni());
			per.setCelular(empb.getCelular());
			per.setDireccion(empb.getDireccion());
			per.setFechaNacimiento(empb.getFechaNacimiento());
			per.setSexo(empb.getSexo());
			per.setActivo(false);
		    //
			Distrito dis = new Distrito();
			dis.setIdDistrito(empb.getIdDistrito());
			per.setPerDistrito(dis);
			
			em.persist(per);
						
			//
			Cargo car = new Cargo();
			car.setIdCargo(empb.getIdCargo());
			//
			Especialidad esp = new Especialidad();
			emp.setEmpPersona(per);
			esp.setIdEspecialidad(empb.getIdEspecialidad());
			emp.setEmpCargo(car);
			emp.setEmpEspecialidad(esp);
			emp.setAdministrador(false);
			em.persist(emp);
			empb.setIdEmpleado(emp.getIdEmpleado());
			resultado = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}		
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<EmpleadoBean> listarEmpleados() {
		List<Empleado> lemp = new ArrayList<Empleado>();
		List<EmpleadoBean> lempb = new ArrayList<EmpleadoBean>();
		try {
			Query q = em.createQuery("SELECT e FROM Empleado e");
			lemp = q.getResultList();
			for(int i=0; i < lemp.size(); i++){
				Empleado emp = lemp.get(i);
				EmpleadoBean empb = new EmpleadoBean();
				empb.setIdEmpleado(emp.getIdEmpleado());
				empb.setDni(emp.getEmpPersona().getDni());
				empb.setNombre(emp.getEmpPersona().getNombre());
				empb.setApellidoPaterno(emp.getEmpPersona().getApellidoPaterno());
				empb.setApellidoMaterno(emp.getEmpPersona().getApellidoMaterno());
				empb.setSexo(emp.getEmpPersona().getSexo());
				empb.setFechaNacimiento(emp.getEmpPersona().getFechaNacimiento());
				empb.setIdDistrito(emp.getEmpPersona().getPerDistrito().getIdDistrito());
				empb.setNombreDistrito(emp.getEmpPersona().getPerDistrito().getNombre());
				empb.setDireccion(emp.getEmpPersona().getDireccion());
				empb.setTelefono(emp.getEmpPersona().getTelefono());
				empb.setCelular(emp.getEmpPersona().getCelular());
				empb.setEmail(emp.getEmpPersona().getPerUsuario().getEmail());
				empb.setEstado(emp.getEmpPersona().getPerUsuario().getEstado());
				empb.setIdUsuario(emp.getEmpPersona().getPerUsuario().getIdUsuario());
				//
				empb.setIdCargo(emp.getEmpCargo().getIdCargo());
				empb.setNombreCargo(emp.getEmpCargo().getDescripcion());
				//
				empb.setIdEspecialidad(emp.getEmpEspecialidad().getIdEspecialidad());
				empb.setNombreEspecialidad(emp.getEmpEspecialidad().getDescripcion());
				empb.setAdministrador(emp.getAdministrador());
				empb.setSueldo(emp.getSueldo());
				lempb.add(empb);
			}
		} catch (IllegalArgumentException e) {
			lempb = null;			
		}

		return lempb;
	}

	@Transactional
	public EmpleadoBean obtenerInfo(int idEmpleado) {
		EmpleadoBean eBean = null;
		try{
			eBean = new EmpleadoBean();
			Query q = em.createQuery("from Empleado where idEmpleado="+idEmpleado);
			Empleado e = new Empleado();
			e = (Empleado)q.getSingleResult();
			
			eBean.setIdEmpleado(e.getIdEmpleado());
			eBean.setIdCargo(e.getEmpCargo().getIdCargo());
			eBean.setNombreCargo(e.getEmpCargo().getDescripcion());
			eBean.setIdEspecialidad(e.getEmpEspecialidad().getIdEspecialidad());
			eBean.setNombreEspecialidad(e.getEmpEspecialidad().getDescripcion());
			eBean.setAdministrador(e.getAdministrador());
			
			eBean.setIdPersona(e.getEmpPersona().getIdPersona());
			eBean.setNombre(e.getEmpPersona().getNombre());
			eBean.setApellidoPaterno(e.getEmpPersona().getApellidoPaterno());
			eBean.setApellidoMaterno(e.getEmpPersona().getApellidoMaterno());
			eBean.setTelefono(e.getEmpPersona().getTelefono());
			eBean.setDni(e.getEmpPersona().getDni());
			eBean.setCelular(e.getEmpPersona().getCelular());
			eBean.setSexo(e.getEmpPersona().getSexo());
			eBean.setDireccion(e.getEmpPersona().getDireccion());
			eBean.setFechaNacimiento(e.getEmpPersona().getFechaNacimiento());
			eBean.setActivoC(e.getEmpPersona().getActivo());
			
			eBean.setIdDistrito(e.getEmpPersona().getPerDistrito().getIdDistrito());
			eBean.setNombreDistrito(e.getEmpPersona().getPerDistrito().getNombre());
			
			eBean.setEstado(e.getEmpPersona().getPerUsuario().getEstado());
			eBean.setEmail(e.getEmpPersona().getPerUsuario().getEmail());
			eBean.setPassword(e.getEmpPersona().getPerUsuario().getPassword());
			eBean.setActivoU(e.getEmpPersona().getPerUsuario().getActivo());
				
		}
		catch(IllegalArgumentException e){
			System.out.println(e.getMessage());
		}
		return eBean;
	}

	@Transactional
	public boolean editInformacionEmpleado(EmpleadoBean empb) {
		boolean resultado = false;
		Empleado emp = new Empleado();
		try{
			emp.setIdEmpleado(empb.getIdEmpleado());
			
			Usuario usu = new Usuario();			
			usu.setEmail(empb.getEmail());
			usu.setEstado(empb.getEstado());
			usu.setPassword(empb.getPassword());
			
			em.merge(usu);
			//
			Persona per = new Persona();
			per.setIdPersona(empb.getIdPersona());
			per.setPerUsuario(usu);			
			per.setNombre(empb.getNombre());
			per.setApellidoPaterno(empb.getApellidoPaterno());
			per.setApellidoMaterno(empb.getApellidoMaterno());
			per.setTelefono(empb.getTelefono());
			per.setDni(empb.getDni());
			per.setCelular(empb.getCelular());
			per.setDireccion(empb.getDireccion());
			per.setFechaNacimiento(empb.getFechaNacimiento());
			per.setSexo(empb.getSexo());
			per.setActivo(false);
			
		    //
			Distrito dis = new Distrito();
			dis.setIdDistrito(empb.getIdDistrito());
			per.setPerDistrito(dis);
			emp.setEmpPersona(per);
			em.merge(per);
						
			//
			Cargo car = new Cargo();
			car.setIdCargo(empb.getIdCargo());
			//
			Especialidad esp = new Especialidad();
			esp.setIdEspecialidad(empb.getIdEspecialidad());
			
			emp.setEmpCargo(car);
			emp.setEmpEspecialidad(esp);
			emp.setAdministrador(false);
			em.merge(emp);
			
			resultado = true;			
		}
		catch(IllegalArgumentException ex){
			System.out.println(ex);
			resultado = false;
		}
		return resultado;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<EmpleadoBean> listarEmpleadosRevision(Integer idRevision) {
		List<Empleado> listaEmpleado = new ArrayList<Empleado>();
		List<EmpleadoBean> listaEmpleadoBean = new ArrayList<EmpleadoBean>();	
		//
		List<EmpleadoRevision> listaEmpleadoRev = new ArrayList<EmpleadoRevision>();
		List<EmpleadoRevisionBean> listaEmpleadoRevBean = new ArrayList<EmpleadoRevisionBean>();
		try {
			Query q = em.createQuery("SELECT er FROM EmpleadoRevision er JOIN er.reeRevision r WHERE r.idRevision=:idRevision");
			q.setParameter("idRevision", idRevision);
			listaEmpleadoRev = q.getResultList();
			for(int i=0; i < listaEmpleadoRev.size(); i++){
				Empleado v = listaEmpleadoRev.get(i).getReeEmpleado();
				EmpleadoBean vb = new EmpleadoBean();
				vb.setNombre(v.getEmpPersona().getNombre());
				vb.setApellidoPaterno(v.getEmpPersona().getApellidoPaterno());
				vb.setApellidoMaterno(v.getEmpPersona().getApellidoMaterno());
				vb.setDni(v.getEmpPersona().getDni());
				vb.setSexo(v.getEmpPersona().getSexo());
				vb.setTelefono(v.getEmpPersona().getTelefono());
				vb.setNombreCargo(v.getEmpCargo().getDescripcion());
				vb.setNombreEspecialidad(v.getEmpEspecialidad().getDescripcion());
				vb.setIdEmpleado(v.getIdEmpleado());
				vb.setNroHoras(listaEmpleadoRev.get(i).getNroHoras());
				vb.setCosto(listaEmpleadoRev.get(i).getCosto());
				listaEmpleadoBean.add(vb);
			}
		} catch (IllegalArgumentException e) {
			listaEmpleadoBean = null;			
		}

		return listaEmpleadoBean;
	}
	
	@Transactional
	public List<String> administrarEmpleadosRevision(String[] ids, Integer IdRevision, String[] nroHoras) {
		List<String> enviados = new ArrayList<String>();
		try {
			for (int i = 0; i < ids.length; i++) {				
				EmpleadoRevision emprev = new EmpleadoRevision();
				Empleado emp = em.find(Empleado.class, Integer.parseInt(ids[i]));
				//emp.setIdEmpleado(Integer.parseInt(ids[i]));
				Revision rev = new Revision();
				rev.setIdRevision(IdRevision);
				
				emprev.setReeEmpleado(emp);
				emprev.setReeRevision(rev);
				emprev.setNroHoras(Double.parseDouble(nroHoras[i]));
				
				emprev.setCosto(emprev.getNroHoras()*emp.getSueldo());
				
				enviados.add( emp.getEmpPersona().getNombre()+" "+emp.getEmpPersona().getApellidoPaterno()+" "+emp.getEmpPersona().getApellidoMaterno());
				
				em.persist(emprev);
				sumarCostoTotal(IdRevision);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return enviados;
	}

	@Transactional
	public boolean eliminarEmpRev(EmpleadoRevisionBean EmpleadoRevisionB) {
		boolean resultado = false;

		EmpleadoRevision empleadorevision = new EmpleadoRevision();

		try {					
			Query q1 = em.createQuery("SELECT er FROM EmpleadoRevision er JOIN er.reeRevision r JOIN er.reeEmpleado e WHERE r.idRevision=:idrevision AND e.idEmpleado=:idempleado");
			q1.setParameter("idrevision", EmpleadoRevisionB.getIdRevision());
			q1.setParameter("idempleado", EmpleadoRevisionB.getIdEmpleado());			
			empleadorevision = (EmpleadoRevision) q1.getSingleResult();	
			
			
	        em.remove(empleadorevision);				
	        sumarCostoTotal(EmpleadoRevisionB.getIdRevision());
		    resultado = true;
			
				
			
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}
	@Transactional
	public Boolean getDuplicateEmail2(String email) {
		Integer encontro = 0;
		Boolean resultado = false;
		//email = email.replace("+", "%2B");
		try {
			Query q = em.createQuery("SELECT COUNT(e.idEmpleado) FROM Empleado e JOIN e.empPersona p JOIN p.perUsuario u WHERE u.email=:email");
			q.setParameter("email", email);
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
	
	@Transactional
	public Boolean getDuplicateDNI2(String dni) {
		Integer encontro = 0;
		Boolean resultado = false;
		try {
			Query q = em.createQuery("SELECT COUNT(e.idEmpleado) FROM Empleado e JOIN e.empPersona p WHERE p.dni=:dni");
			q.setParameter("dni", Integer.parseInt(dni));
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
	
	@Transactional
	public boolean editarEmpRev(EmpleadoRevisionBean empleadoRevisionB, HttpServletRequest req) {
		boolean resultado = false;
				
		EmpleadoRevision empleadoRevision = new EmpleadoRevision();
		Empleado emp = new Empleado();
		Revision rev = new Revision();
		
		try{
			
			Query q1 = em.createQuery("SELECT er FROM EmpleadoRevision er JOIN er.reeRevision r JOIN er.reeEmpleado e WHERE r.idRevision=:idrevision AND e.idEmpleado=:idempleado");
			q1.setParameter("idrevision", empleadoRevisionB.getIdRevision());
			q1.setParameter("idempleado", empleadoRevisionB.getIdEmpleado());			
			empleadoRevision = (EmpleadoRevision) q1.getSingleResult();
			
			empleadoRevision.setNroHoras(empleadoRevisionB.getNroHoras());
			empleadoRevision.setCosto(empleadoRevision.getNroHoras()*empleadoRevision.getReeEmpleado().getSueldo());
			
			em.merge(empleadoRevision);
			sumarCostoTotal(empleadoRevisionB.getIdRevision());
			resultado = true;			
			
			
		} catch(IllegalArgumentException e){
			System.out.println(e);
			resultado = false;
		}
		
		return resultado;
		
		
		
		
	}

	@Transactional
	public void sumarCostoTotal(Integer idRevision) {
		Double costo=0.0;
		Revision rev = em.find(Revision.class, idRevision);
		try{
			
			
			Query q = em.createQuery("SELECT SUM(costo) FROM EmpleadoRevision WHERE idRevision=:idRevision");
			q.setParameter("idRevision", idRevision);
			if(q.getSingleResult()!=null){
			costo += Double.parseDouble(q.getSingleResult().toString());
			}
			
			Query q1 = em.createQuery("SELECT SUM(costo) FROM RepuestoRevision WHERE idRevision=:idRevision");
			q1.setParameter("idRevision", idRevision);
			if(q1.getSingleResult()!=null){
			costo+= Double.parseDouble(q1.getSingleResult().toString());
			}
		
			rev.setCostoTotal(costo);
			em.merge(rev);
			
		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());			
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VehiculoBean> getVehiculos(Integer idEmpleado) {
		List<Vehiculo> veh = new ArrayList<Vehiculo>();		
		List<VehiculoBean> vehxemp = new ArrayList<VehiculoBean>();
		try {
			
			Query q = em.createQuery("SELECT rv FROM EmpleadoRevision er JOIN er.reeRevision rr JOIN rr.revVehiculo rv WHERE er.reeEmpleado.idEmpleado=:idEmp");
			//Query q = em.createNativeQuery("SELECT vehiculo.* FROM EmpleadoRevision er JOIN Revision JOIN Vehiculo WHERE er.idEmpleado=:idEmp and er.idRevision=Revision.idRevision", Vehiculo.class);
			q.setParameter("idEmp", idEmpleado);
			
			veh = q.getResultList();
			
			for(int i=0; i < veh.size(); i++){
					
					Vehiculo v = veh.get(i);
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
					vehxemp.add(vb);
				
			}
				
			
		} catch (IllegalArgumentException e) {
			vehxemp = null;			
		}
		return vehxemp;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RevisionBean> getRevisiones(Integer idEmpleado) {
		List<Revision> rev = new ArrayList<Revision>();		
		List<RevisionBean> revB = new ArrayList<RevisionBean>();
		try {
			
			Query q = em.createQuery("SELECT rr FROM EmpleadoRevision er JOIN er.reeRevision rr JOIN er.reeEmpleado r WHERE r.idEmpleado=:idEmp");
			//Query q = em.createNativeQuery("SELECT vehiculo.* FROM EmpleadoRevision er JOIN Revision JOIN Vehiculo WHERE er.idEmpleado=:idEmp and er.idRevision=Revision.idRevision", Vehiculo.class);
			q.setParameter("idEmp", idEmpleado);
			
			rev = q.getResultList();
			
			for(int i=0; i < rev.size(); i++){
					
					Revision r = rev.get(i);
					RevisionBean rb = new RevisionBean();
					
					rb.setIdRevision(r.getIdRevision());
					rb.setCostoTotal(r.getCostoTotal());
					rb.setFechaInicio(r.getFechaInicio());
					rb.setFechaFin(r.getFechaFin());
					rb.setFechaProxima(r.getFechaProxima());
					rb.setKilometrajeActual(r.getKilometrajeActual());
					rb.setKilometrajeProximo(r.getKilometrajeProximo());
					
					revB.add(rb);
				
			}
				
			
		} catch (IllegalArgumentException e) {
			revB = null;			
		}
		return revB;
	}
}
