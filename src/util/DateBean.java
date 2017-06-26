package util;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 날짜 관련 메서드를 모아놓은 클래스.
 * @author 양혜민
 *
 */
public class DateBean {
	/**
	 * 마감일이 지났는지 여부를 확인하는 메서드.
	 * @param date 마감일
	 * @return true 지남|| false 안 지남
	 */
	public boolean checkDeadline(String date){
		
		// d_deadline을 Date로 형변환
		SimpleDateFormat _date = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		
		try{
			deadline = _date.parse(date);
		}catch(Exception e){}
		
		// 오늘날짜와 비교해서 지났으면 true 안지났으면 false를 반환
		return deadline.before(new Date());
	}
}
