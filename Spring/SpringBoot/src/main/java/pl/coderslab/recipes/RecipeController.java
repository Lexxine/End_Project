package pl.coderslab.recipes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.edamam.EdamamService;
import pl.coderslab.edamam.Recipe;

import java.io.IOException;
import java.util.List;

@Controller
public class RecipeController {

    private final EdamamService edamamService;

    @Autowired
    public RecipeController(EdamamService edamamService) {
        this.edamamService = edamamService;
    }

    @GetMapping("/recipes")
    public String showRecipes(@RequestParam(required = false, defaultValue = "salad") String query,
                              Model model) throws IOException {
//        List<Recipe> recipes = edamamService.getRecipes(query);
//        model.addAttribute("recipes", recipes);
        return "recipes2";
    }
}
