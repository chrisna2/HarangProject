package myPage.model;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import dto.CertiDTO;
import dto.CertiMemberDTO;
import dto.MemberDTO;
import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;
import upload.RandomFileRenamePolicy;

public class SpecUpProcCommand implements CommandInterface {

	// DB 커넥션 3 대장
	Connection con;
	PreparedStatement pstmt;
	DataSource ds;
	ResultSet rs;
	// DBCP 사용
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		pool = DBConnectionMgr.getInstance();
		
		//////////////////////////////사진 올리는 작업////////////////////////////////
		//저장할 파일 경로 ex] WebContent/upload/member 실제 폴더 생성 해야 함
		String realPath = request.getServletContext().getRealPath("upload/spec");
		int maxSize = 1024 * 1024 * 1024; // 업로드 파일 사이즈 조정
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new RandomFileRenamePolicy());
		String photoName = null;
		Enumeration enumer =  multi.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			File file = multi.getFile(name);
			photoName = "upload/spec/"+multi.getFilesystemName(name);
		}			//위에 지정한 realPath와 똑같이 지정..
		//////////////////request는 사용 할수 없고  multi로 파라미터 받아올수 있음//////////////
		
		String sql = "INSERT INTO  tbl_certi_member (c_num, m_id, cm_iscomplete, cm_image) VALUES (?, ?, ?, ?)";
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("c_num"));
			pstmt.setString(2, multi.getParameter("m_id"));
			pstmt.setString(3, "none");
			pstmt.setString(4, photoName);
			pstmt.executeUpdate();
					
		} catch (Exception e) {
			System.out.println("specup_proc.jsp : "+e);
			e.printStackTrace();
		}finally {
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}

		return "/WEB-INF/myPage/specUpComplete.jsp";
	}
}
