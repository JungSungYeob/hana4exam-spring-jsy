package com.hana4.springexam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hana4.springexam.dto.BookDTO;

@Repository
@Mapper
public interface BookDAO {
	List<BookDTO> getBookList();

	BookDTO getBookById(int id);

	BookDTO getResultById(int id);

	void borrowBook(BookDTO book);

}
