package freeboard.model;

import java.io.Serializable;
import java.sql.Date;

public class FreeBoardVO implements Serializable {
	
	private int num;
	private int idx;
	private String title;
	private String contents;
	private String writer;
	private String upfile;
	private Date wdate;
	private int cnt;
	
	public FreeBoardVO() {
		System.out.println("FreeBoardVO »ý¼º");
	}

	public FreeBoardVO(int num, int idx, String title, String contents, String writer, String upfile,
			Date wdate, int cnt) {
		super();
		this.num = num;
		this.idx = idx;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.upfile = upfile;
		this.wdate = wdate;
		this.cnt = cnt;
	}

	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}

	public int getIdx() {return idx;}
	public void setIdx(int idx) {this.idx = idx;}

	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}

	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}

	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}

	public String getUpfile() {return upfile;}
	public void setUpfile(String upfile) {this.upfile = upfile;}

	public Date getWdate() {return wdate;}
	public void setWdate(Date wdate) {this.wdate = wdate;}

	public int getCnt() {return cnt;}
	public void setCnt(int cnt) {this.cnt = cnt;}

	@Override
	public String toString() {
		return "FreeBoardVO [num=" + num + ", idx=" + idx + ", title=" + title
				+ ", contents=" + contents + ", writer=" + writer + ", upfile=" + upfile + ", wdate=" + wdate + ", cnt="
				+ cnt + "]";
	}
}

