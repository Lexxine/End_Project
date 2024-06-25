package pl.coderslab.spoonacular;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import pl.coderslab.recipes.RecipesResponse;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

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

}
