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
import dto.PagingDto;
import harang.dbcp.DBConnectionMgr;
import myPage.CommandInterface;
import util.PagingBean;
import util.RandomFileRenamePolicy;

/**
 * 회원 스펙 등록과 관련한 커멘드 클래스
 * @author 나현기
 *
 */
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
		
		String check = multi.getParameter("check");
		String msg = null;
		
		if("insert".equals(check)){
			msg = challenge(multi,photoName);
		}else if("update".equals(check)){
			msg = rechallenge(multi, photoName);
		}
		
		request.setAttribute("msg", msg);

		return "/WEB-INF/myPage/specUpComplete.jsp";
	}
	
	/**
	 * 스펙 신규 등록 메소드
	 * @param multi 멀티 파트 리퀘스트
	 * @param photoName 사진 저장 경로
	 * @return 입력결과
	 */
	public String challenge(MultipartRequest multi, String photoName) {
		
		String msg = "";
		String sql = "INSERT INTO  tbl_certi_member (c_num, m_id, cm_iscomplete, cm_image) VALUES (?, ?, ?, ?)";
		pool = DBConnectionMgr.getInstance();
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("c_num"));
			pstmt.setString(2, multi.getParameter("m_id"));
			pstmt.setString(3, "none");
			pstmt.setString(4, photoName);
			int i = pstmt.executeUpdate();
			
			if(i==0){
				msg = "challenge_fail";
			}
			else{
				msg = "challenge_success";
			}
					
		} catch (Exception e) {
			System.out.println("specup_proc.jsp : "+e);
			e.printStackTrace();
		}finally {
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		return msg;
	}
	/**
	 * 스펙업 재도전 메소드
	 * @param multi 멀티 파트 리퀘스트
	 * @param photoName 사진 저장 경로
	 * @return 입력결과
	 */
	public String rechallenge(MultipartRequest multi, String photoName) {
		
		String msg = "";
		String sql = "UPDATE tbl_certi_member SET cm_iscomplete='none', cm_completedate=NULL, cm_image=? WHERE c_num=? and m_id=?";		
		
		pool = DBConnectionMgr.getInstance();
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, photoName);
			pstmt.setString(2, multi.getParameter("c_num"));
			pstmt.setString(3, multi.getParameter("m_id"));
			int i = pstmt.executeUpdate();
			
			if(i==0){
				msg = "rechallenge_fail";
			}
			else{
				msg = "rechallenge_success";
			}
			
		} catch (Exception e) {
			System.out.println("specup_proc.jsp : "+e);
			e.printStackTrace();
		}finally {
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		return msg;
	}
	
	
}
