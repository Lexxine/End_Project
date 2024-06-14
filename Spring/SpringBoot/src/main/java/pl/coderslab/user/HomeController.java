package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.recipes.Links;
import pl.coderslab.recipes.LinksDao;

import java.util.List;

@Controller
@RequestMapping("/user")
public class HomeController {

    @Autowired
    private LinksDao linksDao;

    @GetMapping("add")
    public String showAddLinkForm() {
        return "addForm";
    }

    @PostMapping("add")
    public String saveLink(
            @RequestParam("paramName") String paramName,
            @RequestParam("paramTitle") String paramTitle,
            @RequestParam("paramDescription") String paramDescription) {

        Links newLink = new Links();
        newLink.setUrl(paramName);
        newLink.setTitle(paramTitle);
        newLink.setDescription(paramDescription);

        linksDao.save(newLink);

        return "redirect:/user/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Links> linksList = linksDao.findAll();
        model.addAttribute("links", linksList);
        return "list2";
    }

    @PostMapping("delete/{id}")

    public String deleteLink(@PathVariable("id") Long id) {
        Links linkToDelete = linksDao.findById(id);
        linksDao.delete(linkToDelete);
        return "redirect:/user/list";
    }

    @GetMapping("edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Links link = linksDao.findById(id);
        model.addAttribute("link", link);
        return "editForm";
    }

    @PostMapping("edit/{id}")
    public String updateLink(
            @PathVariable("id") Long id,
            @RequestParam("paramName") String paramName,
            @RequestParam("paramTitle") String paramTitle,
            @RequestParam("paramDescription") String paramDescription) {
        Links link = linksDao.findById(id);
        link.setUrl(paramName);
        link.setTitle(paramTitle);
        link.setDescription(paramDescription);
        linksDao.save(link);
        return "redirect:/user/list";
    }
}
