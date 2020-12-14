package com.exam;

public class ScoreBean {

	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private int avg;
	
	public String getGrade() {
		String grade="";
		if(avg>=90){
			grade="A";	
		}else if(avg>=80){
			grade="B";
		}else if (avg>=70){
			grade="C";
		}else{
			grade="F";
		}
		return grade;
	}
	public int getTotal() {
		return total = kor+eng+math;
	}
	
	public int getAvg() {
		return avg = total/3;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	@Override
	public String toString() {
		return "이름=" + name + ", 국어=" + kor + ", 영어=" + eng + ", 수학=" + math;
	}
	
	
}
