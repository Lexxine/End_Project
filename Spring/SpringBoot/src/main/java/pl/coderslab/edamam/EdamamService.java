package pl.coderslab.edamam;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import pl.coderslab.spoonacular.SpoonacularService;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EdamamService {

    private final String edamamBaseUrl;
    private final String appId;
    private final String appKey;
    private final RestTemplate restTemplate;
    private final int DEFAULT_NUMBER = 35;
    private final SpoonacularService spoonacularService;

    public EdamamService(
            @Value("${edamam.base_url}") String edamamBaseUrl,
            @Value("${edamam.app_id}") String appId,
            @Value("${edamam.app_key}") String appKey,
            RestTemplate restTemplate, SpoonacularService spoonacularService) {
        this.edamamBaseUrl = edamamBaseUrl;
        this.appId = appId;
        this.appKey = appKey;
        this.restTemplate = restTemplate;
        this.spoonacularService = spoonacularService;
    }

    public List<Recipe> getRecipes(String query) {
        String url = UriComponentsBuilder.fromHttpUrl(edamamBaseUrl)
                .path("/api/recipes/v2")
                .queryParam("type", "public")
                .queryParam("q", query)
                .queryParam("app_id", appId)
                .queryParam("app_key", appKey)
                .queryParam("number", DEFAULT_NUMBER)
                .toUriString();

        ResponseEntity<RecipesResponse> response = restTemplate.getForEntity(url, RecipesResponse.class);

        if (response.getBody() != null && response.getBody().getHits() != null) {
            return response.getBody().getHits().stream()
                    .map(hit -> mapToRecipe(hit.getRecipe()))
                    .collect(Collectors.toList());
        } else {
            return Collections.emptyList();
        }
    }

    private Recipe mapToRecipe(RecipeData recipeData) {
        Recipe recipe = new Recipe();
        recipe.setName(recipeData.getLabel());
        recipe.setImageUrl(recipeData.getImage());
        recipe.setSource(recipeData.getSource());
        double servings = recipeData.getYield() != null ? recipeData.getYield() : 3.0;
        if (recipeData.getCalories() != null) {
            recipe.setCalories((int) Math.round(recipeData.getCalories() / servings));
        }
        recipe.setCarbs((int) Math.round(recipeData.getTotalNutrients().getCarbs().getQuantity() / servings));
        recipe.setProtein((int) Math.round(recipeData.getTotalNutrients().getProtein().getQuantity() / servings));
        recipe.setFat((int) Math.round(recipeData.getTotalNutrients().getFat().getQuantity() / servings));
        return recipe;
    }
}
