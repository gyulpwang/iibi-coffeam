package search.cafe;

public class CafeVO {
	private int cafeCode;		// 카페코드
	private String cafeName;	// 카페명
	private String info;		// 카페정보
	private String site;		// 카페사이트
	private String logo;		// 카페로고
	private String img;			// 카페이미지
	
	public CafeVO(){
		System.out.println("CafeVO 생성자");
	}
	
	public CafeVO(int cafeCode, String cafeName, String info, String site, String logo, String img) {
		super();
		this.cafeCode = cafeCode;
		this.cafeName = cafeName;
		this.info = info;
		this.site = site;
		this.logo = logo;
		this.img = img;
	}

	public int getCafeCode() {return cafeCode;}
	public void setCafeCode(int cafeCode) {this.cafeCode = cafeCode;}

	public String getCafeName() {return cafeName;}
	public void setCafeName(String cafeName) {this.cafeName = cafeName;}

	public String getInfo() {return info;}
	public void setInfo(String info) {this.info = info;}

	public String getSite() {return site;}
	public void setSite(String site) {this.site = site;}

	public String getLogo() {return logo;}
	public void setLogo(String logo) {this.logo = logo;}

	public String getImg() {return img;}
	public void setImg(String img) {this.img = img;}

	@Override
	public String toString() {
		return "CafeVO [cafeCode=" + cafeCode + ", cafeName=" + cafeName + ", info=" + info + ", site=" + site
				+ ", logo=" + logo + ", img=" + img + "]";
	}
	
}
