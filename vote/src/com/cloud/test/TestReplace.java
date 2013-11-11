package com.cloud.test;

public class TestReplace {
	public static void main(String[] args) {
		String temp = "a_b_c_d";
		StringBuffer sb = new StringBuffer();
		String[] arr = temp.split("_");
		for (int i = 0; i < arr.length; i++) {
			if(i==arr.length-1) {
				sb.append(arr[i]);
			}else{
				sb.append(arr[i] + "XXX");
			}
		}
		System.out.println(sb);
	}
}
