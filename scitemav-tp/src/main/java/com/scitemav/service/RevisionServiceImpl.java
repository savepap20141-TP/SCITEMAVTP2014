package com.scitemav.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.RevisionBean;
import com.scitemav.model.Revision;
import com.scitemav.model.Vehiculo;
import com.scitemav.util.DateUtil;
import com.scitemav.util.nullUtil;

@Service
public class RevisionServiceImpl implements RevisionService {

	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean registrarRevision(RevisionBean revision) {

		boolean flag = true;
		Revision rev = new Revision();
		Vehiculo veh = new Vehiculo();

		try {
			veh.setIdVehiculo(revision.getIdVehiculo());

			rev.setRevVehiculo(veh);
			rev.setCostoTotal(revision.getCostoTotal());
			rev.setFechaFin(revision.getFechaFin());
			rev.setFechaInicio(revision.getFechaInicio());
			rev.setFechaProxima(revision.getFechaProxima());
			rev.setKilometrajeActual(revision.getKilometrajeActual());
			rev.setKilometrajeProximo(revision.getKilometrajeProximo());

			em.persist(rev);

			flag = true;

		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			flag = false;
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<RevisionBean> listarRevisiones() {
		List<Revision> _rev = new ArrayList<Revision>();
		List<RevisionBean> _revBean = new ArrayList<RevisionBean>();

		try {
			Query query = em.createQuery("SELECT r FROM Revision r");
			_rev = query.getResultList();

			for (int i = 0; i < _rev.size(); i++) {
				Revision rev = _rev.get(i);
				RevisionBean revBean = new RevisionBean();
				revBean.setCostoTotal(nullUtil.check(rev.getCostoTotal()));
				revBean.setFechaFin(nullUtil.check(rev.getFechaFin()));
				revBean.setFechaInicio(nullUtil.check(rev.getFechaInicio()));
				revBean.setFechaProxima(nullUtil.check(rev.getFechaProxima()));
				revBean.setKilometrajeActual(nullUtil.check(rev.getKilometrajeActual()));
				revBean.setKilometrajeProximo(nullUtil.check(rev.getKilometrajeProximo()));
				revBean.setIdRevision(nullUtil.check(rev.getIdRevision()));
				revBean.setIdVehiculo(nullUtil.check(rev.getRevVehiculo().getIdVehiculo()));
				revBean.setNumeroPlaca(nullUtil.check(rev.getRevVehiculo().getNumeroPlaca()));
				_revBean.add(revBean);
			}

		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			_revBean = null;
		}

		return _revBean;
	}
	

}
