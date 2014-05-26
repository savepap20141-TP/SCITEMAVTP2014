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

import com.scitemav.bean.MarcaBean;
import com.scitemav.bean.TipoVehiculoBean;
import com.scitemav.model.Marca;
import com.scitemav.model.TipoVehiculo;

@Service
public class MarcaServiceImpl implements MarcaService {
	
	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean registro(MarcaBean marcab, HttpServletRequest req) {
		boolean resultado = false;

		//TipoVehiculo tipovehiculo = new TipoVehiculo();
		Marca marca = new Marca();

		try {
			if(!(marcab.getNombre().isEmpty())){
				//tipovehiculo.setNombre(tipv.getNombre());
				if(marcab.getIdMarca()==null){
					marca.setNombre(marcab.getNombre());
					if(marcab.getFile()!=null){
						String fileContentType = marcab.getFile().getContentType();
					     System.out.println("******* FILE CONTENT TYPE: " + fileContentType);
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/images/"));
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/"));
					     System.out.println("******* PATH: " + req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename());
					     
					     //String ruta = req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename();
					     //ruta = ruta.replace(marcab.getUrlImagen(), "");
					     if(fileContentType.contains("image")){
					        try {
								BufferedImage bufferedImage = ImageIO.read(marcab.getFile().getInputStream());
						        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+marcab.getFile().getOriginalFilename());
						        boolean dir = localFile.mkdirs();
						        marcab.getFile().transferTo(localFile);		
						        //marca.setUrlImagen(ruta);
						        marca.setUrlImagen("images/"+marcab.getFile().getOriginalFilename());
					        } catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					      }					     
						//marca.setUrlImagen(marcab.getUrlImagen());
					}
					em.persist(marca);
				}else{
					marca.setIdMarca(marcab.getIdMarca());
					marca.setNombre(marcab.getNombre());
					if(marcab.getFile()!=null){
						String fileContentType = marcab.getFile().getContentType();
					     System.out.println("******* FILE CONTENT TYPE: " + fileContentType);
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/images/"));
					     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/"));
					     System.out.println("******* PATH: " + req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename());
					     
					     //String ruta = req.getRequestURL().toString()+"/images/"+marcab.getFile().getOriginalFilename();
					     //ruta = ruta.replace(marcab.getUrlImagen(), "");
					     if(fileContentType.contains("image")){
					        try {
								BufferedImage bufferedImage = ImageIO.read(marcab.getFile().getInputStream());
						        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+marcab.getFile().getOriginalFilename());
						        boolean dir = localFile.mkdirs();
						        marcab.getFile().transferTo(localFile);		
						        //marca.setUrlImagen(ruta);
						        marca.setUrlImagen("images/"+marcab.getFile().getOriginalFilename());
					        } catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					      }					     
						//marca.setUrlImagen(marcab.getUrlImagen());
					}
					em.merge(marca);
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
	public List<MarcaBean> listarMarcas() {
		List<Marca> listaMarca = new ArrayList<Marca>();
		List<MarcaBean> listaMarcaBean = new ArrayList<MarcaBean>();		
		try {
			Query q = em.createQuery("SELECT m FROM Marca m");
			listaMarca = q.getResultList();
			for(int i=0; i < listaMarca.size(); i++){
				Marca marca = listaMarca.get(i);
				MarcaBean marcaBean = new MarcaBean();
				marcaBean.setIdMarca(marca.getIdMarca());
				marcaBean.setNombre(marca.getNombre());	
				marcaBean.setUrlImagen(marca.getUrlImagen());
				listaMarcaBean.add(marcaBean);
			}
		} catch (IllegalArgumentException e) {
			listaMarcaBean = null;			
		}

		return listaMarcaBean;
	}

}
