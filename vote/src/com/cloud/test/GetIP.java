package com.cloud.test;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class GetIP {
	public static void main(String[] args) {
		InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ip=addr.getHostAddress();//获得本机IP
		String dns=addr.getCanonicalHostName();
		System.out.println(ip + dns);
	}
}
