package com.scitemav.util;

import java.sql.Date;

public class nullUtil {

	public static String check(String get){
		String set = "";
		if(get == null){
			return set;
		}
		else{
			return get;
		}		
	}

	public static Double check(Double get){
		Double set = 0.0;
		if(get == null){
			return set;
		}
		else{
			return get;
		}		
	}
			
	public static Date check(Date get){
		Date set = DateUtil.today();
		if(get == null){
			return set;
		}
		else{
			return get;
		}		
	}
	
	public static Integer check(Integer get){
		Integer set = 0;
		if(get == null){
			return set;
		}
		else{
			return get;
		}		
	}
	
}
