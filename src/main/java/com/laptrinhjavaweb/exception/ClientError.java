package com.laptrinhjavaweb.exception;

public class ClientError extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public ClientError(String errorMessage) {
		super(errorMessage);
	}

}
