package controller;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class Util {

	public static String filter(String s) {
		s = s.replaceAll("'", "");
		s = s.replaceAll("-", "");
		s = s.replaceAll("=", "");
		s = s.replaceAll("#", "");
		s = s.replaceAll("/", "");
		// s = s.replaceAll("*", "");

		return s;
	}

	public static boolean checkStringParam2(String s) {
		int len = s.length();
		for (int i = 0; i < len; i++) {
			if (!(((s.charAt(i) <= '9' && s.charAt(i) >= '0')|| (s.charAt(i) >= 'a' && s.charAt(i) <= 'z')|| (s.charAt(i) >= 'A' && s.charAt(i) <= 'Z')))) {
				return false;
			}
		}
		return true;
	}

	public static boolean checkStringParam(String s) {
		if (s == null || 
				s.contains("'") || 
				s.contains("''") || 
				s.contains("--") || 
				s.contains("=") || 
				s.contains("#")||
				s.contains("/") || 
				s.contains("\\") || 
				s.contains("..") || 
				s.contains(":") || 
				s.contains("*")|| 
				s.contains(")") || 
				s.contains(";") || 
				s.contains("!") ||
				// s.contains("@") ||
				s.contains("|") || 
				s.contains("&") || 
				s.contains("%n") || 
				s.contains("%s") || 
				s.contains("%2F")|| 
				s.contains("OR") || 
				s.contains("AND") || 
				s.contains("UNION") || 
				s.contains("ALL")|| 
				s.contains("SELECT") || 
				s.contains("SET")) {
			return false;
		}

		return true;
	}

	public static String removeAccent(String s) {

		String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("");
	}
}
