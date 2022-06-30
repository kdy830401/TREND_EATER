package com.fpj.trendeater.member.exception;

public class  MemberException extends RuntimeException {

	   // Checked Exception & Unchecked Exception
	   //       Checked Exception : 예외처리가 필수
	   //       Unchecked Exception : 예외처리 선택
	   
	   // Unchecked Exception의 조상 Runtime Exception
	   // Checked Exception의 조상은 Exception
	   
	   // 예외 처리할 필요가 없게 extends를 Runtime Exception로 변경
	   
	   public MemberException() {}
	   public MemberException(String msg) {
	      super(msg);
	   }
}
