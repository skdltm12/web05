package com.shop.aop;


import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

/* AOP(Aspect-Oriented Programming) : 관점지향형 */
/* POJO(Plain Old Java OBject) : 전통적인 자바 객체 */
/* view에서 매번 parseInt를 하지 않고, 순수 자바 객체를 활용하여
 controller 전에 처리하여 프로그램에 이상이 없도록 자바 객체에서
 처리할 수 있도록 해보자 
 */

@Aspect
@Log4j
@Component
public class LogAdvice {
	@Before("execution(* com.shop.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("===================");
	}
}
