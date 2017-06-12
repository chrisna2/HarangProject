package bamboo.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Bb_List_Command implements CommandInterface 
{
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) 
	{
		
		// 우리 프로젝트에서 왼쪽 GNB상의 대나무숲을 누르면!! Session에 저장된 id 받아오고 확인. 
		
				
		
		// 관리자면 대나무숲 관리자 리스트 페이지(=관리자 메인페이지) 로 이동



 

			return "/WEB-INF/bamboo/u_bb_list.jsp";

	}
}
