package com.qosi.model;

import static org.junit.Assert.*;

import org.junit.Test;

import com.qosi.bean.LoginBean;

public class JTest_login {

	@Test
	public void test() {
		LoginBean lb = new LoginBean();
		Database db = new Database();
		
		lb.setEmail("yurijonathan94@gmail.com");
		lb.setSenha("testelogin");
		
		if(db.validate(lb)) {
			System.out.println("Success.");
		}else {
			fail("error.");
		}
	}

}
