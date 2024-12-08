package com.hana4.springexam;

import java.util.Locale;

import lombok.Getter;

@Getter
public enum Lang {
	DEFAULT("한국어", Locale.KOREAN),
	ENGLISH("English", Locale.ENGLISH);

	private final String lang;
	private final Locale locale;

	Lang(String lang, Locale locale) {
		this.lang = lang;
		this.locale = locale;
	}
}
