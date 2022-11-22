package com.qosi.model;

public class gerarCodigo {
	
	private final int tamanho = 6;
	
	public String gerarCod() {
		String codigo = "";
		for(int i=0; i<this.tamanho; i++) {
			codigo += gerarCaracteres();
		}
		
		return codigo;
	}
	
	private char gerarCaracteres() {
		int random = (int) (Math.random() * 62); // 10 digitos num�ricos + 26 letras minusculas + 26 letras maiusculas = 62

        if (random <= 9) {
            // gerar um numero entre 0 e 9 usando a tabela ASCII (entre 48-57 s�o repesentados os numeros de 0 � 9)!
            random += 48; // valor somado ao n�mero gerado aleatoriamente para corresponder ao valor na tabela ASCII...
            return (char) (random); //converte o valor em um caracter correspondente da tabela ASCII.
        } else if (random <= 35) {
            // gerar letras maiusculas (10-35) pela tabela ASCII (entre 65-90 s�o representadas as letras maiusculas)!
            random += 55;
            return (char) (random);
        } else {
            // gerar letras minusculas (36-61) pela tabela ASCII (entre 97-122 s�o representadas as letras minusculas)!
            random += 61;
            return (char) (random);
        }
	}
}
