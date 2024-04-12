package org.kosa.proj.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.kosa.proj.board.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	private final BoardService boardService;
	
	@RequestMapping("list")
	public String list(BoardVO board, Model model) throws ServletException, IOException {
		log.info("목록");
				
		List<BoardVO> list1 = boardService.list(board);
		model.addAttribute("list", list1);
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
		log.info("수정 화면");
		model.addAttribute("board", boardService.updateForm(board));
		return "board/updateForm";
	}

	@RequestMapping("update")
	@ResponseBody
	public Object update(@RequestBody BoardVO board) throws ServletException, IOException {
		log.info("수정 완료");
		
		int updated = boardService.update(board);
		
		Map<String, Object> map = new HashMap<>();
		if (updated == 1) { //성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 수정에 실패하였습니다.");
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
