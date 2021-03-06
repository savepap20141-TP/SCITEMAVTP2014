package com.scitemav.bean;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class VehiculoBean {
	
	private Integer idVehiculo;
	private Integer idCliente;
	private Integer idMarca;
	private Integer idTipoVehiculo;
	private Integer idModelo;
	private String fabricacion;
	private String color; 
	private String numeroMotor;
	private String numeroPlaca;
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
	private String nombreMarca;
	private String nombreCliente;
	private String nombreTipoVehiculo;
	private String nombreModelo;
	private String urlImagen;
	private CommonsMultipartFile file;
	//Cliente
	private String dniCliente;
	private String primerNombreCliente;
	private String apePaternoCliente;
	private String apeMaternoCliente;
	private String telefonoCliente;
	private String celularCliente;
	
	
	//
	private String urlImagenMarca;
	
	public String getDniCliente() {
		return dniCliente;
	}
	public void setDniCliente(String dniCliente) {
		this.dniCliente = dniCliente;
	}
	public String getPrimerNombreCliente() {
		return primerNombreCliente;
	}
	public void setPrimerNombreCliente(String primerNombreCliente) {
		this.primerNombreCliente = primerNombreCliente;
	}
	public String getApePaternoCliente() {
		return apePaternoCliente;
	}
	public void setApePaternoCliente(String apePaternoCliente) {
		this.apePaternoCliente = apePaternoCliente;
	}
	public String getApeMaternoCliente() {
		return apeMaternoCliente;
	}
	public void setApeMaternoCliente(String apeMaternoCliente) {
		this.apeMaternoCliente = apeMaternoCliente;
	}
	public String getTelefonoCliente() {
		return telefonoCliente;
	}
	public void setTelefonoCliente(String telefonoCliente) {
		this.telefonoCliente = telefonoCliente;
	}
	public String getCelularCliente() {
		return celularCliente;
	}
	public void setCelularCliente(String celularCliente) {
		this.celularCliente = celularCliente;
	}
	public Integer getIdVehiculo() {
		return idVehiculo;
	}
	public void setIdVehiculo(Integer idVehiculo) {
		this.idVehiculo = idVehiculo;
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
	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
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
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public String getNombreMarca() {
		return nombreMarca;
	}
	public void setNombreMarca(String nombreMarca) {
		this.nombreMarca = nombreMarca;
	}
	public String getNombreCliente() {
		return nombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	public String getNombreTipoVehiculo() {
		return nombreTipoVehiculo;
	}
	public void setNombreTipoVehiculo(String nombreTipoVehiculo) {
		this.nombreTipoVehiculo = nombreTipoVehiculo;
	}
	public String getNombreModelo() {
		return nombreModelo;
	}
	public void setNombreModelo(String nombreModelo) {
		this.nombreModelo = nombreModelo;
	}
	public String getUrlImagen() {
		return urlImagen;
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public String getUrlImagenMarca() {
		return urlImagenMarca;
	}
	public void setUrlImagenMarca(String urlImagenMarca) {
		this.urlImagenMarca = urlImagenMarca;
	}
	
	
	
	
	
}
