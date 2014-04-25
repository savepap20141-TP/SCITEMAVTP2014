package com.scitemav.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.RevisionBean;
import com.scitemav.model.Revision;
import com.scitemav.model.Vehiculo;

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
				revBean.setCostoTotal(rev.getCostoTotal());
				revBean.setFechaFin(rev.getFechaFin());
				revBean.setFechaInicio(rev.getFechaInicio());
				revBean.setFechaProxima(rev.getFechaProxima());
				revBean.setKilometrajeActual(rev.getKilometrajeActual());
				revBean.setKilometrajeProximo(rev.getKilometrajeProximo());
				revBean.setIdRevision(rev.getIdRevision());
				revBean.setIdVehiculo(rev.getRevVehiculo().getIdVehiculo());
				revBean.setNumeroPlaca(rev.getRevVehiculo().getNumeroPlaca());
				_revBean.add(revBean);
			}

		} catch (IllegalArgumentException e) {
			System.out.println(e.getMessage());
			_revBean = null;
		}

		return _revBean;
	}

	@Override
	public RevisionBean obtenerInfo(int idRevision) {
		RevisionBean rBean = null;		
		try {
			Query q = em.createQuery("from Revision where idRevision="+idRevision);
			Revision r = new Revision();
			r = (Revision) q.getSingleResult();
			
		} catch (Exception e) {

		}
		return rBean;
	}

}
