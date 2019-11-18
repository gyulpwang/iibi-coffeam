package user.member;

import java.io.Serializable;
import java.sql.Date;

public class MemberVO {
	// 멤버변수 => jsp에서는 프로퍼티(property)라고 함. 
	// 가능하면 html의 input name과 일치시켜주는 것이 좋다.

	private Integer idx;
	private String name;
	private String userid;
	private String pwd;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String post;
	private String addr1;
	private String addr2;
	private Date indate;
	private String favorite;
	private int mileage;
	
	public MemberVO() {
		System.out.println("MemberVO 생성자");
	}

	public MemberVO(Integer idx, String name, String userid, String pwd, String email, String hp1, String hp2,
			String hp3, Date indate, String favorite, int mileage) {
		super();
		this.idx = idx;
		this.name = name;
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.indate = indate;
		this.favorite = favorite;
		this.mileage = mileage;
	}

	// setter, getter
	public Integer getIdx() {return idx;}
	public void setIdx(Integer idx) {this.idx = idx;}

	public String getName() {return name;}
	public void setName(String name) {this.name = name;
	System.out.println("setName() : "+name);}

	public String getUserid() {return userid;}
	public void setUserid(String userid) {this.userid = userid;
	System.out.println("setUserid() : "+userid);}

	public String getPwd() {return pwd;}
	public void setPwd(String pwd) {this.pwd = pwd;}

	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}

	public String getHp1() {return hp1;}
	public void setHp1(String hp1) {this.hp1 = hp1;}

	public String getHp2() {return hp2;}
	public void setHp2(String hp2) {this.hp2 = hp2;}

	public String getHp3() {return hp3;}
	public void setHp3(String hp3) {this.hp3 = hp3;}

	public String getPost() {return post;}
	public void setPost(String post) {this.post = post;}

	public String getAddr1() {return addr1;}
	public void setAddr1(String addr1) {this.addr1 = addr1;}

	public String getAddr2() {return addr2;}
	public void setAddr2(String addr2) {this.addr2 = addr2;}

	public Date getIndate() {return indate;}
	public void setIndate(Date indate) {this.indate = indate;}

	public String getFavorite() {return favorite;}
	public void setFavorite(String favorite) {this.favorite = favorite;}

	public int getMileage() {return mileage;}
	public void setMileage(int mileage) {this.mileage = mileage;}

	
	public String getAllHp(){
		return hp1+"-"+hp2+"-"+hp3;
	}
	
	// toString() override
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", userid=" + userid + ", pwd=" + pwd + ", email=" + email
				+ ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", indate=" + indate + ", favorite=" + favorite + ", mileage=" + mileage + "]";
	}
}
