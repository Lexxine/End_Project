package pl.coderslab.spoonacular;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.board.Board;
import pl.coderslab.board.BoardRepository;

@Controller
@RequestMapping("/recipes")
public class RecipesController {

    private final SpoonacularService spoonacularService;
    private final RecipyDao recipyDao;
    @Autowired
    private BoardRepository boardRepository;

    public RecipesController(SpoonacularService spoonacularService, RecipyDao recipyDao) {
        this.spoonacularService = spoonacularService;
        this.recipyDao = recipyDao;
    }

    @PostMapping("/saveRecipe")
    public String saveRecipy(
            @RequestParam("title") String name,
            @RequestParam("image") String imageUrl,
            @RequestParam("sourceUrl") String urlToRecipy,
            @RequestParam("calories") String calories,
            @RequestParam("carbs") String carbs,
            @RequestParam("protein") String protein,
            @RequestParam("fat") String fat,
            @RequestParam("boardId") Long boardId) {

        Board board = boardRepository.findById(boardId).orElse(null);
        RecipeEntity recipe = new RecipeEntity();

        recipe.setName(name);
        recipe.setImageUrl(imageUrl);
        recipe.setUrlToRecipy(urlToRecipy);
        recipe.setCalories(Integer.parseInt(calories));
        recipe.setCarbs(Integer.parseInt(carbs));
        recipe.setProtein(Integer.parseInt(protein));
        recipe.setFat(Integer.parseInt(fat));
        recipe.setBoard(board);
        recipyDao.save(recipe);

        return "redirect:/boards/" + boardId + "/links";
    }

    @PostMapping("/delete/{id}")
    public String deleteLink(@PathVariable("id") Long id) {
        RecipeEntity recipeToDelete = recipyDao.findById(id);
        recipyDao.delete(recipeToDelete);
        return "redirect:/boards/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        RecipeEntity recipe = recipyDao.findById(id);
        model.addAttribute("recipe", recipe);
        model.addAttribute("boards", boardRepository.findAll());
        return "editForm2";
    }

    @PostMapping("/edit/{id}")
    public String updateLink(
            @PathVariable("id") Long id,
            @RequestParam("title") String name,
            @RequestParam("image") String imageUrl,
            @RequestParam("sourceUrl") String urlToRecipy,
            @RequestParam("calories") String calories,
            @RequestParam("carbs") String carbs,
            @RequestParam("protein") String protein,
            @RequestParam("fat") String fat,
            @RequestParam("boardId") Long boardId) {

        Board board = boardRepository.findById(boardId).orElse(null);
        if (board == null) {
            return "redirect:/user/edit/" + id + "?error=boardNotFound";
        }

        RecipeEntity recipe = recipyDao.findById(id);
        recipe.setName(name);
        recipe.setImageUrl(imageUrl);
        recipe.setUrlToRecipy(urlToRecipy);
        recipe.setCalories(Integer.parseInt(calories));
        recipe.setCarbs(Integer.parseInt(carbs));
        recipe.setProtein(Integer.parseInt(protein));
        recipe.setFat(Integer.parseInt(fat));
        recipe.setBoard(board);

        recipyDao.update(recipe);

        return "redirect:/boards/" + boardId + "/links";
    }
}

