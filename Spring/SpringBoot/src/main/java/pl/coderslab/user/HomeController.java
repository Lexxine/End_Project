package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.board.Board;
import pl.coderslab.board.BoardRepository;
import pl.coderslab.recipes.Links;
import pl.coderslab.recipes.LinksDao; // Import klasy DAO

import java.util.List;

@Controller
@RequestMapping("/user")
public class HomeController {

    @Autowired
    private LinksDao linksDao;

    @Autowired
    private BoardRepository boardRepository;

    @GetMapping("/add")
    public String showAddLinkForm(Model model) {
        model.addAttribute("boards", boardRepository.findAll());
        return "addForm";
    }

    @PostMapping("/add")
    public String saveLink(
            @RequestParam("paramName") String paramName,
            @RequestParam("paramTitle") String paramTitle,
            @RequestParam("paramDescription") String paramDescription,
            @RequestParam("boardId") Long boardId) {

        Board board = boardRepository.findById(boardId).orElse(null);


        Links newLink = new Links();
        newLink.setUrl(paramName);
        newLink.setTitle(paramTitle);
        newLink.setDescription(paramDescription);
      //  newLink.setId(boardId);
        newLink.setBoard(board);

        linksDao.save(newLink); // Użycie metody z klasy DAO

        return "redirect:/boards/list";
      //  return "redirect:/boards/boardId/links";
    }


    @GetMapping("/list")
    public String list(Model model) {
        List<Links> linksList = linksDao.findAll(); // Użycie metody z klasy DAO
        model.addAttribute("links", linksList);
        return "list2";
    }

    @PostMapping("/delete/{id}")
    public String deleteLink(@PathVariable("id") Long id) {
        Links linkToDelete = linksDao.findById(id); // Użycie metody z klasy DAO
        linksDao.delete(linkToDelete); // Użycie metody z klasy DAO
        return "redirect:/user/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Links link = linksDao.findById(id); // Użycie metody z klasy DAO
        model.addAttribute("link", link);
        return "editForm";
    }

    @PostMapping("/edit/{id}")
    public String updateLink(
            @PathVariable("id") Long id,
            @RequestParam("paramName") String paramName,
            @RequestParam("paramTitle") String paramTitle,
            @RequestParam("paramDescription") String paramDescription,
            @RequestParam("boardId") Long boardId) {

        Board board = boardRepository.findById(boardId).orElse(null);
        Links link = linksDao.findById(id); // Użycie metody z klasy DAO
        link.setUrl(paramName);
        link.setTitle(paramTitle);
        link.setDescription(paramDescription);
        link.setBoard(board);

        linksDao.update(link); // Użycie metody z klasy DAO

        return "redirect:/user/list";
    }
}
