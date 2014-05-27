package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.VehiculoBean;
import com.scitemav.model.Cargo;
import com.scitemav.model.Empleado;
import com.scitemav.model.Empleado;
import com.scitemav.model.Distrito;
import com.scitemav.model.Empleado;
import com.scitemav.model.EmpleadoRevision;
import com.scitemav.model.Especialidad;
import com.scitemav.model.Persona;
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
		try {
			Query q = em.createQuery("SELECT er.reeEmpleado FROM EmpleadoRevision er JOIN reeRevision r WHERE r.idRevision=:idRevision");
			q.setParameter("idRevision", idRevision);
			listaEmpleado = q.getResultList();
			for(int i=0; i < listaEmpleado.size(); i++){
				Empleado v = listaEmpleado.get(i);
				EmpleadoBean vb = new EmpleadoBean();
				vb.setNombre(v.getEmpPersona().getNombre());
				vb.setApellidoPaterno(v.getEmpPersona().getApellidoPaterno());
				vb.setApellidoMaterno(v.getEmpPersona().getApellidoMaterno());
				vb.setDni(v.getEmpPersona().getDni());
				vb.setSexo(v.getEmpPersona().getSexo());
				vb.setTelefono(v.getEmpPersona().getTelefono());
				vb.setNombreCargo(v.getEmpCargo().getDescripcion());
				vb.setNombreEspecialidad(v.getEmpEspecialidad().getDescripcion());
				
				listaEmpleadoBean.add(vb);
			}
		} catch (IllegalArgumentException e) {
			listaEmpleadoBean = null;			
		}

		return listaEmpleadoBean;
	}
	
	@Transactional
	public List<String> administrarEmpleadosRevision(String[] ids, Integer IdRevision) {
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
				enviados.add( emp.getEmpPersona().getNombre()+" "+emp.getEmpPersona().getApellidoPaterno()+" "+emp.getEmpPersona().getApellidoMaterno());
				em.persist(emprev);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return enviados;
	}
}
