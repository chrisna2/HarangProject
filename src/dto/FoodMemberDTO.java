package dto;

import java.util.Date;

public class FoodMemberDTO {

	private String m_id;
	private String f_num;
	private String fm_regdate;
	private String fm_isuse;
	private Date fm_usedate;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getF_num() {
		return f_num;
	}
	public void setF_num(String f_num) {
		this.f_num = f_num;
	}
	public String getFm_regdate() {
		return fm_regdate;
	}
	public void setFm_regdate(String fm_regdate) {
		this.fm_regdate = fm_regdate;
	}
	public String getFm_isuse() {
		return fm_isuse;
	}
	public void setFm_isuse(String fm_isuse) {
		this.fm_isuse = fm_isuse;
	}
	public Date getFm_usedate() {
		return fm_usedate;
	}
	public void setFm_usedate(Date fm_usedate) {
		this.fm_usedate = fm_usedate;
	}
	
	
	
}
