package com.scitemav.service;

import java.util.List;

import com.scitemav.bean.ClienteBean;

public interface ClienteService {
	boolean registroCliente(ClienteBean clib);
	public List<ClienteBean> listarClientes();
}
