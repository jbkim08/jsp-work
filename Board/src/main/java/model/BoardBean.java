package model;

public class BoardBean {
	
	private int num;		  	//게시글번호
	private String writer;		//글쓴이
	private String email;		//이메일
	private String subject;		//제목
	private String password;	//비번
	private String reg_date;	//작성날짜(자동입력됨)
	private int ref;			//전체글개수 + 1
	private int re_step;		//1첫번째글 2댓글 3대댓글
	private int re_level;		//댓글의 번호 순서
	private int readcount;		//읽은 횟수
	private String content;		//글의 내용;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", writer=" + writer + ", email=" + email + ", subject=" + subject
				+ ", password=" + password + ", reg_date=" + reg_date + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", readcount=" + readcount + ", content=" + content + "]";
	}
	
}
