package message.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dto.MemberDTO;
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
	 * 로그인 정보를 받아오는 메서드.
	 * @param req
	 * @return 회원 정보
	 */
	public MemberDTO getLoginInfo(HttpServletRequest req){
		MemberDTO login = null;
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		MemberDTO admin = (MemberDTO)req.getSession().getAttribute("admin");
		
		if (admin != null){ 
			login = admin;
		}else{ 
			login = member;
		}
		
		return login;
	}
	
	/**
	 * 회원 정보를 검색하는 메서드.
	 * @param m_id 회원id
	 * @return 회원정보
	 */
	public MemberDTO getMember(String m_id){
		MemberDTO mdto = new MemberDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="select * from tbl_member where m_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mdto.setM_id(rs.getString("m_id"));
				mdto.setM_name(rs.getString("m_name"));
				mdto.setM_dept(rs.getString("m_dept"));
				mdto.setM_mail(rs.getString("m_mail"));
				mdto.setM_tel(rs.getString("m_tel"));
				mdto.setM_addr(rs.getString("m_addr"));
				mdto.setM_point(rs.getLong("m_point"));
				mdto.setM_photo(rs.getString("m_photo"));
				mdto.setM_fee(rs.getInt("m_fee"));
				mdto.setM_grade(rs.getInt("m_grade"));
				mdto.setM_birth(rs.getString("m_birth"));
				mdto.setM_regdate(rs.getString("m_regdate"));
			}
			
		}catch(Exception err){
			System.out.println("getMember() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return mdto;
	}

	/**
	 * 회원이름으로 회원번호를 검색하는 메서드. 
	 * @param m_name
	 * @return
	 */
	public String[] getMember_id(String m_name){
		String[] arrID = null;
		try{
			con = pool.getConnection();
			int i=0;
			
			try{
				con = pool.getConnection();
				
				String sql="select count(m_id) from tbl_member where m_name like '%"+m_name+"%'";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				rs.next();
				i = rs.getInt(1);
				
			}catch(Exception err){
				System.out.println("getMember_id() inner : " + err);
				err.printStackTrace();
			}
			
			arrID = new String[i];
			String sql="select m_id from tbl_member where m_name like '%"+m_name+"%'";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			for(int j=0;j<i;j++){
				rs.next(); 
				arrID[j] = rs.getString("m_id");
			}
		}catch(Exception err){
			System.out.println("getMember_id() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		
		return arrID;
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
	
	/**
	 * 받은 메시지를 모두 검색하는 메서드.
	 * @param m_id
	 * @return 받은 메시지 리스트
	 */
	public ArrayList getGivenMessageList(String m_id){
		ArrayList inboxlist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_text WHERE m_reader=? AND NOT m_sender=? AND t_read_del = 'N' "
							+ "ORDER BY t_send_date DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
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
	
	/**
	 * 보낸 메시지를 모두 검색하는 메서드.
	 * @param m_id
	 * @return 보낸 메시지 리스트
	 */
	public ArrayList getSentMessageList(String m_id){
		ArrayList sendlist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_text WHERE m_sender=? AND NOT m_reader=? AND t_send_del = 'N'"
					+ "ORDER BY t_send_date DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
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
				
				sendlist.add(msg);
			}
			
		}catch(Exception err){
			System.out.println("getSentMessageList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	
		return sendlist;
	}
	
	/**
	 * 내게 쓴 메시지를 모두 검색하는 메서드.
	 * @param m_id
	 * @return 내게 쓴 메시지 리스트
	 */
	public ArrayList getToMeMessageList(String m_id){
		ArrayList tomelist = new ArrayList();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_text WHERE m_reader=? AND m_sender =?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
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
				
				tomelist.add(msg);
			}
			
		}catch(Exception err){
			System.out.println("getGivenMessageList() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	
		return tomelist;
	}

	/**
	 * 메시지 번호로 메시지를 검색하는 메서드.
	 * @param sender
	 * @param reader
	 * @return 메시지 정보
	 */
	public MessageDTO getMessage(String t_num){
		MessageDTO msg = new MessageDTO();
		
		try{
			con = pool.getConnection();
			
			String sql="SELECT * FROM tbl_text WHERE t_num = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				msg.setT_num(rs.getString("t_num"));
				msg.setT_title(rs.getString("t_title"));
				msg.setT_content(rs.getString("t_content"));
				msg.setT_send_date(rs.getString("t_send_date"));
				msg.setT_read_date(rs.getString("t_read_date"));
				msg.setT_send_del(rs.getString("t_send_del"));
				msg.setT_read_del(rs.getString("t_read_del"));
				msg.setM_sender(rs.getString("m_sender"));
				msg.setM_reader(rs.getString("m_reader"));
			}
			
		}catch(Exception err){
			System.out.println("getMessage() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		return msg;
	}
	
	/**
	 * 보낸 사람이 삭제하지 않았을 때 받은 메시지를 삭제하는 메서드.
	 * @param t_num
	 */
	public void deleteGivenMessage_first(String t_num){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_text SET t_read_del = 'Y' WHERE t_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteGivenMessage_first() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 받은 사람이 삭제하지 않았을 때 보낸 메시지를 삭제하는 메서드.
	 * @param t_num
	 */
	public void deleteSentMessage_first(String t_num){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_text SET t_send_del = 'Y' WHERE t_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteSendMessage_first() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * 메시지를 삭제하는 메서드.
	 * @param t_num
	 */
	public void deleteMessage(String t_num){
		try{
			con = pool.getConnection();
			
			String sql="DELETE FROM tbl_text WHERE t_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("deleteMessage() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 메시지를 읽은 시간을 저장하는 메서드.
	 * @param t_num
	 */
	public void readMessage(String t_num){
		try{
			con = pool.getConnection();
			
			String sql="UPDATE tbl_text SET t_read_date=NOW() WHERE t_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_num);
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("readMessage() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
	}

	/**
	 * 아직 읽지 않은 메시지의 개수를 검색하는 메서드.
	 * @param m_id
	 * @return 읽지 않은 메시지의 개수
	 */
	public int getNotReadMessage(String m_id){
		int notRead=0;
		try{
			con = pool.getConnection();
			
			String sql="SELECT count(t_num) FROM tbl_text WHERE m_reader = ? "
					+ "AND t_read_date = null AND NOT m_sender = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			notRead = rs.getInt(1);
			
		}catch(Exception err){
			System.out.println("getNotReadMessage() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		return notRead;
	}
	
	/**
	 * 아직 읽지 않은 내게 보낸 메시지의 개수를 구하는 메서드.
	 * @param m_id
	 * @return 내게 보낸 메시지중 아직 읽지 않은 메시지의 개수
	 */
	public int getNotReadMessage_toMe(String m_id){
		int notRead=0;
		try{
			con = pool.getConnection();
			
			String sql="SELECT count(t_num) FROM tbl_text WHERE m_reader = ? "
					+ "AND t_read_date is null AND m_sender = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			notRead = rs.getInt(1);
			
		}catch(Exception err){
			System.out.println("getNotReadMessage_toMe() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt);
		}
		return notRead;
	}
}
