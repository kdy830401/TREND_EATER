package com.fpj.trendeater.order.model.exception;

public class OrderException extends RuntimeException {

	public OrderException() {}
	public OrderException(String msg) {
		super(msg);
	}
}
