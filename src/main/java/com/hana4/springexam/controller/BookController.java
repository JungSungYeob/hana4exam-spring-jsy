package com.hana4.springexam.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.hana4.springexam.Lang;
import com.hana4.springexam.dto.BookDTO;
import com.hana4.springexam.dto.LocaleDTO;
import com.hana4.springexam.service.BookService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/book")
public class BookController {

	private final BookService bookService;

	private final String sessLocale =
		SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME;

	private void book(@PathVariable Integer id, Model model,
		HttpSession session, HttpServletRequest request) {
		BookDTO book = bookService.getBookById(id);

		model.addAttribute("book", book);
		model.addAttribute("languages", Lang.values());
		Locale currLang = (Locale)session.getAttribute(sessLocale);
		model.addAttribute("currLang", currLang);
		model.addAttribute("currentUrl", request.getRequestURI());
	}

	public BookController(BookService bookService) {
		this.bookService = bookService;
	}

	@GetMapping("/list")
	public String getBookList(Model model, HttpSession session, HttpServletRequest request) {
		List<BookDTO> booklist = bookService.getBookList();
		model.addAttribute("books", bookService.getBookList());
		model.addAttribute("languages", Lang.values());
		Locale currLang = (Locale)session.getAttribute(sessLocale);
		model.addAttribute("currLang", currLang);
		model.addAttribute("currentUrl", request.getRequestURI());
		return "book/list";
	}

	@GetMapping("/read/{id}")
	public String getDetail(@PathVariable Integer id, Model model, HttpSession session, HttpServletRequest request) {
		book(id, model, session, request);
		return "book/detail";
	}

	@PostMapping("/borrow")
	public String borrowBook(BookDTO book) {
		bookService.borrowBook(book);
		return "redirect:/book/result/" + book.getBno();
	}

	@GetMapping("/result/{id}")
	public String getResult(@PathVariable Integer id, Model model, HttpSession session, HttpServletRequest request) {
		book(id, model, session, request);
		return "book/result";
	}

	@PostMapping("/changelang")
	public String changeLang(@ModelAttribute LocaleDTO locale, String redirectUrl, HttpSession session) {
		session.setAttribute(sessLocale, locale.getLocale());
		return "redirect:" + redirectUrl;
	}
}
