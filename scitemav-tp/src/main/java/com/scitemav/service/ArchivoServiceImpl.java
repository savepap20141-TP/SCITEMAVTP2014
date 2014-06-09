package com.scitemav.service;

import java.io.InputStream;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.scitemav.bean.ArchivosBean;
import com.scitemav.bean.AttachmentBean;

@Service
public class ArchivoServiceImpl implements ArchivoService{

	@PersistenceContext
	EntityManager em;

	@Transactional
	public boolean cargarFile(AttachmentBean fileBean, HttpSession session) {
		try{
			for(int i = 0; i < fileBean.getFilesbean().size(); i++){
				ArchivosBean fileForm = fileBean.getFilesbean().get(i);
				
				ObjectMetadata metadata = new ObjectMetadata(); //Prepara toda la informacion neceasria para que se pueda subir al S3
				InputStream is = fileForm.getFile().getInputStream();//Puente de bytes
				byte[] contentBytes= IOUtils.toByteArray(is);
				Long contentLength = Long.valueOf(contentBytes.length);
				metadata.setContentLength(contentLength);//CUanto pesa
				metadata.setContentType(fileForm.getFile().getContentType()); //Typo del archivo
				
				
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
}
