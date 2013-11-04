package com.cloud.test;

public class TestSub {
	public static void main(String[] args) {
		String name = "公司名称：_";
		//name = name.substring(1);
		
		//System.out.println(name.substring(0,name.length()-1));
		System.out.println(name.replaceFirst("_", ""));
	}
}
