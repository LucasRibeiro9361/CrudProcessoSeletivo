package com.crudProject.bean;

public class Container {
	public String getNmContainer() {
		return nmContainer;
	}
	public void setNmContainer(String nmContainer) {
		this.nmContainer = nmContainer;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}
	public Container(String nmContainer, String cliente, int tipo, int status, int categoria) {
		this.nmContainer = nmContainer;
		this.cliente = cliente;
		this.tipo = tipo;
		this.status = status;
		this.categoria = categoria;
	}
	private String nmContainer;
	private String cliente;
	private int tipo;
	private int status;
	private int categoria;
}
