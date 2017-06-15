package message.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MessageDTO;
import harang.dbcp.DBConnectionMgr;

/**
 * 메시지를 처리하는 클래스.
 * @author 양혜민
 *
 */
public class MessageBean {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	/**
	 * 생성자. DBConnectionMgr클래스를 통해 데이터베이스에 연결.
	 */
	public MessageBean(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : " +err);
		}
	}
	
	/**
	 * 메시지를 보내는 메서드.
	 * @param t_title
	 * @param t_content
	 * @param m_sender
	 * @param m_reader
	 */
	public void postMessage(String t_title, String t_content, String m_sender, String m_reader){
		try{
			con = pool.getConnection();
			
			String sql="INSERT INTO tbl_text(t_title, t_content, t_send_del,"
					+ "t_read_del, m_sender, m_reader) VALUES(?,?,'N','N',?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_title);
			pstmt.setString(2, t_content);
			pstmt.setString(3, m_sender);
			pstmt.setString(4, m_reader);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("postMessage() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	public ArrayList getGivenMessageList(String m_id){
		ArrayList inboxlist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_text WHERE m_reader=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MessageDTO msg = new MessageDTO();
				msg.setT_num(rs.getString("t_num"));
				msg.setT_title(rs.getString("t_title"));
				msg.setT_content(rs.getString("t_content"));
				msg.setT_send_date(rs.getString("t_send_date"));
				msg.setT_read_date(rs.getString("t_read_date"));
				msg.setT_send_del(rs.getString("t_send_del"));
				msg.setT_read_del(rs.getString("t_read_del"));
				msg.setM_sender(rs.getString("m_sender"));
				msg.setM_reader(rs.getString("m_reader"));
				
				inboxlist.add(msg);
			}
			
		}catch(Exception err){
			System.out.println("getGivenMessageList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	
		return inboxlist;
	}
}
