package com.example.javasamplek8s.model;

public class AppInfo {

	private String appname;
	private String hostname;
	private String os;
	private String datetime;

	public AppInfo(String appname, String hostname, String os, String datetime) {
		this.appname = appname;
		this.hostname = hostname;
		this.os = os;
		this.datetime = datetime;
	}

	public String getappname() {
		return appname;
	}

	public String gethostname() {
		return hostname;
	}

	public String getOs() {
		return os;
	}

	public String getDatetime() {
		return datetime;
	}
}