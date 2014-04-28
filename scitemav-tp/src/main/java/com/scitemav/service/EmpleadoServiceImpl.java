package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.model.Cargo;
import com.scitemav.model.Empleado;
import com.scitemav.model.Empleado;
import com.scitemav.model.Distrito;
import com.scitemav.model.Empleado;
import com.scitemav.model.Especialidad;
import com.scitemav.model.Persona;
import com.scitemav.model.Usuario;

@Service
public class EmpleadoServiceImpl implements EmpleadoService{

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registroEmpleado(EmpleadoBean empb) {
		boolean resultado = false;
		Usuario usu = new Usuario();
		Persona per = new Persona();
		Empleado emp = new Empleado();		

		try{
			usu.setEmail(empb.getEmail());
			usu.setPassword("pass");
			
			java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
			java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());   
			usu.setFechaCreacion(ts);	
			usu.setActivo(false);
			em.persist(usu);
			
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
		
			Distrito dis = new Distrito();
			dis.setIdDistrito(empb.getIdDistrito());
			per.setPerDistrito(dis);
			
			em.persist(per);
						
			Cargo car = new Cargo();
			car.setIdCargo(empb.getIdCargo());
			Especialidad esp = new Especialidad();
			emp.setEmpPersona(per);
			esp.setIdEspecialidad(empb.getIdEspecialidad());
			emp.setEmpCargo(car);
			emp.setEmpEspecialidad(esp);
			emp.setAdministrador(false);
			em.persist(emp);
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
}
