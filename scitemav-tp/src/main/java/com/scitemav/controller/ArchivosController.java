package com.scitemav.controller;

import java.util.ArrayList;
import java.util.List;

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

	@RequestMapping(value = "loadFileAjax", method = RequestMethod.POST)
	@ResponseBody
	public Boolean loadFileAjaxNew(@ModelAttribute("fileUpload") ArchivosBean beanAjax, HttpServletRequest req, Model model, HttpServletResponse res){
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
			}
			filesbean.setFilesbean(filesbeanlist);

			
			/*if(filesbean.getFilesbean()!=null && archivossevice.loadFile(filesbean, req.getSession(),valueSRW)){
				return true;
			}else{
				return null;
			}*/
			return null;
		}else{
			return null;
		}
	}
}
