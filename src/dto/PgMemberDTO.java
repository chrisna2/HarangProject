package dto;

public class PgMemberDTO {
	String pgm_regdate;
	String pgm_date;
	String pgm_timecode;
	String m_id;
	String pg_num;
	String pgm_num;
	// 쿼리문 방식 변경으로 사용여부 체크후 삭제.
	String pgm_ftype;
	
	// 쿼리문 방식 변경으로 사용여부 체크후 삭제.
	String pgm_fname;
	
	String pg_type;
	String pg_name;
	
	
	public String getPg_type() {
		return pg_type;
	}
	public void setPg_type(String pg_type) {
		this.pg_type = pg_type;
	}
	public String getPg_name() {
		return pg_name;
	}
	public void setPg_name(String pg_name) {
		this.pg_name = pg_name;
	}
	public String getPgm_num() {
		return pgm_num;
	}
	public void setPgm_num(String pgm_num) {
		this.pgm_num = pgm_num;
	}
	public String getPgm_ftype() {
		return pgm_ftype;
	}
	public void setPgm_ftype(String pgm_ftype) {
		this.pgm_ftype = pgm_ftype;
	}
	public String getPgm_fname() {
		return pgm_fname;
	}
	public void setPgm_fname(String pgm_fname) {
		this.pgm_fname = pgm_fname;
	}
	public String getPgm_regdate() {
		return pgm_regdate;
	}
	public void setPgm_regdate(String pgm_regdate) {
		this.pgm_regdate = pgm_regdate;
	}
	public String getPgm_date() {
		return pgm_date;
	}
	public void setPgm_date(String pgm_date) {
		this.pgm_date = pgm_date;
	}
	public String getPgm_timecode() {
		return pgm_timecode;
	}
	public void setPgm_timecode(String pgm_timecode) {
		this.pgm_timecode = pgm_timecode;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getPg_num() {
		return pg_num;
	}
	public void setPg_num(String pg_num) {
		this.pg_num = pg_num;
	}
	
}
