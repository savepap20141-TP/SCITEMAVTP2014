package com.scitemav.util;

import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class SecurityUtil{

	private static String passphrase = "Todo es posible, solo uno mismo se pone limites";
	
	//AES ENCRYPT
	public static String encrypt(String plainString, String type){
		String encryptedString = "";

		MessageDigest digest;
		
		switch(type){
		case "string":
			try {
				digest = MessageDigest.getInstance("SHA");
				digest.update(passphrase.getBytes());
				
				Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
				SecretKeySpec secretKey = new SecretKeySpec(digest.digest(), 0, 16, "AES");
				
				cipher.init(Cipher.ENCRYPT_MODE, secretKey);
				
				encryptedString = Base64.encodeBase64String(cipher.doFinal(plainString.getBytes()));
				
				System.err.println("ENCRYPT encryptedString: " + encryptedString);
				
			} catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e){ 
				e.printStackTrace();
			}
			break;
			
		case "number":
			break;
		}
		
		return encryptedString;
	}
	
	//AES DECRYPT
	public static String decrypt(String encryptedString, String type){
		String plainString = "";
		
		MessageDigest digest;
		
		switch(type){
		case "string":
			try{
				digest = MessageDigest.getInstance("SHA");
				digest.update(passphrase.getBytes());
				
				Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
				SecretKeySpec secretKey = new SecretKeySpec(digest.digest(), 0, 16, "AES");
				
				cipher.init(Cipher.DECRYPT_MODE, secretKey);
				
				plainString = new String(cipher.doFinal(Base64.decodeBase64(encryptedString)));
				
				System.err.println("DECRYPT decryptedString: " + plainString);
			}catch(NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e){ 
				e.printStackTrace();
			}
			break;
		
		case "number":
			break;
		}
		
		return plainString;
	}
}
