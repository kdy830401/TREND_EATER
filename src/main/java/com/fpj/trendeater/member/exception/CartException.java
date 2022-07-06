package com.fpj.trendeater.member.exception;

public class CartException extends RuntimeException{
	public CartException() {}
	public CartException(String msg) {
		super(msg);
	}
}
