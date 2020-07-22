package com.jujumarket.main.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.service.MainIndexService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@RequestMapping("/")
@Controller
@AllArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private MainIndexService mainservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome JUJUMARKET, 환영합니다 주주마켓. ", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("RealNew" ,mainservice.RealNew());
		
//		List<BoardItemVO> list = mainservice.RealNew();
//		System.out.println(list.toString());
		
//		BoardItemVO vo = new BoardItemVO();
//		vo.setItemName("gggg");
//		
//		List<BoardItemVO> list = new ArrayList<>();
//		
//		list.add(vo);
//		System.out.println(list.toString());
//		
//		model.addAttribute("RealNew" , list);

		
		return "/main/index";
	}
	
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * newlist(Model model) { log.info("실시간 상품 controller...");
	 * model.addAttribute("RealNew" , mainservice.RealNew());
	 * 
	 * return "RealNew";
	 * 
	 * }
	 */
	
}