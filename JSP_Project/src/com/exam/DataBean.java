package com.exam;

import java.util.Calendar;

public class DataBean {
	Calendar ca = Calendar.getInstance();
	String[] arr= {"일","월","화","수","목","금","토"};
	
	public String getToday() {
		int year =ca.get(Calendar.YEAR);
		int month=ca.get(Calendar.MONTH)+1;
		int date = ca.get(Calendar.DATE);
		String today="";
		int day =ca.get(Calendar.DAY_OF_WEEK);
		today=arr[day-1]+"요일";
		return Integer.toString(year)+"년"+Integer.toString(month)+"월"+Integer.toString(date)+"일"+today;
	}
}
