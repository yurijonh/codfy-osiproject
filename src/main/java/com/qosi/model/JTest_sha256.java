package com.qosi.model;

import static org.junit.Assert.*;

import org.junit.Test;

public class JTest_sha256 {

	@Test
	public void test() {
		
		Database test = new Database();
		String output = test.sha256("testando");		
		String exprected = "4b93ce345002ce3e6331dd4d4d0f3391c15c4e1afd91ad5e1da667cffd8eacaa";
		
		assertEquals(exprected, output);
	}

}
