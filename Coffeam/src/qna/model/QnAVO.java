package qna.model;

import java.io.Serializable;
import java.sql.Date;

public class QnAVO {

	private int num;
	private int idx;
	private String title;
	private String writer;
	private String contents;
	private Date wdate;
	private int adminNo;
	private String yn;
	private String answer;
	private String answerer;
	
	public QnAVO() {
		System.out.println("QnAVO() »ý¼ºÀÚ");
	}

	public QnAVO(int num, int idx, String title, String writer, String contents, 
				 Date wdate, int adminNo, String yn, String answer, String answerer) {
		super();
		this.num = num;
		this.idx = idx;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.wdate = wdate;
		this.adminNo = adminNo;
		this.yn = yn;
		this.answer = answer;
		this.answerer = answerer;
	}

	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}

	public int getIdx() {return idx;}
	public void setIdx(int idx) {this.idx = idx;}

	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}

	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}

	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}

	public Date getWdate() {return wdate;}
	public void setWdate(Date wdate) {this.wdate = wdate;}

	public int getAdminNo() {return adminNo;}
	public void setAdminNo(int adminNo) {this.adminNo = adminNo;}
	
	public String getYn() {return yn;}
	public void setYn(String yn) {this.yn = yn;}

	public String getAnswer() {return answer;}
	public void setAnswer(String answer) {this.answer = answer;}

	public String getAnswerer() {return answerer;}
	public void setAnswerer(String answerer) {this.answerer = answerer;}

	@Override
	public String toString() {
		return "QnAVO [num=" + num + ", idx=" + idx + ", title=" + title + ", writer=" + writer + ", contents="
				+ contents + ", wdate=" + wdate + ", adminNo = "+ adminNo +", yn=" + yn + ", answer=" + answer + ", answerer=" + answerer + "]";
	}
}
