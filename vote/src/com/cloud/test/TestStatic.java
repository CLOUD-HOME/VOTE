package com.cloud.test;

public class TestStatic {
	private static int i = 0;
	private int j = 0;
	
	public static void a() {
		i = i++;
		//j = j++;
	}
	
	public void b () {
		i = i++;
		j = j++;
	}
}
