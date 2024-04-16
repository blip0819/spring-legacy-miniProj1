package org.kosa.proj.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.kosa.proj.code.CodeService;
import org.kosa.proj.entity.BoardVO;
import org.kosa.proj.page.PageRequestVO;
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
	
//	@RequestMapping("clear")
//	public Object clear(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
//	    int totalBoardCount = boardService.getTotalBoardCount();
//	    int updated = boardService.clear(board);
//	    
//	    Map<String, Object> map = new HashMap<String, Object>();
//	    if (updated == totalBoardCount) { // 성공
//	        map.put("status", 0);
//	    } else {
//	        map.put("status", -99);
//	        map.put("statusMessage", "게시물 전체 삭제에 실패하였습니다");
//	    }
//	    
//	    return "list";
//	}

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
			map.put("statusMessage", "게시물 정보 수정 실패하였습니다");
		}
		
		return map;
	}

	public Object insertForm(HttpServletRequest request) throws ServletException, IOException {
		log.info("작성 화면");
		return "boardInsertForm";
	}

	public Object boardInsert(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		log.info("게시 완료");
		
		int updated = boardService.insert(board);

		Map<String, Object> map = new HashMap<String, Object>();
		if (updated == 1) { //성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "게시글 작성에 실패했습니다.");
		}
		return map;
	}
	

}
