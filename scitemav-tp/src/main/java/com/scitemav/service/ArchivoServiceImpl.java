package com.scitemav.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.scitemav.bean.ArchivosBean;
import com.scitemav.bean.AttachmentBean;
import com.scitemav.bean.EmpleadoBean;
import com.scitemav.model.Archivo;
import com.scitemav.model.Cargo;
import com.scitemav.model.Cliente;
import com.scitemav.model.Distrito;
import com.scitemav.model.Empleado;
import com.scitemav.model.Especialidad;
import com.scitemav.model.Persona;
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
				}else if(fileForm.getTipoEntidad().equals("cliente")){
					Cliente cli = new Cliente();
					cli.setIdCliente(fileForm.getIdEntidad());
					arch.setArcCliente(cli);
				}else if(fileForm.getTipoEntidad().equals("empleado")){
					Empleado emp = new Empleado();
					emp.setIdEmpleado(fileForm.getIdEntidad());
					arch.setArcEmpleado(emp);
				}
				Usuario usu = new Usuario();
				usu.setIdUsuario(Integer.parseInt(req.getSession().getAttribute("idUsuario").toString()));
				
				arch.setArcUsuario(usu);
				arch.setDescripcion(fileForm.getDescripcion());
				
				java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
				java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());   
				arch.setFechaCreacion(ts);
				arch.setTipoArchivo(metadata.getContentType());
				arch.setSize(metadata.getContentLength());
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
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<ArchivosBean> listarArchivos(HttpSession session, String tipoEntidad, String idEntidad) {
		List<Archivo> _la = new ArrayList<Archivo>();
		List<ArchivosBean> _lab = new ArrayList<ArchivosBean>();
		try{
			Query query = null;
			if(tipoEntidad.equals("vehiculo")){
				query = em.createQuery("SELECT a FROM Archivo a JOIN a.arcVehiculo v WHERE v.idVehiculo=:idvehiculo");
			    query.setParameter("idvehiculo", Integer.parseInt(idEntidad));
			}
			else if(tipoEntidad.equals("revision")){
				query = em.createQuery("SELECT a FROM Archivo a JOIN a.arcRevision r WHERE r.idRevision=:idrevision");
			    query.setParameter("idrevision", Integer.parseInt(idEntidad));
			}	
			else if(tipoEntidad.equals("cliente")){
				query = em.createQuery("SELECT a FROM Archivo a JOIN a.arcCliente r WHERE r.idCliente=:idcliente");
			    query.setParameter("idcliente", Integer.parseInt(idEntidad));
			}
			else if(tipoEntidad.equals("empleado")){
				query = em.createQuery("SELECT a FROM Archivo a JOIN a.arcEmpleado r WHERE r.idEmpleado=:idempleado");
			    query.setParameter("idempleado", Integer.parseInt(idEntidad));
			}
			_la = query.getResultList();
			for(int i =0; i < _la.size(); i++){
				Archivo a = _la.get(i);
				ArchivosBean ab = new ArchivosBean();
				ab.setFechaCreacion(a.getFechaCreacion());
				ab.setIdArchivo(a.getIdArchivo());
				ab.setCreado(a.getArcUsuario().getUsuPersona().getNombre() +" "+a.getArcUsuario().getUsuPersona().getApellidoPaterno()+" "+a.getArcUsuario().getUsuPersona().getApellidoMaterno());
				ab.setUrl(a.getUrlImagen());
				ab.setDescripcion(a.getDescripcion());
				ab.setFileType(a.getTipoArchivo());
				ab.setSize(a.getSize());
				_lab.add(ab);
			}
			
			
		} catch(IllegalArgumentException e){
			_lab = null;
		}
		
		return _lab;
		
	}
	
	@Transactional
	public boolean editArchivo(ArchivosBean arb, HttpServletRequest req) {
		boolean resultado = false;
		Archivo ar = new Archivo();
		try{
			
			Query q = em.createQuery("SELECT a FROM Archivo a WHERE idArchivo=:idArch");
			//Query q = em.createNativeQuery("SELECT vehiculo.* FROM EmpleadoRevision er JOIN Revision JOIN Vehiculo WHERE er.idEmpleado=:idEmp and er.idRevision=Revision.idRevision", Vehiculo.class);
			q.setParameter("idArch", arb.getIdArchivo());
			
			ar = (Archivo) q.getSingleResult();
			ar.setDescripcion(arb.getDescripcion());
			
			em.merge(ar);
			
			
			resultado = true;			
		}
		catch(IllegalArgumentException ex){
			System.out.println(ex);
			resultado = false;
		}
		return resultado;
	}


}
