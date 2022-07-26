package com.example.javasamplek8s;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.javasamplek8s.model.AppInfo;

@SpringBootApplication
@RestController
public class JavaSampleK8sApplication {

	public static void main(String[] args) {
		SpringApplication.run(JavaSampleK8sApplication.class, args);
	}
	
	@GetMapping("/")
	public String home() {
		return "Java Spring Boot Application is Up and Running";
	}
	
	@GetMapping("/info")
	public AppInfo status() {

		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss S");
		
		String hostName = System.getenv("HOSTNAME");
		String os = System.getProperty("os.name");
		

		if(hostName == null || hostName.isEmpty()) {
			try {
				InetAddress addr = InetAddress.getLocalHost();
				hostName = addr.getHostName();
			} catch (Exception e) {
				System.err.println(e);
				hostName = "Unknow";
			}
		}
		return new AppInfo("Sample Java Spring Boot App", hostName, os, formatter.format(date));
	}
}