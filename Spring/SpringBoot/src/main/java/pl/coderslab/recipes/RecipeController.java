package pl.coderslab.recipes;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.spoonacular.Recipe;
import pl.coderslab.spoonacular.SpoonacularService;

import java.util.List;

@Controller
public class RecipeController {

    private final SpoonacularService spoonacularService;

    public RecipeController(SpoonacularService spoonacularService) {
        this.spoonacularService = spoonacularService;
    }

    @GetMapping("/recipes")
    public String showRecipes(Model model) {
        List<Recipe> recipes = spoonacularService.getRecipes();
        model.addAttribute("recipes", recipes);
        return "recipes";
    }
}
