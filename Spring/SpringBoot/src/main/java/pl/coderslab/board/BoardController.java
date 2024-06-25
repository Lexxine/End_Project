package pl.coderslab.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.recipes.Links;
import pl.coderslab.recipes.LinksDao;
import pl.coderslab.spoonacular.Recipe;
import pl.coderslab.spoonacular.RecipeEntity;
import pl.coderslab.spoonacular.RecipyDao;
import pl.coderslab.spoonacular.SpoonacularService;
import pl.coderslab.user.User;
import pl.coderslab.user.UserService;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/boards")
public class BoardController {

    @Autowired
    private BoardRepository boardRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private LinksDao linksDao;
    @Autowired
    SpoonacularService spoonacularService;
//    @Autowired
//    EdamamService edamamService;
    @Autowired
RecipyDao recipyDao;


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
    public String displayBoardsAndRecipes(Model model,
                                          Principal principal,
                                          HttpSession session,
                                          @RequestParam(defaultValue = "0") int page) throws IOException {
        User user = getCurrentUser(principal);
        List<Board> boards = boardRepository.findAllByUserId(user.getId());
        model.addAttribute("boards", boards);
        List<Recipe> recipes = spoonacularService.getRecipes(page);
        model.addAttribute("recipes", recipes);
        session.setAttribute("currentPage", page);
        return "board/list2Board";
    }


//        @GetMapping("/recipes")
//        public String getRecipes(@RequestParam(defaultValue = "chicken") String query,
//                                 @RequestParam(defaultValue = "0") int from,
//                                 @RequestParam(defaultValue = "10") int to,
//                                 @RequestParam(required = false) String next,
//                                 Model model) {
//            RecipesResponse response;
//            if (next != null && !next.isEmpty()) {
//                // If 'next' parameter is provided, get the next page JSON
//                response = edamamService.getNextPageJson(next);
//    } else {
//                // Get initial recipes based on query, from, and to parameters
//              //  response = edamamService.getRecipes(query, from, to);
//                response = edamamService.getNextPageJson("https://api.edamam.com/api/recipes/v2?q=chicken&app_key=44c5464c459b8dee2b426b86265ec4ce&_cont=CHcVQBtNNQphDmgVQntAEX4BYkt6DAEFSmxEBGEValxwDAUFUXlSBTYQalBwUgEHRjYRB2pCZFxyBgoHQjNIC2NCYFQlAQcVLnlSVSBMPkd5AANK&from=0&to=10&type=public&app_id=69c700ad");
//            }
//
//            model.addAttribute("recipes", response.getHits());
//            model.addAttribute("nextLink", response.get_links().getNext().getHref());
//            model.addAttribute("query", query);
//            model.addAttribute("from", from);
//            model.addAttribute("to", to);
//            return "recipes";
//        }


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

    @GetMapping("/{id}/links")
    public String viewBoardLinks(@PathVariable("id") Long id, Model model, Principal principal) {
        User user = getCurrentUser(principal);
        Board board = boardRepository.findById(id).orElse(null);
        if (board == null || !board.getUser().getId().equals(user.getId())) {
            return "redirect:/boards/list";
        }
        List<Links> links = linksDao.findAllByBoardId(id);
        List<RecipeEntity> recipes = recipyDao.findAllByBoardId(id);
        model.addAttribute("board", board);
        model.addAttribute("links", links);
        model.addAttribute("recipes", recipes);
        return "board/boardLinks";
    }


}
