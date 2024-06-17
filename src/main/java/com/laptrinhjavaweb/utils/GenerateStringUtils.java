package com.laptrinhjavaweb.utils;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Locale;
import java.util.regex.Pattern;

public class GenerateStringUtils {

    public static String generate(int len)
    {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(len);

        for (int i = 0; i < len; i++) {
            int index
                    = (int)(AlphaNumericString.length()
                    * Math.random());
            sb.append(AlphaNumericString
                    .charAt(index));
        }
        return sb.toString();
    }

    public static String generateMa(String ten){
        final Pattern NONLATIN = Pattern.compile("[^\\w-]");
        final Pattern WHITESPACE = Pattern.compile("[\\s]");
        ten = ten.replace('Đ', 'd').replace('đ', 'd');
        String noseparators = WHITESPACE.matcher(ten).replaceAll("");
        String normalized = Normalizer.normalize(noseparators, Form.NFD);
        String ma = NONLATIN.matcher(normalized).replaceAll("");
        ma = ma.toLowerCase(Locale.ENGLISH);
        String number = "0123456789";
        for (int i = 0; i < 4; i++) {
            int index
                    = (int)(number.length()
                    * Math.random());
            ma += number.charAt(index);
        }
        return ma;
    }
}
