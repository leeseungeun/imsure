package com.hana.imsure.common.utils;

public class RandomStringGenerator {

	private static String[] charSet = { 
		"0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ,
		"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
		"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
	};

	public static String generateRandomString(int length) {

		String randomNum = "";

		for (int i = 0; i < length; i++) {
			int tmp = (int) (Math.random() * charSet.length);
			randomNum += charSet[tmp];
		}

		return randomNum;
	}

}
