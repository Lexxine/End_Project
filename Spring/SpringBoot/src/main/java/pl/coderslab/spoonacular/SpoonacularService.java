package pl.coderslab.spoonacular;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import pl.coderslab.recipes.RecipesResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SpoonacularService {

    private final RestTemplate restTemplate;
    private String spoonacularApiKey = "887ee384d47a43a895b78519ddc39043";
    private final String spoonacularBaseUrl = "https://api.spoonacular.com";
    private final int DEFAULT_NUMBER = 32;

    public SpoonacularService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;

    }

    public List<Recipe> getRecipes(int page) {
        int offset = page * DEFAULT_NUMBER;

        String url = UriComponentsBuilder.fromHttpUrl(spoonacularBaseUrl)
                .path("/recipes/random")
                .queryParam("apiKey", spoonacularApiKey)
                .queryParam("number", DEFAULT_NUMBER)
                .queryParam("offset", offset)
                .queryParam("includeNutrition", true)
                .toUriString();

        ResponseEntity<RecipesResponse> response = restTemplate.getForEntity(url, RecipesResponse.class);

        if (response.getBody() != null && response.getBody().getRecipes() != null) {
            return response.getBody().getRecipes();
        } else {
            return Collections.emptyList();
        }
    }
    public List<Recipe> getRecipesByCategory(int page, String category) throws IOException {
        int offset = page * DEFAULT_NUMBER;
        String apiUrl = UriComponentsBuilder.fromHttpUrl(spoonacularBaseUrl)
                .path("/recipes/random")
                .queryParam("apiKey", spoonacularApiKey)
                .queryParam("number", DEFAULT_NUMBER)
                .queryParam("offset", offset)
                .queryParam("include-tags", category)
                .queryParam("includeNutrition", true)  // Ensure nutrition data is included
                .toUriString();
        ResponseEntity<RecipesResponse> response = restTemplate.getForEntity(apiUrl, RecipesResponse.class);

        if (response.getBody() != null && response.getBody().getRecipes() != null) {
            return response.getBody().getRecipes();
        } else {
            return Collections.emptyList();
        }
    }

//    public List<Recipe> getRecipesByCategory(int page, String category) throws IOException {
//        int offset = page * 10;
//        String apiUrl = UriComponentsBuilder.fromHttpUrl(spoonacularBaseUrl)
//                .path("/recipes/complexSearch")
//                .queryParam("apiKey", spoonacularApiKey)
//                .queryParam("query", category)
//                .queryParam("number", 10)
//                .queryParam("offset", offset)
//                .queryParam("includeNutrition", true)  // Ensure nutrition data is included
//                .toUriString();
//
//        Map<String, Object> response = restTemplate.getForObject(apiUrl, Map.class);
//        if (response != null) {
//            List<Map<String, Object>> results = (List<Map<String, Object>>) response.get("results");
//
//            // Map results to Recipe objects
//            List<Recipe> recipes = results.stream().map(result -> {
//                Recipe recipe = new Recipe();
//                recipe.setId(String.valueOf(result.get("id")));
//                recipe.setTitle((String) result.get("title"));
//                recipe.setImage((String) result.get("image"));
//                recipe.setSourceUrl((String) result.get("sourceUrl"));
//
//
//                // Map nutrition information
//                Map<String, Object> nutrition = (Map<String, Object>) result.get("nutrition");
//                if (nutrition != null) {
//                    List<Map<String, Object>> nutrients = (List<Map<String, Object>>) nutrition.get("nutrients");
//                    Nutrition nutritionObj = new Nutrition();
//                    List<Nutrients> nutrientList = nutrients.stream().map(nutrient -> {
//                        Nutrients n = new Nutrients();
//                        n.setName((String) nutrient.get("name"));
//                        n.setAmount((int) ((Number) nutrient.get("amount")).doubleValue());
//                        return n;
//                    }).collect(Collectors.toList());
//                    nutritionObj.setNutrients(nutrientList);
//                    recipe.setNutrition(nutritionObj);
//                }
//
//                return recipe;
//            }).collect(Collectors.toList());
//
//            return recipes;
//        } else {
//            return Collections.emptyList();
//        }
//    }

}
