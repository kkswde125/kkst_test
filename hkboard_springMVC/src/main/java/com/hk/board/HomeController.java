package com.hk.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.board.dtos.HkBoardDto;
import com.hk.board.service.IBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private IBoardService boardService;
	
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	
	@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
	public String boardList(Model model) {
		logger.info("글목록조회");
		List<HkBoardDto> lists=boardService.getAllBoard();
		model.addAttribute("lists",lists);
		
		return "boardlist";
	}
	
	@RequestMapping(value = "/detailboard.do", method = RequestMethod.GET)
	public String detailboard(Model model,String seq) {
		logger.info("글상세조회");
		int sseq=Integer.parseInt(seq);
		HkBoardDto dto=boardService.getBoard(sseq);
		model.addAttribute("dto",dto);
		
		return "detailboard";
	}
	
	
	@RequestMapping(value = "/insertboard.do", method = RequestMethod.POST)
	public String insertboard(Model model,HkBoardDto dto) {
		logger.info("글쓰기");
		boolean isS=boardService.insertBoard(dto);
		if (isS) {
			return "redirect:boardlist.do";  //reponse.sendredirect 와 같은 기능
		}else {
			return "insertboard";
		}
	}
	
	@RequestMapping(value = "/insertform.do", method = RequestMethod.GET)
	public String insertform() {
		logger.info("글쓰기폼이동");
		return "insertboard";
	}
	
	
	@RequestMapping(value = "/updateform.do", method = RequestMethod.GET)
	public String updateform(Model model ,String seq) {
		logger.info("글수정폼이동");
		int sseq = Integer.parseInt(seq);
		HkBoardDto dto=boardService.getBoard(sseq);
		model.addAttribute("dto",dto);
		return "updateform"; // WEB-INF/VIEW/updateform.jsp
	}
	
	@RequestMapping(value = "/updateboard.do", method = RequestMethod.POST)
	public String updateboard(HkBoardDto dto) {
		logger.info("글수정");
		boolean isS =boardService.updateBoard(dto);
		if (isS) {
			return "redirect:detailboard.do?seq="+dto.getSeq();
		}else {
			return "redirect:updateform.do?seq="+dto.getSeq();
		}
		
	}
	
	@RequestMapping(value = "/deleteboard.do", method = RequestMethod.GET)
	public String deleteboard(HkBoardDto dto) {
		logger.info("글삭제");
		boolean isS =boardService.deleteBoard(dto.getSeq());
		if (isS) {
			return "redirect:boardlist.do";
		}else {
			return "redirect:detailboard.do?seq="+dto.getSeq();
		}
	}
	
	
}
