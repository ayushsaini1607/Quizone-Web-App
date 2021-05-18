package com.validationMethods;

public class ValidateInput {
	public static boolean isAlpha(String s) {
        return s != null && s.matches("^[a-zA-Z]*$");
    }
	
	public static boolean hasSpecialCharacters(String s)
	{
		return s!=null && !s.matches("^[a-zA-Z0-9]*$");
	}
}
