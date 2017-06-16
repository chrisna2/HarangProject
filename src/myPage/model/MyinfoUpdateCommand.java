package myPage.model;

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
import upload.RandomFileRenamePolicy;
import upload.TimestampFileRenamePolicy;

/**
 * 개인정보 수정 클래스
 * @author YOO
 *
 */
public class MyinfoUpdateCommand implements CommandInterface {
	

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
		
		HttpSession session = request.getSession();
		
		String sql1 = "UPDATE tbl_member SET m_mail = ?, m_addr = ?, m_tel = ?, m_photo = ? WHERE m_id = ?";
		
		String sql2 = "select m_name, m_dept, m_mail, m_tel, m_addr, m_point, m_photo, m_fee, m_grade, m_birth, m_regdate "
				+ "from tbl_member where m_id = ?";
				
		
				
		pool = DBConnectionMgr.getInstance();
		
		//////////////////////////////사진 올리는 작업////////////////////////////////
		//저장할 파일 경로 ex] WebContent/upload/member 실제 폴더 생성 해야 함
		String realPath = request.getServletContext().getRealPath("upload/member");
		int maxSize = 1024 * 1024 * 1024; // 업로드 파일 사이즈 조정
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new RandomFileRenamePolicy());
		String photoName = multi.getParameter("m_photo");
		Enumeration enumer =  multi.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			File file = multi.getFile(name);
			photoName = "upload/member/"+multi.getFilesystemName(name);
		}			//위에 지정한 realPath와 똑같이 지정..
		//////////////////request는 사용 할수 없고  multi로 파라미터 받아올수 있음//////////////
		
		
		System.out.println(multi.getParameter("m_mail"));
		System.out.println(multi.getParameter("m_addr"));
		System.out.println(multi.getParameter("m_tel"));
		System.out.println(photoName);
		System.out.println(multi.getParameter("m_id"));
		
		try{
			//회원 정보 업데이트 수정
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, multi.getParameter("m_mail"));
			pstmt.setString(2, multi.getParameter("m_addr"));
			pstmt.setString(3, multi.getParameter("m_tel"));
			pstmt.setString(4, photoName);
			pstmt.setString(5, multi.getParameter("m_id"));
			pstmt.executeUpdate();
			
			
			//회원정보 동기화
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, multi.getParameter("m_id"));
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String m_name = rs.getString("m_name");
			String m_dept = rs.getString("m_dept");
			String m_mail = rs.getString("m_mail");
			String m_tel = rs.getString("m_tel");
			String m_addr = rs.getString("m_addr");
			long m_point = rs.getLong("m_point");
			String m_photo = rs.getString("m_photo");
			int m_fee = rs.getInt("m_fee");
			int m_grade = rs.getInt("m_grade");
			String m_birth = rs.getString("m_birth");
			String m_regdate = rs.getString("m_regdate");
			
			MemberDTO mdto = new MemberDTO();
			
			mdto.setM_id(multi.getParameter("m_id"));
			mdto.setM_name(m_name);
			mdto.setM_dept(m_dept);
			mdto.setM_mail(m_mail);
			mdto.setM_tel(m_tel);
			mdto.setM_addr(m_addr);
			mdto.setM_point(m_point);
			mdto.setM_photo(m_photo);
			mdto.setM_fee(m_fee);
			mdto.setM_grade(m_grade);
			mdto.setM_birth(m_birth);
			mdto.setM_regdate(m_regdate);
			
			session.setAttribute("member", mdto);
			
		}catch(Exception err){
			
			System.out.println( "regform.jsp : " + err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}		
		
		return "/WEB-INF/login/main.jsp";
	}

}
