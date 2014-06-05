package com.scitemav.controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scitemav.service.PdfService;
import com.scitemav.service.ReporteService;

@Controller
public class ReportesController {

	@Autowired
	ReporteService reporteservice;
	
	@Autowired
	PdfService svcPdf;

	@RequestMapping(value = "verPDFVehiculo-{idVehiculo}", method = RequestMethod.GET)
	@ResponseBody
	public void verPDFVehiculo(@PathVariable Integer idVehiculo,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		System.out.println("RUTA: "+request.getRequestURL().toString());
		String rutatemp = request.getRequestURL().toString();
		String rutaAbsoluta = rutatemp.replace("verPDFVehiculo-"+idVehiculo, "");
		System.out.println("RUTA ABSOLUTA: "+rutaAbsoluta);
		String output = reporteservice.reporteVehiculo(idVehiculo,rutaAbsoluta);
		
		OutputStream os;
		try {
			response.setContentType("application/pdf");
			os = response.getOutputStream();
			svcPdf.htmlToPdf(output, os);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "verPDFRevision-{idRevision}", method = RequestMethod.GET)
	@ResponseBody
	public void verPDFRevision(@PathVariable Integer idRevision,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String output = reporteservice.reporteRevision(idRevision);
		OutputStream os;
		try {
			response.setContentType("application/pdf");
			os = response.getOutputStream();
			svcPdf.htmlToPdf(output, os);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping(value = "verPDF", method = RequestMethod.GET)
	@ResponseBody
	public void viewPDF(HttpServletRequest request, HttpServletResponse response) {
		// Security
		HttpSession session = request.getSession();

		// String output = request.getParameter("listaHTML");
		String output = "<table border='1' id='tabla_Test'>" + "<thead>"
				+ "<tr>" + "<th>#</th>" + "<th>Date</th>" + "<th>Time</th>"
				+ "<th>Amount</th>" + "</tr>" + "</thead>" + "<tbody>" + "<tr>"
				+ "<td>3326</td>" + "<td>10/21/2013</td>" + "<td>3:29 PM</td>"
				+ "<td>$321.33</td>" + "</tr>" + "<tr>" + "<td>3325</td>"
				+ "<td>10/21/2013</td>" + "<td>3:20 PM</td>"
				+ "<td>$234.34</td>" + "</tr>" + "<tr>" + "<td>3324</td>"
				+ "<td>10/21/2013</td>" + "<td>3:03 PM</td>"
				+ "<td>$724.17</td>" + "</tr>" + "<tr>" + "<td>3323</td>"
				+ "<td>10/21/2013</td>" + "<td>3:00 PM</td>"
				+ "<td>$23.71</td>" + "</tr>" + "<tr>" + "<td>3322</td>"
				+ "<td>10/21/2013</td>" + "<td>2:49 PM</td>"
				+ "<td>$8345.23</td>" + "</tr>" + "<tr>" + "<td>3321</td>"
				+ "<td>10/21/2013</td>" + "<td>2:23 PM</td>"
				+ "<td>$245.12</td>" + "</tr>" + "<tr>" + "<td>3320</td>"
				+ "<td>10/21/2013</td>" + "<td>2:15 PM</td>"
				+ "<td>$5663.54</td>" + "</tr>" + "<tr>" + "<td>3319</td>"
				+ "<td>10/21/2013</td>" + "<td>2:13 PM</td>"
				+ "<td>$943.45</td>" + "</tr>" + "</tbody>" + "</table>";

		OutputStream os;
		try {
			response.setContentType("application/pdf");
			os = response.getOutputStream();
			svcPdf.htmlToPdf(output, os);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
