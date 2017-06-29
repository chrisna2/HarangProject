package parttime.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.DaetaReplyDTO;
import dto.ParttimeReplyDTO;
import harang.dbcp.DBConnectionMgr;
/**
 * 알바하랑의 댓글을 데이터베이스와 연결하는 클래스.
 * @author student
 *
 */
public class CommentBean {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	/**
	 * 생성자. DBConnectionMgr클래스를 통해 데이터베이스에 연결.
	 */
	public CommentBean(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : " +err);
		}
	}
	
	/**
	 * 알바 모집 게시글에 댓글을 등록하는 메서드.
	 * @param p_num 글번호
	 * @param m_id 회원번호
	 * @param pr_comment 댓글내용
	 */
	public void insertParttimeReply(String p_num, String m_id, String pr_comment){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_parttime_reply(pr_comment, p_num, m_id) VALUES (?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_comment);
			pstmt.setString(2, p_num);
			pstmt.setString(3, m_id);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("insertParttimeReply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 대타 모집 게시판에 댓글을 등록하는 메서드.
	 * @param d_num
	 * @param m_id
	 * @param dr_comment
	 */
	public void insertDaetaReply(String d_num, String m_id, String dr_comment){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_daeta_reply(dr_comment, d_num, m_id) VALUES (?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dr_comment);
			pstmt.setString(2, d_num);
			pstmt.setString(3, m_id);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("insertDaetaReply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 알바 모집 게시판에서 댓글을 삭제하는 메서드.
	 * @param pr_num
	 */
	public void deleteParttimeReply(String pr_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_parttime_reply WHERE pr_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteParttimeReply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 대타 모집 게시판에서 댓글을 지우는 메서드.
	 * @param dr_num 댓글번호
	 */
	public void deleteDaetaReply(String dr_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_daeta_reply WHERE dr_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dr_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteDaetaReply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 알바 모집 게시판의 댓글을 수정하는 메서드.
	 * @param pr_num 댓글번호
	 * @param pr_comment 댓글내용
	 */
	public void updateParttimeReply(String pr_num, String pr_comment){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_parttime_reply SET pr_comment=? WHERE dr_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_comment);
			pstmt.setString(2, pr_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateParttimeReply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 대타 모집 게시판에서 댓글을 수정하는 메서드.
	 * @param dr_num
	 * @param dr_comment
	 */
	public void updateDaetaReply(String dr_num, String dr_comment){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_daeta_reply SET dr_comment=? WHERE dr_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dr_comment);
			pstmt.setString(2, dr_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("updateDaetaReply() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 알바 모집 게시글에 달린 모든 댓글을 가져오는 메서드.
	 * @param p_num 글번호
	 * @return prlist ParttimeReplyDTO 리스트
	 */
	public ArrayList getParttimeReplyList(String p_num){
		ArrayList prlist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_parttime_reply WHERE p_num=? ORDER BY pr_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ParttimeReplyDTO dto = new ParttimeReplyDTO();
				dto.setPr_num(rs.getString("pr_num"));
				dto.setPr_comment(rs.getString("pr_comment"));
				dto.setPr_regdate(rs.getString("pr_regdate"));
				dto.setP_num(rs.getString("p_num"));
				dto.setM_id(rs.getString("m_id"));
				
				prlist.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getParttimeReplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return prlist;
	}
	
	/**
	 * 대타 모집 게시글에 달린 모든 댓글을 가져오는 메서드.
	 * @param d_num 글번호
	 * @return drlist DaetaReplyDTO 리스트
	 */
	public ArrayList getDaetaReplyList(String d_num){
		ArrayList drlist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_daeta_reply WHERE d_num=? ORDER BY dr_regdate DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				DaetaReplyDTO dto = new DaetaReplyDTO();
				dto.setDr_num(rs.getString("dr_num"));
				dto.setDr_comment(rs.getString("dr_comment"));
				dto.setDr_regdate(rs.getString("dr_regdate"));
				dto.setD_num(rs.getString("d_num"));
				dto.setM_id(rs.getString("m_id"));
				
				drlist.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("getDaetaReplyList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return drlist;
	}
}
