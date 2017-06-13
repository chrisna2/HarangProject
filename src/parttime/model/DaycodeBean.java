package parttime.model;

import parttime.dto.DaycodeDto;

/**
 * daycode와 DaycodeDto를 서로 변환시켜주는 함수들을 제공하는 클래스
 * @author 양혜민
 *
 */
public class DaycodeBean {
	/**
	 * daycode를 배열로 분리하여 1이면 "Y", 0이면 "N"으로 설정.
	 * @param daycode
	 * @return DaycodeDto
	 */
	public DaycodeDto transDaycodeToDto(String daycode){
		DaycodeDto dto = new DaycodeDto();
		
		// "1010100" 형태로 저장된 String을 {'1', '0', '1', '0', '1', '0', '0'} 형태로 저장
		char[] day = daycode.toCharArray();
		
		// 만약 1과 같다면 "Y"로 표시한다.
		if(day[0] == '1'){
			dto.setMon("Y");
		}else if(day[1] == '1'){
			dto.setTue("Y");
		}else if(day[2] == '1'){
			dto.setWed("Y");
		}else if(day[3] == '1'){
			dto.setThu("Y");
		}else if(day[4] == '1'){
			dto.setFri("Y");
		}else if(day[5] == '1'){
			dto.setSat("Y");
		}else if(day[6] == '1'){
			dto.setSun("Y");
		}
		
		return dto;
	}
}
