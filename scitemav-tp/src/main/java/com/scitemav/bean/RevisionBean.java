package com.scitemav.bean;

import java.sql.Date;

public class RevisionBean {

	// Revision
	private Integer idRevision;
	private Double costoTotal;
	private Date fechaInicio;
	private Date fechaFin;
	private Date fechaProxima;
	private Integer kilometrajeActual;
	private Integer kilometrajeProximo;
	private Boolean notificacion;
	

	//Vehiculo
	private Integer idVehiculo;
	private Integer idCliente;
	private String nombreCliente;
	private Integer idMarca;
	private Integer idTipoVehiculo;
	private Integer idModelo;
	private String fabricacion;
	private String color; 
	private String numeroMotor;
	private String numeroPlaca;	
	private String nombreMarca;
	private String nombreModelo;
	private Integer numeroEjes;
	private Integer numeroRuedas;
	private Integer numeroCilindros;
	private String numeroSerie;
	private Integer numeroPasajeros;
	private Integer numeroAsientos;
	private Double pesoSeco;
	private Double pesoBruto;
	private Double longitud;
	private Double altura;	
	private Double ancho;
	private Double cargaUtil;
	
	
	public Integer getIdRevision() {
		return idRevision;
	}
	public void setIdRevision(Integer idRevision) {
		this.idRevision = idRevision;
	}
	public Double getCostoTotal() {
		return costoTotal;
	}
	public void setCostoTotal(Double costoTotal) {
		this.costoTotal = costoTotal;
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	public Date getFechaProxima() {
		return fechaProxima;
	}
	public void setFechaProxima(Date fechaProxima) {
		this.fechaProxima = fechaProxima;
	}
	public Integer getKilometrajeActual() {
		return kilometrajeActual;
	}
	public void setKilometrajeActual(Integer kilometrajeActual) {
		this.kilometrajeActual = kilometrajeActual;
	}
	public Integer getKilometrajeProximo() {
		return kilometrajeProximo;
	}
	public void setKilometrajeProximo(Integer kilometrajeProximo) {
		this.kilometrajeProximo = kilometrajeProximo;
	}
	public Integer getIdVehiculo() {
		return idVehiculo;
	}
	public void setIdVehiculo(Integer idVehiculo) {
		this.idVehiculo = idVehiculo;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public Integer getIdMarca() {
		return idMarca;
	}
	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}
	public Integer getIdTipoVehiculo() {
		return idTipoVehiculo;
	}
	public void setIdTipoVehiculo(Integer idTipoVehiculo) {
		this.idTipoVehiculo = idTipoVehiculo;
	}
	public Integer getIdModelo() {
		return idModelo;
	}
	public void setIdModelo(Integer idModelo) {
		this.idModelo = idModelo;
	}
	public String getFabricacion() {
		return fabricacion;
	}
	public void setFabricacion(String fabricacion) {
		this.fabricacion = fabricacion;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getNumeroMotor() {
		return numeroMotor;
	}
	public void setNumeroMotor(String numeroMotor) {
		this.numeroMotor = numeroMotor;
	}
	public String getNumeroPlaca() {
		return numeroPlaca;
	}
	public void setNumeroPlaca(String numeroPlaca) {
		this.numeroPlaca = numeroPlaca;
	}
	public Integer getNumeroEjes() {
		return numeroEjes;
	}
	public void setNumeroEjes(Integer numeroEjes) {
		this.numeroEjes = numeroEjes;
	}
	public Integer getNumeroRuedas() {
		return numeroRuedas;
	}
	public void setNumeroRuedas(Integer numeroRuedas) {
		this.numeroRuedas = numeroRuedas;
	}
	public Integer getNumeroCilindros() {
		return numeroCilindros;
	}
	public void setNumeroCilindros(Integer numeroCilindros) {
		this.numeroCilindros = numeroCilindros;
	}
	public String getNumeroSerie() {
		return numeroSerie;
	}
	public void setNumeroSerie(String string) {
		this.numeroSerie = string;
	}
	public Integer getNumeroPasajeros() {
		return numeroPasajeros;
	}
	public void setNumeroPasajeros(Integer numeroPasajeros) {
		this.numeroPasajeros = numeroPasajeros;
	}
	public Integer getNumeroAsientos() {
		return numeroAsientos;
	}
	public void setNumeroAsientos(Integer numeroAsientos) {
		this.numeroAsientos = numeroAsientos;
	}
	public Double getPesoSeco() {
		return pesoSeco;
	}
	public void setPesoSeco(Double pesoSeco) {
		this.pesoSeco = pesoSeco;
	}
	public Double getPesoBruto() {
		return pesoBruto;
	}
	public void setPesoBruto(Double pesoBruto) {
		this.pesoBruto = pesoBruto;
	}
	public Double getLongitud() {
		return longitud;
	}
	public void setLongitud(Double longitud) {
		this.longitud = longitud;
	}
	public Double getAltura() {
		return altura;
	}
	public void setAltura(Double altura) {
		this.altura = altura;
	}
	public Double getAncho() {
		return ancho;
	}
	public void setAncho(Double ancho) {
		this.ancho = ancho;
	}
	public Double getCargaUtil() {
		return cargaUtil;
	}
	public void setCargaUtil(Double cargaUtil) {
		this.cargaUtil = cargaUtil;
	}
	public String getNombreModelo() {
		return nombreModelo;
	}
	public void setNombreModelo(String nombreModelo) {
		this.nombreModelo = nombreModelo;
	}
	public String getNombreMarca() {
		return nombreMarca;
	}
	public void setNombreMarca(String nombreMarca) {
		this.nombreMarca = nombreMarca;
	}
	public Boolean getNotificacion() {
		return notificacion;
	}
	public void setNotificacion(Boolean notificacion) {
		this.notificacion = notificacion;
	}
	public String getNombreCliente() {
		return nombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	
	
	
}
