package com.scitemav.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scitemav.bean.FallaBean;
import com.scitemav.bean.FallaRevisionBean;
import com.scitemav.model.Falla;
import com.scitemav.model.FallaRevision;
import com.scitemav.model.Marca;
import com.scitemav.model.Revision;
import com.scitemav.model.TipoFalla;
@Service
public class FallaServicelmpl implements FallaService{
	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public boolean registro(FallaBean fal) {
		boolean falla = false;
		TipoFalla tr = new TipoFalla();
		Falla rp = new Falla();				

		try{			
			tr.setIdTipoFalla(fal.getIdTipoFalla());		
			rp.setFalTipoFalla(tr);
			rp.setDescripcion(fal.getDescripcion());
			
			if(fal.getIdFalla()==null){
				em.persist(rp);
			}else{
				rp.setIdFalla(fal.getIdFalla());
				em.merge(rp);
			}
			
			falla = true;
		}catch(IllegalArgumentException e){
			System.out.println(e);
			falla = false;
		}		
		return falla;

	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<FallaBean> listarFallas() {
		List<Falla> lc = new ArrayList<Falla>();
		List<FallaBean> lcb = new ArrayList<FallaBean>();		
		try {
			Query q = em.createQuery("SELECT f FROM Falla f");
			lc = q.getResultList();
			for(int i=0; i < lc.size(); i++){
				Falla r = lc.get(i);
				FallaBean rb = new FallaBean();
				rb.setIdFalla(r.getIdFalla());
				rb.setDescripcion(r.getDescripcion());
				rb.setIdTipoFalla(r.getFalTipoFalla().getIdTipoFalla());
				rb.setNombreTipoFalla(r.getFalTipoFalla().getNombreSistema());
				lcb.add(rb);
			}
		} catch (IllegalArgumentException e) {
			lcb = null;			
		}

		return lcb;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<FallaRevisionBean> listarFallasRevision(Integer idRevision) {
		List<FallaRevision> listaFallaR = new ArrayList<FallaRevision>();
		List<FallaRevisionBean> listaFallaBean = new ArrayList<FallaRevisionBean>();
		try{
			//Query q = em.createQuery("SELECT fr.farFalla FROM FallaRevision fr JOIN fr.farRevision f WHERE f.idRevision=:idRevision");
			Query q = em.createQuery("SELECT fr FROM FallaRevision fr JOIN fr.farRevision f WHERE f.idRevision=:idRevision");
			q.setParameter("idRevision", idRevision);
			listaFallaR  = q.getResultList();
			for(int i = 0; i<listaFallaR.size(); i++){
				Falla f = listaFallaR.get(i).getFarFalla();
				FallaRevisionBean fb = new FallaRevisionBean();
				fb.setIdTipoFalla(f.getIdFalla());
				fb.setDescripcion(f.getDescripcion());
				fb.setNombreTipoFalla(f.getFalTipoFalla().getNombreSistema());
				
				fb.setIdFalla(f.getIdFalla());
				
				fb.setUrlImagen(listaFallaR.get(i).getUrlImagen());
				fb.setComentario(listaFallaR.get(i).getComentario());
				
				listaFallaBean.add(fb);
			}
		} catch (IllegalArgumentException e){
			listaFallaBean = null;
		}
		
		
		return listaFallaBean;
	}

	@Transactional
	public List<String> administrarFallasRevision(String[] ids, Integer IdRevision) {
		List<String> enviados = new ArrayList<String>();
		try{
			for(int i =0; i< ids.length; i++){
				FallaRevision falrev = new FallaRevision();
				Falla fal = em.find(Falla.class, Integer.parseInt(ids[i]));
				
				Revision rev = new Revision();
				rev.setIdRevision(IdRevision);
				
				falrev.setFarFalla(fal);
				falrev.setFarRevision(rev);
				enviados.add(fal.getDescripcion()+" "+fal.getFalTipoFalla().getNombreSistema());
				em.persist(falrev);
				
			}
			
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return enviados;
	}

	@Transactional
	public boolean eliminarFallaRev(FallaRevisionBean fallaRevisionB) {
		boolean resultado = false;

		FallaRevision fallarevision = new FallaRevision();

		try {					
			Query q1 = em.createQuery("SELECT fr FROM FallaRevision fr JOIN fr.farRevision r JOIN fr.farFalla f WHERE r.idRevision=:idrevision AND f.idFalla=:idfalla");
			q1.setParameter("idrevision", fallaRevisionB.getIdRevision());
			q1.setParameter("idfalla", fallaRevisionB.getIdFalla());			
			fallarevision = (FallaRevision) q1.getSingleResult();	
			
			
	        em.remove(fallarevision);				
				
		    resultado = true;
			
				
			
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}

	@Transactional
	public boolean editarFallaRev(FallaRevisionBean fallaRevisionB, HttpServletRequest req) {
		boolean resultado = false;

		//TipoVehiculo tipovehiculo = new TipoVehiculo();
		FallaRevision fallaRevision = new FallaRevision();

		try {	
			
		    
			fallaRevision.setIdFallaRevision(fallaRevisionB.getIdFallaRevision());
			fallaRevision.setComentario(fallaRevisionB.getComentario());
			if(fallaRevisionB.getFile()!=null){
				 String fileContentType = fallaRevisionB.getFile().getContentType();
			     System.out.println("******* FILE CONTENT TYPE: " + fileContentType);
			     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/images/"));
			     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/"));
			     System.out.println("******* PATH: " + req.getRequestURL().toString()+"/images/"+fallaRevisionB.getFile().getOriginalFilename());
			     
			     //String ruta = req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename();
			     //ruta = ruta.replace(marcab.getUrlImagen(), "");
			     if(fileContentType.contains("image")){
			        try {
						BufferedImage bufferedImage = ImageIO.read(fallaRevisionB.getFile().getInputStream());
				        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+fallaRevisionB.getFile().getOriginalFilename());
				        boolean dir = localFile.mkdirs();
				        fallaRevisionB.getFile().transferTo(localFile);		
				        //marca.setUrlImagen(ruta);
				        fallaRevision.setUrlImagen("images/"+fallaRevisionB.getFile().getOriginalFilename());
			        } catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			      }					     
				//marca.setUrlImagen(marcab.getUrlImagen());
			
			em.merge(fallaRevisionB);
		
		resultado = true;
						
					}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}
}
