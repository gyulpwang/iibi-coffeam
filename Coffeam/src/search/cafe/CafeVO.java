package search.cafe;

public class CafeVO {
	private int cafeCode;		// ī���ڵ�
	private String cafeName;	// ī���
	private String info;		// ī������
	private String site;		// ī�����Ʈ
	private String logo;		// ī��ΰ�
	private String img;			// ī���̹���
	
	public CafeVO(){
		System.out.println("CafeVO ������");
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
