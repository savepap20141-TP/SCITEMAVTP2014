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

import com.scitemav.bean.CargoBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Cargo;
import com.scitemav.model.TipoVehiculo;

@Service
public class TipoVehiculoServiceImpl implements TipoVehiculoService {

	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean registro(TipoVehiculoBean tipv, HttpServletRequest req) {

		boolean resultado = false;

		TipoVehiculo tipovehiculo = new TipoVehiculo();

		try {
			if(!(tipv.getNombre().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				if(tipv.getIdTipoVehiculo()==null){
					tipovehiculo.setNombre(tipv.getNombre());
					if(tipv.getFile()!=null){
						String fileContentType = tipv.getFile().getContentType();
					     System.out.println("******* FILE CONTENT TYPE: " + fileContentType);
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/images/"));
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/"));
					     System.out.println("******* PATH: " + req.getRequestURL().toString()+"/images/"+tipv.getFile().getOriginalFilename());
					     
					     //String ruta = req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename();
					     //ruta = ruta.replace(marcab.getUrlImagen(), "");
					     if(fileContentType.contains("image")){
					        try {
								BufferedImage bufferedImage = ImageIO.read(tipv.getFile().getInputStream());
						        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+tipv.getFile().getOriginalFilename());
						        boolean dir = localFile.mkdirs();
						        tipv.getFile().transferTo(localFile);		
						        //marca.setUrlImagen(ruta);
						        tipovehiculo.setUrlImagen("images/"+tipv.getFile().getOriginalFilename());
					        } catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					      }					     
						//marca.setUrlImagen(marcab.getUrlImagen());
					}
					em.persist(tipovehiculo);
				}else{
					tipovehiculo.setIdTipoVehiculo(tipv.getIdTipoVehiculo());
					tipovehiculo.setNombre(tipv.getNombre());
					if(tipv.getFile()!=null){
						String fileContentType = tipv.getFile().getContentType();
					     System.out.println("******* FILE CONTENT TYPE: " + fileContentType);
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/images/"));
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/"));
					     System.out.println("******* PATH: " + req.getRequestURL().toString()+"/images/"+tipv.getFile().getOriginalFilename());
					     
					     //String ruta = req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename();
					     //ruta = ruta.replace(marcab.getUrlImagen(), "");
					     if(fileContentType.contains("image")){
					        try {
								BufferedImage bufferedImage = ImageIO.read(tipv.getFile().getInputStream());
						        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+tipv.getFile().getOriginalFilename());
						        boolean dir = localFile.mkdirs();
						        tipv.getFile().transferTo(localFile);		
						        //marca.setUrlImagen(ruta);
						        tipovehiculo.setUrlImagen("images/"+tipv.getFile().getOriginalFilename());
					        } catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					      }					     
						//marca.setUrlImagen(marcab.getUrlImagen());
					}
					em.merge(tipovehiculo);
				}
				resultado = true;
			}
				
			
		} catch (IllegalArgumentException e) {
			System.out.println(e);
			resultado = false;
		}
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<TipoVehiculoBean> listarTipoVehiculos() {
		List<TipoVehiculo> tipveh = new ArrayList<TipoVehiculo>();
		List<TipoVehiculoBean> tipvehb = new ArrayList<TipoVehiculoBean>();		
		try {
			Query q = em.createQuery("SELECT tv FROM TipoVehiculo tv");
			tipveh = q.getResultList();
			for(int i=0; i < tipveh.size(); i++){
				TipoVehiculo tv = tipveh.get(i);
				TipoVehiculoBean tvb = new TipoVehiculoBean();
				tvb.setIdTipoVehiculo(tv.getIdTipoVehiculo());
				tvb.setNombre(tv.getNombre());
				tvb.setUrlImagen(tv.getUrlImagen());
				tipvehb.add(tvb);
			}
		} catch (IllegalArgumentException e) {
			tipvehb = null;			
		}

		return tipvehb;
	}
}
