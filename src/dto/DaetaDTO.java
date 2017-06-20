package dto;


public class DaetaDTO {
	private int list_num; //게시판 글번호
	private String d_num; //DB 글번호
	private String d_title; //글제목
	private String d_regdate; //등록날짜
	private String d_deadline; //마감일
	private int d_wage; //시급
	private String d_date; //대타날짜
	private String d_content; //본문내용
	private String d_tel; //연락처
	private int d_deposit; //지급포인트
	private String d_location; //장소
	private String d_header; //머리말
	private int d_cnt; //조회수
	private String m_id; //글쓴이
	private String m_name; //글쓴이 이름
	private int cnt_apply; //지원자수
	
	public int getList_num() {
		return list_num;
	}
	public void setList_num(int list_num) {
		this.list_num = list_num;
	}
	public String getD_num() {
		return d_num;
	}
	public void setD_num(String d_num) {
		this.d_num = d_num;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_regdate() {
		return d_regdate;
	}
	public void setD_regdate(String d_regdate) {
		this.d_regdate = d_regdate;
	}
	public String getD_deadline() {
		return d_deadline;
	}
	public void setD_deadline(String d_deadline) {
		this.d_deadline = d_deadline;
	}
	public int getD_wage() {
		return d_wage;
	}
	public void setD_wage(int d_wage) {
		this.d_wage = d_wage;
	}
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String d_date) {
		this.d_date = d_date;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public String getD_tel() {
		return d_tel;
	}
	public void setD_tel(String d_tel) {
		this.d_tel = d_tel;
	}
	public int getD_deposit() {
		return d_deposit;
	}
	public void setD_deposit(int d_deposit) {
		this.d_deposit = d_deposit;
	}
	public String getD_location() {
		return d_location;
	}
	public void setD_location(String d_location) {
		this.d_location = d_location;
	}
	public String getD_header() {
		return d_header;
	}
	public void setD_header(String d_header) {
		this.d_header = d_header;
	}
	public int getD_cnt() {
		return d_cnt;
	}
	public void setD_cnt(int d_cnt) {
		this.d_cnt = d_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getCnt_apply() {
		return cnt_apply;
	}
	public void setCnt_apply(int cnt_apply) {
		this.cnt_apply = cnt_apply;
	}
	
	
	
	
}
