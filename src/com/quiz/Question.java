package com.quiz;

import java.util.Arrays;

public class Question {
	private static int count=0;
    private int questionId;
    private String questionTitle;
    private String[] options = new String[4];
    private int correctOption;
    private float weightage;
    
    public Question()
    {
    	questionId = 0;
    	questionTitle=null;
    	correctOption=-1;
    	weightage=0;
    }
    
    public Question(String questionTitle,String options[],int correctOption,float weightage)
    {
    	count++;
    	this.questionId = count;
    	this.questionTitle = questionTitle;
    	this.options = Arrays.copyOf(options, options.length);	
    	this.correctOption = correctOption;
    	this.weightage = weightage;
    }
    
    public int getId()
    {
    	return questionId;
    }
    
    public void setId(int questionId)
    {
    	this.questionId = questionId;
    }
    
    public String getQuestionTitle()
    {
    	return questionTitle;
    }
    
    public void setQuestionTitle(String questionTitle)
    {
    	this.questionTitle = questionTitle;
    }
    
    public String[] getOptions()
    {
    	return Arrays.copyOf(options, options.length);
    }
    
    public int getCorrectOption()
    {
    	return correctOption;  
    }
      
    public float getWeightage()
     {
	   return weightage;
     }
   
    public void setWeightage(float weightage)
    {
    	this.weightage = weightage;
    }
    
    public void setCorrectOption(int copt)
    {
    	this.correctOption = copt;
    }
    
    
    public void setOptions(String options[])
    {
    	this.options = Arrays.copyOf(options,options.length);
    }  
}
