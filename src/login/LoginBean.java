package login;

import javax.servlet.http.HttpServletRequest;

import dto.MemberDTO;
/**
 * 로그인 정보를 가져오는 클래스.
 * @author 양헤민
 *
 */
public class LoginBean {
	/**
	 * 세션에 저장된 로그인 정보를 가져오는 메서드.
	 * @param req 
	 * @return MemberDTO 로그인정보 
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
	 * 관리자인지 아닌지 체크하는 메서드.
	 * @param m_id 로그인 회원 id
	 * @return true 관리자 || false 일반회원 
	 */
	public Boolean adminCheck(String m_id){
		if(m_id.equals("admin01") || m_id.equals("admin02") || m_id.equals("admin03") 
				|| m_id.equals("admin04") || m_id.equals("admin05") || m_id.equals("admin06") ){
			return true;
		}
		return false;
	}
}
