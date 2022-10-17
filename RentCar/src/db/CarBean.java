package db;

//자동차 클래스
public class CarBean {

	private int no;			//번호
	private String name;	//이름
	private int category;	//종류
	private int price;		//가격
	private int usepeople;	//몇인승
	private String company;	//제조사
	private String img;		//사진이미지
	private String info;	//차량정보
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUsepeople() {
		return usepeople;
	}
	public void setUsepeople(int usepeople) {
		this.usepeople = usepeople;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
	@Override
	public String toString() {
		return "CarListBean [no=" + no + ", name=" + name + ", category=" + category + ", price=" + price
				+ ", usepeople=" + usepeople + ", company=" + company + ", img=" + img + ", info=" + info + "]";
	}

	
	
	
}
