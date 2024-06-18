package pl.coderslab.recipes;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.spoonacular.Recipe;

import java.util.List;

@Getter
@Setter
public class RecipesResponse {
    private List<Recipe> recipes;
}
