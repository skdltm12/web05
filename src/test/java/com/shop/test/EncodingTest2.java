package com.shop.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;


@Repository
public class EncodingTest2 {
	public static void main(String[] args) {
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		System.out.println(passEncoder.encode("4444"));
	}
}