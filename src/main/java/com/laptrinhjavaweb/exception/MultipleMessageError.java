package com.laptrinhjavaweb.exception;

import java.util.Map;

public class MultipleMessageError extends RuntimeException{

    private final Map<String, Object> errors;

    public MultipleMessageError(String message, Map<String, Object> errors) {
        super(message);
        this.errors = errors;
    }

    public Map<String, Object> getErrors(){
        return errors;
    }
}
