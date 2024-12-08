package com.hana4.springexam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hana4.springexam.dao.BookDAO;
import com.hana4.springexam.dto.BookDTO;

@Service
public class BookService {
	private final BookDAO bookDAO;

	public BookService(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public void borrowBook(int id, String borrowerId) {
		bookDAO.borrowBook(id, borrowerId);
	}

	public List<BookDTO> getBookList() {
		return bookDAO.getBookList();
	}

	public BookDTO getBookById(int id) {
		return bookDAO.getBookById(id);
	}

	public BookDTO getResultById(int id) {
		return bookDAO.getResultById(id);
	}
}
