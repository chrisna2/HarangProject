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
import login.LoginBean;
import login.model.RefreshCommand;
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
			
		}catch(Exception err){
			
			System.out.println( "regform.jsp : " + err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		
		RefreshCommand re = new RefreshCommand();
		String url = (String)re.processCommand(request, response);
		
		return url;
	}

}
