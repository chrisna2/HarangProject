package login.model;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import upload.UploadBean;

public class JoinCommand implements CommandInterface {
	
	
	//DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	//DBCP 사용
	DBConnectionMgr pool;
	

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sql = "UPDATE tbl_member SET m_pw= ? , m_mail = ?, m_addr = ?, m_tel = ?, m_photo = ? WHERE m_id = ?";
		pool = DBConnectionMgr.getInstance();
		
		/**
		 * 사진 올리는 작업
		 */
		/////////////////////////////////////////////////////////////////////////////
		String realPath = request.getServletContext().getRealPath("upload");
		int maxSize = 1024 * 1024 * 1024; 
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		String photoName = null;
		Enumeration enumer =  multi.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			File file = multi.getFile(name);
			photoName = "upload/"+multi.getFilesystemName(name);
		}
		/////////////////////////////////////////////////////////////////////////////
		
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("m_pw"));
			pstmt.setString(2, multi.getParameter("m_mail"));
			pstmt.setString(3, multi.getParameter("m_addr"));
			pstmt.setString(4, multi.getParameter("m_tel"));
			pstmt.setString(5, photoName);
			pstmt.setString(6, multi.getParameter("m_id"));
			pstmt.executeUpdate();
			
		}catch(Exception err){
			
			System.out.println( "regform.jsp : " + err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt,rs);
		}		
		
		return "/index.jsp";
	}

}
