package com.cloud.util;

import java.util.Random;

public class ValidateCode {
	private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生的字符串
	private int stringNum = 6;//随机产生字符数量
	private Random random = new Random();
	
	String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
	
	/*
     * 获取随机的字符
     */
    public String getRandomString(int num){
        return String.valueOf(randString.charAt(num));
    }
    
    
    public String randomString() {
    	String randomString = "";
    	

        for(int i=1;i<=stringNum;i++){
            randomString += new ValidateCode().rand;
        }
        
		return randomString;
	}
    
    public static void main(String[] args) {
		System.out.println(new ValidateCode().randomString());
	}
}
