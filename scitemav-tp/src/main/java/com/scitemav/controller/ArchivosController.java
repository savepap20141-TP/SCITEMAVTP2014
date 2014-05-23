package com.scitemav.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.scitemav.bean.ArchivosBean;
import com.scitemav.bean.AttachmentBean;


@Controller
public class ArchivosController {

	@RequestMapping("toArchivos")
	public String toArchivos() {
		return "Archivos";
	}
	
	@RequestMapping(value = "loadFileAjax", method = RequestMethod.POST)
	@ResponseBody
	public String loadFileAjaxNew(@ModelAttribute("fileUpload") ArchivosBean beanAjax, HttpServletRequest req, Model model, HttpServletResponse res){
		res.setContentType("text/plain");
		Integer countAttachment = 0;
		List<CommonsMultipartFile> cmpf = new ArrayList<CommonsMultipartFile>();
		/*for(int i = 0; i < files.getFilesbean().size(); i++){
			for(int j = 0; j < files.getFilesbean().get(i).getFilesb().size(); j++){
				System.out.println("Nombre : "+files.getFilesbean().get(i).getFilesb().get(j).getOriginalFilename());
				countAttachment++;
				cmpf.add(files.getFilesbean().get(i).getFilesb().get(j));
			}			
		}*/
		if(beanAjax!=null){
			cmpf.add(beanAjax.getFile());
		}
		if(cmpf.size()>0){
			System.out.println("tamaño de files : "+cmpf.size());
			/*String [] types_Attachment = req.getParameterValues("type");
			String idEntity= req.getParameter("idEntity");
			String typeEntity= req.getParameter("typeEntity");*/
			//
			AttachmentBean filesbean = new AttachmentBean();
			List<ArchivosBean> filesbeanlist = new ArrayList<ArchivosBean>();
			
			for(int i = 0 ; i <  cmpf.size() ; i++){
				ArchivosBean s3bean = new ArchivosBean();
				s3bean.setFile(cmpf.get(i));
				
				filesbeanlist.add(s3bean);
				
				 String fileContentType = beanAjax.getFile().getContentType();
			     System.out.println("******* FILE CONTENT TYPE: " + fileContentType);
			     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/images/"));
			     System.out.println("******* PATH: " + req.getSession().getServletContext().getRealPath("/"));
			     if(fileContentType.contains("image")){
			        try {
						BufferedImage bufferedImage =ImageIO.read(beanAjax.getFile().getInputStream());
				        //File localFile = new File(req.getServletContext().getRealPath("images")+"/"+beanAjax.getFile().getOriginalFilename());
				        //File localFile = new File("C:/Users/EPSON/git/scitemav-tp/scitemav-tp/WebContent/images/"+beanAjax.getFile().getOriginalFilename());
				        //File localFile= new File(req.getSession().getServletContext().getRealPath("/WEB-INF/images/"), beanAjax.getFile().getName());
				        File localFile= new File(req.getSession().getServletContext().getRealPath("/images/")+"/"+beanAjax.getFile().getOriginalFilename());
				        boolean dir = localFile.mkdirs();
				        beanAjax.getFile().transferTo(localFile);
				        
			        } catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			      }
			}
			filesbean.setFilesbean(filesbeanlist);

			
			/*if(filesbean.getFilesbean()!=null && archivossevice.loadFile(filesbean, req.getSession(),valueSRW)){
				return true;
			}else{
				return null;
			}*/
			return ""+beanAjax.getFile().getOriginalFilename();
		}else{
			return null;
		}
	}
}
