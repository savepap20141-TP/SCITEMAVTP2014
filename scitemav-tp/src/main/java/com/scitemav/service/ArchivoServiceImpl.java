package com.scitemav.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.scitemav.bean.ArchivosBean;
import com.scitemav.bean.AttachmentBean;
import com.scitemav.model.Archivo;
import com.scitemav.model.Revision;
import com.scitemav.model.Usuario;
import com.scitemav.model.Vehiculo;

@Service
public class ArchivoServiceImpl implements ArchivoService{

	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean cargarFile(AttachmentBean fileBean, HttpServletRequest req) {
		try{
			for(int i = 0; i < fileBean.getFilesbean().size(); i++){
				ArchivosBean fileForm = fileBean.getFilesbean().get(i);
				
				ObjectMetadata metadata = new ObjectMetadata(); //Prepara toda la informacion neceasria para que se pueda subir al S3
				InputStream is = fileForm.getFile().getInputStream();//Puente de bytes
				byte[] contentBytes= IOUtils.toByteArray(is);
				Long contentLength = Long.valueOf(contentBytes.length);
				metadata.setContentLength(contentLength);//CUanto pesa
				metadata.setContentType(fileForm.getFile().getContentType()); //Typo del archivo
				
				Archivo arch = new Archivo();
				
				if(fileForm.getTipoEntidad().equals("vehiculo")){
					Vehiculo veh = new Vehiculo();
					veh.setIdVehiculo(fileForm.getIdEntidad());
					arch.setArcVehiculo(veh);
				}else if(fileForm.getTipoEntidad().equals("revision")){
					Revision rev = new Revision();
					rev.setIdRevision(fileForm.getIdEntidad());
					arch.setArcRevision(rev);
				}
				Usuario usu = new Usuario();
				usu.setIdUsuario(Integer.parseInt(req.getSession().getAttribute("idUsuario").toString()));
				
				arch.setArcUsuario(usu);
				arch.setDescripcion(fileForm.getDescripcion());
				
				java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
				java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());   
				arch.setFechaCreacion(ts);
				
				if(fileForm.getFile()!=null){
					String fileContentType = fileForm.getFile().getContentType();
				     //if(fileContentType.contains("image")){
				        try {
							BufferedImage bufferedImage = ImageIO.read(fileForm.getFile().getInputStream());
					        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+fileForm.getFile().getOriginalFilename());
					        boolean dir = localFile.mkdirs();
					        fileForm.getFile().transferTo(localFile);		
					        arch.setUrlImagen("images/"+fileForm.getFile().getOriginalFilename());
				        } catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				      //}					     
				}
				em.persist(arch);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
}