package pl.coderslab.edamam;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Hit {
    private RecipeData recipe;

    public RecipeData getRecipe() {
        return recipe;
    }

    public void setRecipe(RecipeData recipe) {
        this.recipe = recipe;
    }
}
