package com.cloud.test;
import java.awt.Font;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
public class CatchWeb {
/**
* 获取网站源码
* @param basePath
* @param childPath
* @return
* @throws SocketTimeoutException
*/
public String getWebSource(String basePath, String childPath){
   StringBuffer sb = new StringBuffer("");
   try {
    URL url = new URL(basePath + childPath);
    HttpURLConnection con = (HttpURLConnection) url.openConnection();
    // con.setFollowRedirects(true);
    con.setInstanceFollowRedirects(false);
    con.setConnectTimeout(20000);
    con.connect();
    BufferedReader br = new BufferedReader(new InputStreamReader(con
      .getInputStream()));
    String s = "";
    while ((s = br.readLine()) != null) {
     sb.append(s + "\r\n");
    }
   } catch (MalformedURLException e) {
    e.printStackTrace();
   } catch (IOException e) {
    e.printStackTrace();
   }
   return sb.toString();
}
/********************* 匹配信息的方法 **********************/
public String getCity(String source) {
   if (source != null) {
    source = source.substring(source.indexOf("来自"), source
      .indexOf("<br/>"));
   }
   return source;
}
public String getIP(String source) {
   if (source != null) {
    source = source.substring(source.indexOf("[") + 1, source
      .indexOf("]"));
   }
   return source;
}

public static void main(String[] args) {
   CatchWeb catchWeb = new CatchWeb();
   /**************** JFrame设置 *******************/
   JFrame jf = new JFrame("获取IP");
   JPanel jp = new JPanel();
   JLabel label = new JLabel();
   label.setFont(new Font("微软雅黑", Font.LAYOUT_LEFT_TO_RIGHT, 12));
   jp.add(label);
   jf.add(jp);
   jf.setVisible(true);
   jf.setBounds(400, 200, 200, 80);
   jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   /**************** 连接设置 *******************/
   String basePath = "http://www.ip138.com/";
   String ipurl = "ip2city.asp";
   String cityurl = "ips.asp";
   String ip = null;
   String city = null;
   try{
    label.setText("连接中...");
    ip = catchWeb.getIP(catchWeb.getWebSource(basePath, ipurl));
    city = catchWeb.getCity(catchWeb.getWebSource(basePath, cityurl
      + "?" + ip));
   }catch(Exception e){
    label.setText("连接超时,请检查网络!");
    label.repaint();
   }
  
   if(ip != null && city != null){
    label.setText("<html>您的IP是:" + ip + "<br/>" + city + "</html>");
    label.repaint();
   }
   // System.out.println("您的IP是:" + ip + "\r\n" + city);
}
}
