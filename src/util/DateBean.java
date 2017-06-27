package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 날짜 관련 메서드를 모아놓은 클래스.
 * 
 * @author 양혜민
 *
 */
public class DateBean {
	/**
	 * 마감일이 지났는지 여부를 확인하는 메서드.
	 * 
	 * @param date
	 *            마감일
	 * @return true 지남|| false 안 지남
	 */
	public boolean checkDeadline(String date) {

		// d_deadline을 Date로 형변환
		SimpleDateFormat _date = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		Calendar cal = Calendar.getInstance();

		try {
			deadline = _date.parse(date);
		} catch (Exception e) {
		}

		// deadline으로부터 dayAmount만큼 지난 날짜를 String으로 저장.
		cal.setTime(deadline);
		cal.add(Calendar.DATE, 1);
		date = _date.format(cal.getTime());

		// String으로 저장한 값을 다시 Date로 변환
		try {
			deadline = _date.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 오늘날짜와 비교해서 지났으면 true 안지났으면 false를 반환
		return deadline.before(new Date());
	}

	/**
	 * 특정날짜로부터 dayAmount(일)만큼 지난 날짜가 지났는지 여부를 확인하는 메서드.
	 * 
	 * @param date
	 *            특정 날짜
	 * @param dayAmount
	 *            일 수
	 * @return true 지남|| false 안 지남
	 */
	public boolean checkDate(String date, int dayAmount) {
		// d_deadline을 Date로 형변환
		SimpleDateFormat _date = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		Calendar cal = Calendar.getInstance();

		try {
			deadline = _date.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// deadline으로부터 dayAmount만큼 지난 날짜를 String으로 저장.
		cal.setTime(deadline);
		cal.add(Calendar.DATE, dayAmount);
		date = _date.format(cal.getTime());

		// String으로 저장한 값을 다시 Date로 변환
		try {
			deadline = _date.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 오늘날짜와 비교해서 지났으면 true 안지났으면 false를 반환
		return deadline.before(new Date());

	}
}
