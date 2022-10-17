package db;

public class CarViewBean {
	
	
	private String name;
	private int price;
	private String img;
	private int qty; 		//수량
	private int dday;		//대여기간
	private String rday;	//대여일
	private int userin; 	//보험적용
	private int usewifi; 	//와이파이적용
	private int useseat;  	//베이비시트 적용
	private int usenavi; 	//네이게이션 적용
	private int reserveno; 	//예약아이디
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public int getUserin() {
		return userin;
	}
	public void setUserin(int userin) {
		this.userin = userin;
	}
	public int getUsewifi() {
		return usewifi;
	}
	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}
	public int getUseseat() {
		return useseat;
	}
	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	@Override
	public String toString() {
		return "CarViewBean [name=" + name + ", price=" + price + ", img=" + img + ", qty=" + qty + ", dday=" + dday
				+ ", rday=" + rday + ", userin=" + userin + ", usewifi=" + usewifi + ", useseat=" + useseat
				+ ", usenavi=" + usenavi + ", reserveno=" + reserveno + "]";
	}
	
	
	
	
}
