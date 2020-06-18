package com.bw.bean;

public class Goods {

	private Integer gid;
	private String gname;
	private Integer cid;
	
	private String gtime;
	
	private String cname;



	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getGtime() {
		return gtime;
	}

	public void setGtime(String gtime) {
		this.gtime = gtime;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Goods(Integer gid, String gname, Integer cid, String gtime, String cname) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.cid = cid;
		this.gtime = gtime;
		this.cname = cname;
	}
	
	

	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", cid=" + cid + ", gtime=" + gtime + ", cname=" + cname
				+ "]";
	}
	
	
}
