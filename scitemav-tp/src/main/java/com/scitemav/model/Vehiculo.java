package com.scitemav.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Vehiculo {
	@Id @GeneratedValue @Column(name = "idvehiculo")
	private Integer idVehiculo;
	
	@ManyToOne
	@JoinColumn(name = "idcliente",nullable = false)
	private Cliente vehCliente;
	
	@ManyToOne
	@JoinColumn(name = "idmarca",nullable = false)
	private Marca vehMarca;
	
	@ManyToOne
	@JoinColumn(name = "idtipovehiculo",nullable = false)
	private TipoVehiculo vehTipoVehiculo;
	
	@ManyToOne
	@JoinColumn(name = "idmodelo",nullable = false)
	private Modelo vehModelo;
	
	@Column(length = 4, nullable = true)
	private String fabricacion;
	
	@Column(length = 60, nullable = true)
	private String color; 
	
	@Column(name = "numeromotor", length = 50, nullable = true)
	private String numeroMotor;
	
	@Column(name = "numeroplaca", length = 10, nullable = true)
	private String numeroPlaca;
	
	@Column(name = "numeroejes", nullable = true)
	private Integer numeroEjes;
	
	@Column(name = "numeroruedas", nullable = true)
	private Integer numeroRuedas;
	
	@Column(name = "numerocilindros", nullable = true)
	private Integer numeroCilindros;
	
	@Column(name = "numeroserie", length = 50, nullable = true)
	private String numeroSerie;
	
	@Column(name = "numeropasajeros", nullable = true)
	private Integer numeroPasajeros;
	
	@Column(name = "numeroasientos", nullable = true)
	private Integer numeroAsientos;
	
	@Column(name = "pesoseco", nullable = true)
	private Double pesoSeco;
	
	@Column(name = "pesobruto", nullable = true)
	private Double pesoBruto;

	@Column(name = "longitud", nullable = true)
	private Double longitud;
	
	@Column(name = "altura", nullable = true)
	private Double altura;
	
	@Column(name = "ancho", nullable = true)
	private Double ancho;

	@Column(name = "cargautil", nullable = true)
	private Double cargaUtil;

	@OneToMany(mappedBy ="revVehiculo")
	private Collection<Revision> vehRevisiones;
	
	public Integer getIdVehiculo() {
		return idVehiculo;
	}

	public void setIdVehiculo(Integer idVehiculo) {
		this.idVehiculo = idVehiculo;
	}

	public Cliente getVehCliente() {
		return vehCliente;
	}

	public void setVehCliente(Cliente vehCliente) {
		this.vehCliente = vehCliente;
	}

	public Marca getVehMarca() {
		return vehMarca;
	}

	public void setVehMarca(Marca vehMarca) {
		this.vehMarca = vehMarca;
	}

	public TipoVehiculo getVehTipoVehiculo() {
		return vehTipoVehiculo;
	}

	public void setVehTipoVehiculo(TipoVehiculo vehTipoVehiculo) {
		this.vehTipoVehiculo = vehTipoVehiculo;
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

	public Modelo getVehModelo() {
		return vehModelo;
	}

	public void setVehModelo(Modelo vehModelo) {
		this.vehModelo = vehModelo;
	}

	public Collection<Revision> getVehRevisiones() {
		return vehRevisiones;
	}

	public void setVehRevisiones(Collection<Revision> vehRevisiones) {
		this.vehRevisiones = vehRevisiones;
	}
}
