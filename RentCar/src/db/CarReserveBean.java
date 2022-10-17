package db;

//자동차 대여 객체 클래스
public class CarReserveBean {
	private int reserveno; 	//예약 아이디
	private int no; 		//차량 아이디
	private String id; 		//유저 아이디
	private int qty; 		//수량
	private int dday;		//대여기간
	private String rday;	//대여일
	private int userin; 	//보험적용
	private int usewifi; 	//Wifi 적용
	private int useseat;  	//베이비시트 적용
	private int usenavi; 	//네이게이션 적용
	
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "CarReserveBean [reserveno=" + reserveno + ", no=" + no + ", id=" + id + ", qty=" + qty + ", dday="
				+ dday + ", rday=" + rday + ", userin=" + userin + ", usewifi=" + usewifi + ", useseat=" + useseat
				+ ", usenavi=" + usenavi + "]";
	}
	
	

	
	
}



