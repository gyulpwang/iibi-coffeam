package search.drink;

public class DrinkVO {
	private int drinkCode;			// ��ǰ�ڵ�
	private int cafeCode;			// ī���ڵ�
	private String drinkName; 		// ��ǰ��
	private String img;				// �̹���
	private int price;				// ����
	private int mileage;			// ���ϸ���
	private String spec;			// ����
	private int num;				// ��ǰ����
	private String beanType;		// ��������
	private String rdate;      		// �ν��ó�¥
	private String updir;			// �������丮
	/*alter table drink add updir varchar2(50);
	-- updir�� /atwosomeplace/�� ���� ���� ���丮�� ���� �� VO�� �߰�*/

	public DrinkVO(){
		System.out.println("DrinkVO ������");	
	}

	public DrinkVO(int drinkCode, int cafeCode, String drinkName, String img, int price, int mileage, String spec,
			int num, String beanType, String rdate, String updir) {
		super();
		this.drinkCode = drinkCode;
		this.cafeCode = cafeCode;
		this.drinkName = drinkName;
		this.img = img;
		this.price = price;
		this.mileage = mileage;
		this.spec = spec;
		this.num = num;
		this.beanType = beanType;
		this.rdate = rdate;
		this.updir = updir;
	}

	public int getDrinkCode() {return drinkCode;}
	public void setDrinkCode(int drinkCode) {this.drinkCode = drinkCode;}

	public int getCafeCode() {return cafeCode;}
	public void setCafeCode(int cafeCode) {this.cafeCode = cafeCode;}

	public String getDrinkName() {return drinkName;}
	public void setDrinkName(String drinkName) {this.drinkName = drinkName;}

	public String getImg() {return img;}
	public void setImg(String img) {this.img = img;}

	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}

	public int getMileage() {return mileage;}
	public void setMileage(int mileage) {this.mileage = mileage;}

	public String getSpec() {return spec;}
	public void setSpec(String spec) {this.spec = spec;}

	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}

	public String getBeanType() {return beanType;}
	public void setBeanType(String beanType) {this.beanType = beanType;}

	public String getRdate() {return rdate;}
	public void setRdate(String rdate) {this.rdate = rdate;}

	public String getUpdir() {return updir;}
	public void setUpdir(String updir) {this.updir = updir;}
	
	@Override
	public String toString() {
		return "DrinkVO [drinkCode=" + drinkCode + ", cafeCode=" + cafeCode + ", drinkName=" + drinkName + ", img="
				+ img + ", price=" + price + ", mileage=" + mileage + ", spec=" + spec + ", num=" + num + ", beanType="
				+ beanType + ", rdate=" + rdate + ", updir=" + updir + "]";
	}
	
}