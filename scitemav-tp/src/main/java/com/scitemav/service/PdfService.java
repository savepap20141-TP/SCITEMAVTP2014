package com.scitemav.service;

import java.io.OutputStream;

public interface PdfService {

	public void htmlToPdf(String content, OutputStream os);
	
}
