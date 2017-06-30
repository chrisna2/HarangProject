package harangdin.model;

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
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import harang.dbcp.DBConnectionMgr;
import paging.PagingBean;
import paging.dto.PagingDto;
import upload.RandomFileRenamePolicy;

/**
 * 도서 등록
 * @author 서지윤
 *
 */

public class RegistProcCommand implements CommandInterface {
	
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
				
		
		//////////////////////////////사진 올리는 작업////////////////////////////////
		//저장할 파일 경로 ex] WebContent/upload/member 실제 폴더 생성 해야 함
		String realPath = request.getServletContext().getRealPath("upload/book");
		int maxSize = 1024 * 1024 * 1024; // 업로드 파일 사이즈 조정
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new RandomFileRenamePolicy());
		String photoName = null;
		Enumeration enumer =  multi.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			File file = multi.getFile(name);
			photoName = "upload/book/"+multi.getFilesystemName(name);
		}			//위에 지정한 realPath와 똑같이 지정..
		//////////////////request는 사용 할수 없고  multi로 파라미터 받아올수 있음//////////////
		
		
		String check = multi.getParameter("b_choice");
		
		if("판매".equals(check)){
			sellInput(multi, photoName );
		}
		else if("기부".equals(check)){
			donateInput(multi, photoName);
		}
		
		
		
		
		HarangdinMainCommand goback = new HarangdinMainCommand();
		String url = (String) goback.processCommand(request, response);
			
		return url;
		//return "/WEB-INF/harangdin/book_regist.jsp";
	}
	
	/**
	 * 도서 판매 중 구매자와 거래가 진행 중일때
	 * @param multi
	 * @param photoName
	 * @throws IOException
	 */
	
	public void sellInput(MultipartRequest multi, String photoName) throws IOException{
		
		pool = DBConnectionMgr.getInstance();
		
		String sql="INSERT INTO tbl_book (m_id, b_choice, b_want, b_stock, b_name,  b_writer, b_pub, b_content, b_iscomplete, b_photo) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, '거래', ?)";
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, multi.getParameter("m_id"));
			pstmt.setString(2, multi.getParameter("b_choice"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("b_want")));
			pstmt.setInt(4, Integer.parseInt(multi.getParameter("b_stock")));
			pstmt.setString(5, multi.getParameter("b_name"));
			pstmt.setString(6, multi.getParameter("b_writer"));
			pstmt.setString(7, multi.getParameter("b_pub"));
			pstmt.setString(8, multi.getParameter("b_content"));			
			pstmt.setString(9, photoName);			
			
			pstmt.executeUpdate();
			
			
			
		}catch(Exception err){
			System.out.println(err);
			err.printStackTrace();
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		
	}
	
	/**
	 * 도서를 기부했을때 관리자의 승인이 나기 전
	 * @param multi
	 * @param photoName
	 */
	
	public void donateInput(MultipartRequest multi, String photoName){
		pool = DBConnectionMgr.getInstance();
		
		String sql="INSERT INTO tbl_book (m_id, b_choice, b_want, b_stock, b_name,  b_writer, b_pub, b_content, b_iscomplete) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, '기부중')";
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, multi.getParameter("m_id"));
			pstmt.setString(2, multi.getParameter("b_choice"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("b_want")));
			pstmt.setInt(4, Integer.parseInt(multi.getParameter("b_stock")));
			pstmt.setString(5, multi.getParameter("b_name"));
			pstmt.setString(6, multi.getParameter("b_writer"));
			pstmt.setString(7, multi.getParameter("b_pub"));
			pstmt.setString(8, multi.getParameter("b_content"));			
			
			pstmt.executeUpdate();
			
			
			
		}catch(Exception err){
			System.out.println(err);
		}
		finally{
			// DBCP 접속해제
			pool.freeConnection(con,pstmt);
		}
		
	}
	
	
	
}
