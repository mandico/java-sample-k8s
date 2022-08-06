package com.example.javasamplek8s.model;

public class AppInfo {

	private String appname;
	private String hostname;
	private String os;
	private String datetime;
	private String version;

	public AppInfo(String appname, String hostname, String os, String datetime, String version) {
		this.appname = appname;
		this.hostname = hostname;
		this.os = os;
		this.datetime = datetime;
		this.version = version;
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

	public String getVersion() {
		return version;
	}
}