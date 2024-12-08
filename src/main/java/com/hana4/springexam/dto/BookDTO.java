package com.hana4.springexam.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookDTO {
	private int bno;
	private String title;
	private String author;
	private String publisher;
	private String description;
	private String isbn;
	private int availability;
	private String borrowerId;
	private LocalDateTime startDate;
	private LocalDateTime endDate;

	@Override
	public String toString() {
		return "BookDTO{" +
			"id=" + bno +
			", title='" + title + '\'' +
			", author='" + author + '\'' +
			", publisher='" + publisher + '\'' +
			", description='" + description + '\'' +
			", isbn='" + isbn + '\'' +
			", availability=" + availability +
			", borrowerId='" + borrowerId + '\'' +
			", startDate=" + startDate +
			", endDate=" + endDate +
			'}';
	}
}
