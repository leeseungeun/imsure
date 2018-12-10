package com.hana.imsure.common.utils;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class Convertor {

	//보험나이 변환
	public String ageConvertor(String birth) {
		
		System.out.println(birth);
		int birthYear = Integer.parseInt(birth.substring(0, 4));
		int birthMonth = Integer.parseInt(birth.substring(4, 6));
		int birthDay = Integer.parseInt(birth.substring(6, 8));
		
		Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
       
        //보험나이(만 나이) 계산
        int age = currentYear - birthYear;
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)  
            age--;
        
		return String.valueOf(age);
	}
	
	//소득 변환
	public String incomeConvertor(String income) {
		
		int incomeNum = Integer.parseInt(income);
		
		if (incomeNum < 2400)
	        return "1";
	    if ( 2400 <= incomeNum && incomeNum < 4800)
	        return "2";
	    return "3";
	}
	
	//질병보장보험
	public Map<String, Object> cancer(String birth, String income) {
		
		//결과정보를 담을 맵 선언
		Map<String, Object> map = new HashMap<String, Object>();
		
		//소득값 변환하고 맵에 저장
		map.put("income", incomeConvertor(income));
		
		//생년월일 변환하고 맵에 저장
		int age = Integer.parseInt(ageConvertor(birth));
		
		if (20 <= age && age <= 50) {
			map.put("age", "1");
		} else {
			map.put("age", "A");
		}
		
		return map;
	}
	
	//사망보험
	public Map<String, Object> death(String birth, String income) {
		
		//결과정보를 담을 맵 선언
		Map<String, Object> map = new HashMap<String, Object>();
		
		//소득값 변환하고 맵에 저장
		map.put("income", incomeConvertor(income));
		
		//생년월일 변환하고 맵에 저장
		int age = Integer.parseInt(ageConvertor(birth));
				
		if (15 <= age && age <= 40) {
			map.put("age", "5");			
		} else {
			map.put("age", "A");
		}
				
		return map;
	}
	
	//연금보험
	public Map<String, Object> pension(String birth, String income) {
			
		//결과정보를 담을 맵 선언
		Map<String, Object> map = new HashMap<String, Object>();
			
		//소득값 변환하고 맵에 저장
		map.put("income", incomeConvertor(income));
			
		//생년월일 변환하고 맵에 저장
		int age = Integer.parseInt(ageConvertor(birth));
					
		if (45 <= age && age < 55) {
			map.put("age", "3");
		} else if (55 <= age && age <= 80) {
			map.put("age", "4");
		} else {
			map.put("age", "A");
		}
					
		return map;
	}
}
