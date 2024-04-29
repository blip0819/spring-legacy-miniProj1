package org.kosa.proj.board;

import java.security.Principal;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.kosa.proj.code.CodeService;
import org.kosa.proj.entity.BoardVO;
import org.kosa.proj.entity.MemberVO;
import org.kosa.proj.page.PageRequestVO;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	private static final long serialVersionUID = 1L;

	//xml 또는 어노터이션 처리하면 스프링 
	//어노터이션 처리하면 스프링 부트   
	private final BoardService boardService;
	private final CodeService codeService;

	@RequestMapping("list")
	public String list(@Valid PageRequestVO pageRequestVO, BindingResult bindingResult, Model model) throws ServletException, IOException {
		log.info("목록");
		
		log.info(pageRequestVO.toString());

        if(bindingResult.hasErrors()){
        	pageRequestVO = PageRequestVO.builder().build();
        }
        
		//2. jsp출력할 값 설정
		model.addAttribute("pageResponseVO", boardService.getList(pageRequestVO));
		//model.addAttribute("sizes", new int[] {10, 20, 50, 100});
		model.addAttribute("sizes", codeService.getList());
//		model.addAttribute("sizes", "10,20,50,100");
		
		return "board/list";
	}

	@RequestMapping("view")
	public Object view(BoardVO board, Model model) throws ServletException, IOException {
		log.info("상세보기");
		model.addAttribute("board", boardService.view(board));
		return "board/view";
	}

	@RequestMapping("delete")
	@ResponseBody
	public Object delete(@RequestBody BoardVO board) throws ServletException, IOException {
		log.info("삭제");
		int updated = boardService.delete(board);
		
		Map<String, Object> map = new HashMap<>();
		if (updated == 1) { //성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 삭제에 실패하였습니다");
		}
		
		return map;
		
	}

	@RequestMapping("updateForm")
	public Object updateForm(BoardVO board, Model model) throws ServletException, IOException {
		log.info("수정화면");
		
		//2. jsp출력할 값 설정
		model.addAttribute("board", boardService.updateForm(board));
		
		return "board/updateForm"; 
	}

	@RequestMapping("update")
	@ResponseBody
	public Map<String, Object>  update(@RequestBody BoardVO board) throws ServletException, IOException {
		log.info("수정 board => {}", board);
		
		//1. 처리
		int updated = boardService.update(board);
		
		Map<String, Object> map = new HashMap<>();
		if (updated == 1) { //성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 수정에 실패하였습니다");
		}
		
		return map;
	}

	@RequestMapping("insertForm")
	public Object insertForm() throws ServletException, IOException {
		log.info("작성 화면");		
		return "board/insertForm";
	}

	@RequestMapping("insert")
	@ResponseBody
	public Object insert(@RequestBody BoardVO boardVO, Authentication authentication) throws ServletException, IOException {
 		MemberVO loginVO = (MemberVO)authentication.getPrincipal();
 		log.info("등록 BoardVO = {}\n loginVO = {}", boardVO, loginVO);

 		Map<String, Object> map = new HashMap<>();
 		map.put("status", -99);
 		map.put("statusMessage", "게시물 등록에 실패하였습니다");

 		//로그인한 사용자를 게시물 작성자로 설정한다 
 		boardVO.setMemberID(loginVO.getMemberID());
 		int updated = boardService.insert(boardVO);
 		if (updated == 1) { //성공
 			map.put("status", 0);
		}
		return map;
	}
	

}
