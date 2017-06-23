package dto;

import java.sql.Date;

public class BambooDTO {

	

		private String bb_num;
		private String m_id;
		private String bb_notice;
		private String bb_title;
		private String bb_content;
		private Date bb_regdate;
		private int bb_count;
		private String bb_nickname;
		private int like_cnt;
		private int dlike_cnt;
		private int reply_cnt;
		public String getBb_num() {
			return bb_num;
		}
		public void setBb_num(String bb_num) {
			this.bb_num = bb_num;
		}
		public String getM_id() {
			return m_id;
		}
		public void setM_id(String m_id) {
			this.m_id = m_id;
		}
		public String getBb_notice() {
			return bb_notice;
		}
		public void setBb_notice(String bb_notice) {
			this.bb_notice = bb_notice;
		}
		public String getBb_title() {
			return bb_title;
		}
		public void setBb_title(String bb_title) {
			this.bb_title = bb_title;
		}
		public String getBb_content() {
			return bb_content;
		}
		public void setBb_content(String bb_content) {
			this.bb_content = bb_content;
		}
		public Date getBb_regdate() {
			return bb_regdate;
		}
		public void setBb_regdate(Date bb_regdate) {
			this.bb_regdate = bb_regdate;
		}
		public int getBb_count() {
			return bb_count;
		}
		public void setBb_count(int bb_count) {
			this.bb_count = bb_count;
		}
		public String getBb_nickname() {
			return bb_nickname;
		}
		public void setBb_nickname(String bb_nickname) {
			this.bb_nickname = bb_nickname;
		}
		public int getLike_cnt() {
			return like_cnt;
		}
		public void setLike_cnt(int like_cnt) {
			this.like_cnt = like_cnt;
		}
		public int getDlike_cnt() {
			return dlike_cnt;
		}
		public void setDlike_cnt(int dlike_cnt) {
			this.dlike_cnt = dlike_cnt;
		}
		public int getReply_cnt() {
			return reply_cnt;
		}
		public void setReply_cnt(int reply_cnt) {
			this.reply_cnt = reply_cnt;
		}
		
		
		
		
		

	

}
