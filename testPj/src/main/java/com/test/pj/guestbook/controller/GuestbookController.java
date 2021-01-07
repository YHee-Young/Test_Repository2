package com.test.pj.guestbook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.pj.guestbook.model.GuestbookService;
import com.test.pj.guestbook.model.GuestbookVO;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
	private static final Logger logger
		= LoggerFactory.getLogger(GuestbookController.class);
	
	@Autowired
	private GuestbookService gbookService;
	
	@RequestMapping(value="/bookWrite.do", method = RequestMethod.GET)
	public String insertView() {
		logger.info("입력화면 보여주기");
		return "guestbook/bookWrite";
	}
	
	@RequestMapping(value="/bookWrite.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute GuestbookVO vo,Model model) {
		logger.info("입력화면 보여주기");
		
		int cnt=gbookService.insertGbook(vo);
		
		String msg="입력 실패", url="/guestbook/bookWrite.do";
		if(cnt>0) {
			msg="입력 성공";
			url="/guestbook/bookList.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
