package com.scitemav.service;

import java.io.OutputStream;

import org.springframework.stereotype.Service;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.DocumentException;

@Service
public class PdfServiceImpl implements PdfService {

	@Override
	public void htmlToPdf(String content, OutputStream os) {
		
	    try {
	    	
			//Set wrapper to be XML compliant
			String input = "<wrapper>";
			input += content;
			input += "</wrapper>";
			
		    ITextRenderer render = new ITextRenderer();
		    	    
		    //input = input.replaceAll("&nbsp;", "nbsp;"); //backup before replace all '&'
		    //input = input.replaceAll("&diams;", "diams;"); //backup before replace all '&'    
		    //input = input.replaceAll("&amp;", "&"); //backup before replace all '&'
		    //input = input.replaceAll("&", "&amp;"); //replace all '&' with '&amp;'
		    
		    //--Note: ITextRenderer does not allow certain html entities such as '&nbsp;' and '&diams;'
		    //Hence we replace as below
		    input = input.replaceAll("&nbsp;", "&#160;");
		    input = input.replaceAll("&diams;", "&#9830;");
		    //--
		    
		    //--Note: CKEditor replaces special characters such as '&' with its equivalent html code, 
		    //But CKEditor does not replace if '&' is entered directly in source which is the case when '&' is entered as a part of a url.
		    //Hence we need to escape it with its html code here		    
		    input = input.replaceAll("&Expires", "&amp;Expires");
		    input = input.replaceAll("&Signature", "&amp;Signature");
		    //--
		    
		    //input = input.replaceAll("&amp;nbsp;", "");
	    	//input = input.replaceAll("&amp;", "&amp;amp;");
		    render.setDocumentFromString(input);
	    	render.layout();
    		render.createPDF(os);

		} catch (DocumentException e) {
			e.printStackTrace();
		}

	}

}
