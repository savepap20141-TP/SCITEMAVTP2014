package com.scitemav.util;

public class DateUtil {
	
	public static java.sql.Timestamp currentTimestamp()
	{
		java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
		java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());    	
    	return ts;		
	}
	
	public static java.sql.Date today()
	{
		java.sql.Date d = new java.sql.Date(System.currentTimeMillis());
		return d;
	}
}
