package com.qosi.model;

import static org.junit.Assert.*;

import org.junit.Test;

public class JTest_gerarCodigo {

	@Test
	public void test() {
		gerarCodigo test = new gerarCodigo();
		String output = test.gerarCod();
		int expected = 6;
				
		assertEquals(expected, output.length());
	}

}
