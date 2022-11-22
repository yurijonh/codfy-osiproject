package com.qosi.model;

import static org.junit.Assert.*;

import org.junit.Test;

public class JTest_AlterarSenha {

	@Test
	public void test() {
		Database db = new Database();
		
		String atualPassword = "testelogin";
		String newPassword = "novasenha";
		
		if(db.alterarSenha(atualPassword, newPassword)) {
			System.out.println("Success.");
		}else {
			fail("error.");
		}
	}

}
