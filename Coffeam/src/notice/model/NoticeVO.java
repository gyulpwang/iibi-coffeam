package notice.model;

import java.io.Serializable;
import java.sql.Date;

public class NoticeVO {
	private int num;
	private int adminNo;
	private String writer;
	private Date wdate;
	private String title;
	private String contents;
	private String upfile;
	
	public NoticeVO() {
		System.out.println("NoticeVO() »ý¼ºÀÚ");
	}

	public NoticeVO(int num, int adminNo, String writer, Date wdate, String title, String contents, String upfile) {
		super();
		this.num = num;
		this.adminNo = adminNo;
		this.writer = writer;
		this.wdate = wdate;
		this.title = title;
		this.contents = contents;
		this.upfile = upfile;
	}

	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}

	public int getAdminNo() {return adminNo;}
	public void setAdminNo(int adminNo) {this.adminNo = adminNo;}

	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}

	public Date getWdate() {return wdate;}
	public void setWdate(Date wdate) {this.wdate = wdate;}

	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}

	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}

	public String getUpfile() {return upfile;}
	public void setUpfile(String upfile) {this.upfile = upfile;}
	
	@Override
	public String toString() {
		return "NoticeVO [num=" + num + ", adminNo=" + adminNo + ", writer=" + writer + ", wdate=" + wdate + ", title="
				+ title + ", contents=" + contents + ", upfile=" + upfile + "]";
	}
}
