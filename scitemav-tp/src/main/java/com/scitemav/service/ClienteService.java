package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.ClienteBean;
import com.scitemav.bean.RevisionBean;

public interface ClienteService {
	boolean registroCliente(ClienteBean clib);
	public List<ClienteBean> listarClientes();
	public ClienteBean obtenerInfo(int idCliente);
	boolean editInformacionCliente(ClienteBean rb);
}
