package com.password;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final public class Password {
      String password;
      
      public Password()
      {
    	  password=null;
      }
      
      public Password(String password)
      {
    	  this.password=password;
      }
      
      public String getPassword()
      {
    	  return password;
      }
      
      public boolean setPassword(String password)
      {
    	  if(checkStrongPassword(password))
    	  {
    		  this.password=password;
    		  return true;
    	  }
    	  return false;
      }
      
      public String generatePassword()
      {
    	  System.out.println("Start of generate password in password class");
    	  int length = 8;
     	  String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
          String specialCharacters = "!@#$";
          String numbers = "1234567890";
          String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
          Random random = new Random();
          char[] pass = new char[length];

          pass[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
          pass[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
          pass[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
          pass[3] = numbers.charAt(random.nextInt(numbers.length()));
       
          for(int i = 4; i< length ; i++) {
             pass[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
          }
          
          System.out.println(String.valueOf(pass));
          
          if(checkStrongPassword(String.valueOf(pass)))
             if(String.valueOf(pass)!=null)
                return String.valueOf(pass);
             else
        	    return generatePassword();
          else
        	  return generatePassword();
      }
      
      public final static boolean checkStrongPassword(String password)
      {
    	  String regex = "^(?=.*[0-9])"
                       + "(?=.*[a-z])(?=.*[A-Z])"
                       + "(?=.*[@#$%^&+=])"
                       + ".{8,20}$";
                       
          Pattern p = Pattern.compile(regex);
          if (password == null) {
            return false;
        }
        Matcher m = p.matcher(password);
        return m.matches();
      }
}

