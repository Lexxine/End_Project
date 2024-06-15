package pl.coderslab.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.user.User;
import pl.coderslab.user.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/boards")
public class BoardController {

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private UserService userService;

    @GetMapping("/add")
    public String showAddBoardForm(Model model) {
        model.addAttribute("board", new Board());
        return "board/addFormBoard";
    }

    @PostMapping("/add")
    public String saveBoard(
            @RequestParam("name") String paramName,
            @RequestParam("description") String paramDescription,
            Principal principal) {
        Board board = new Board();
        board.setName(paramName);
        board.setDescription(paramDescription);

        User user = getCurrentUser(principal);
        board.setUser(user);
        boardRepository.save(board);
        return "redirect:/boards/list";
    }

    @GetMapping("/list")
    public String listBoards(Model model, Principal principal) {
        User user = getCurrentUser(principal);
        List<Board> boards = boardRepository.findAllByUserId(user.getId());
        model.addAttribute("boards", boards);
        return "board/list2Board";
    }

    @PostMapping("/delete/{id}")
    public String deleteBoard(@PathVariable Long id, Principal principal) {
        User user = getCurrentUser(principal);
        Board board = boardRepository.findById(id).orElse(null);
        if (board != null && board.getUser().getId().equals(user.getId())) {
            boardRepository.delete(board);
        }
        return "redirect:/boards/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditBoardForm(@PathVariable("id") Long id, Model model, Principal principal) {
        Board board = boardRepository.findById(id).orElse(null);
        if (board == null || !board.getUser().getId().equals(getCurrentUser(principal).getId())) {
            return "redirect:/boards/list";
        }
        model.addAttribute("board", board);
        return "board/editFormBoard";
    }

    @PostMapping("/edit/{id}")
    public String updateBoard(
            @PathVariable("id") Long id,
            @RequestParam("name") String paramName,
            @RequestParam("description") String paramDescription,
            Principal principal) {
        Board board = boardRepository.findById(id).orElse(null);
        if (board == null || !board.getUser().getId().equals(getCurrentUser(principal).getId())) {
            return "redirect:/boards/list";
        }
        board.setName(paramName);
        board.setDescription(paramDescription);
        boardRepository.save(board);
        return "redirect:/boards/list";
    }

    private User getCurrentUser(Principal principal) {
        return userService.findByUserName(principal.getName());
    }
}