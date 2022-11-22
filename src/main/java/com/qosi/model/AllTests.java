package com.qosi.model;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ JTest_gerarCodigo.class, JTest_sha256.class, JTest_login.class, JTest_AlterarSenha.class })
public class AllTests {

}
