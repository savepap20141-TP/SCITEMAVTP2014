package com.scitemav.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.scitemav.model.Usuario;

@Entity
public class Persona {
	@Id @GeneratedValue @Column(name = "idpersona")
	private Integer idPersona;
	
	@Column(name = "dni", length = 8, nullable = true)
	private Integer dni;
	@Column(name = "nombre", length = 90, nullable = true)
	private String nombre;
	@Column(name = "apellidopaterno", length = 90, nullable = true)
	private String apellidoPaterno;
	@Column(name = "apellidomaterno", length = 90, nullable = true)
	private String apellidoMaterno;
	@Column(name = "telefono", length = 90, nullable = true)
	private String telefono;
	@Column(name = "celular", length = 90, nullable = true)
	private String celular;
	@Column(name = "sexo", length = 1, nullable = true)
	private String sexo;
	@Column(name = "direccion", length = 200, nullable = true)
	private String direccion;
	@Column(name = "fechanacimiento", nullable = true)
	private Date fechaNacimiento;
	
	@Column(name = "activo", nullable = true)
	private Boolean activo;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idusuario", nullable = false)
	private Usuario perUsuario;
	
	@ManyToOne
	@JoinColumn(name = "iddistrito")
	private Distrito perDistrito;
	
	@OneToOne(mappedBy="empPersona")
	private Empleado perEmpleado;
	
	@OneToOne(mappedBy="cliPersona")
	private Cliente perCliente;

	public Integer getIdPersona() {
		return idPersona;
	}

	public void setIdPersona(Integer idPersona) {
		this.idPersona = idPersona;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Integer getDni() {
		return dni;
	}

	public void setDni(Integer dni) {
		this.dni = dni;
	}

	public Empleado getPerEmpleado() {
		return perEmpleado;
	}

	public void setPerEmpleado(Empleado perEmpleado) {
		this.perEmpleado = perEmpleado;
	}

	public Usuario getPerUsuario() {
		return perUsuario;
	}

	public void setPerUsuario(Usuario perUsuario) {
		this.perUsuario = perUsuario;
	}

	public Cliente getPerCliente() {
		return perCliente;
	}

	public void setPerCliente(Cliente perCliente) {
		this.perCliente = perCliente;
	}

	public Distrito getPerDistrito() {
		return perDistrito;
	}

	public void setPerDistrito(Distrito perDistrito) {
		this.perDistrito = perDistrito;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
}
