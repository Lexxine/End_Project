package pl.coderslab.edamam;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EdamamService {

//    @Value("${edamam.api.url}")
//    private String apiUrl;
//
//    @Value("${edamam.app_id}")
//    private String appId;
//
//    @Value("${edamam.app_key}")
//    private String appKey;

//    @Autowired
//    private RestTemplate restTemplate;
//    @Autowired
//    private ObjectMapper objectMapper;

//    public String buildUrl(String query, int from, int to) {
//        return String.format("%s?q=%s&app_id=%s&app_key=%s&type=public&from=%d&to=%d", apiUrl, query, appId, appKey, from, to);
//    }
//    public RecipesResponse convertJsonToRecipesResponse(String json) {
//        ObjectMapper mapper = new ObjectMapper();
//        try {
//            return mapper.readValue(json, RecipesResponse.class);
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Handle exception as per your application's requirement
//            return null;
//        }
//    }
//    public RecipesResponse getRecipes(String query, int from, int to) {
//        String url = buildUrl(query, from, to);
//        ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);
//        String jsonResponse = responseEntity.getBody();
//        logger.info("Response: " + restTemplate.getForObject(url, String.class));logger.info("Response: " + restTemplate.getForObject(url, String.class));
//        return convertJsonToRecipesResponse(jsonResponse);
//    }
//    public RecipesResponse getNextPageJson(String nextUrl) {
//        ResponseEntity<String> responseEntity = restTemplate.getForEntity(nextUrl, String.class);
//        return convertJsonToRecipesResponse(responseEntity.getBody());
//    }
//    public RecipesResponse getNextPage(String nextUrl) {
//        ResponseEntity<String> responseEntity = restTemplate.getForEntity(nextUrl, String.class);
//        String jsonResponse = responseEntity.getBody();
//        return convertJsonToRecipesResponse(jsonResponse);
//    }

/*
    private final String edamamBaseUrl;
    private final String appId;
    private final String appKey;
    private final RestTemplate restTemplate;
    private String nextLink;

    private static final Logger logger = LoggerFactory.getLogger(EdamamService.class);


   public EdamamService(
            @Value("${edamam.base_url}") String edamamBaseUrl,
            @Value("${edamam.app_id}") String appId,
            @Value("${edamam.app_key}") String appKey,
            RestTemplate restTemplate) {
        this.edamamBaseUrl = edamamBaseUrl;
        this.appId = appId;
        this.appKey = appKey;
        this.restTemplate = restTemplate;

    }

    public List<Recipe> getRecipesWithPagination(String query) {
        String url;
        if (nextLink != null) {
            url = nextLink;
        } else {
            url = UriComponentsBuilder.fromHttpUrl(edamamBaseUrl)
                    .path("/api/recipes/v2")
                    .queryParam("type", "public")
                    .queryParam("q",query)
                    .queryParam("app_id", appId)
                    .queryParam("app_key", appKey)
                    .toUriString();
        }
        try {
            ResponseEntity<RecipesResponse> response = restTemplate.getForEntity(url, RecipesResponse.class);
            logger.info("Response: " + restTemplate.getForObject(url, String.class));
            if (response.getBody() != null && response.getBody().getHits() != null) {
                if (response.getBody().get_links() != null && response.getBody().get_links().getNext() != null) {
                    nextLink = response.getBody().get_links().getNext().getHref();
                } else {
                    nextLink = null;
                }
                return response.getBody().getHits().stream()
                        .map(hit -> mapToRecipe(hit.getRecipe()))
                        .collect(Collectors.toList());
            } else {
                return Collections.emptyList();
            }
        } catch (HttpClientErrorException e) {
            logger.error("Error during API call: " + e.getResponseBodyAsString());
            throw e;
        }
    }

        public String getNextLink() {
        return nextLink;
    }
    public Recipe getRecipeById(String recipeId) {
        String url = UriComponentsBuilder.fromHttpUrl(edamamBaseUrl)
                .path("/api/recipes/v2/{id}")
                .queryParam("type", "public")
                .queryParam("app_id", appId)
                .queryParam("app_key", appKey)
                .buildAndExpand(recipeId)
                .toUriString();

        ResponseEntity<RecipeData> response = restTemplate.getForEntity(url, RecipeData.class);

        if (response.getBody() != null) {
            return mapToRecipe(response.getBody());
        } else {
            return null;
        }
    }

    private Recipe mapToRecipe(RecipeData recipeData) {
        Recipe recipe = new Recipe();
        recipe.setName(recipeData.getLabel());
        recipe.setImageUrl(recipeData.getImage());
        recipe.setSource(recipeData.getSource());
        double servings = (recipeData.getYield()) != null ? Double.parseDouble(recipeData.getYield()) : 3.0;
        if (recipeData.getCalories() != null) {
            double calories = Double.parseDouble(recipeData.getCalories());
            int caloriesPerServing = (int) Math.round(calories / servings);
            recipe.setCalories(caloriesPerServing);
        }

        recipe.setCarbs((int) Math.round(recipeData.getTotalNutrients().getCarbs().getQuantity() / servings));
        recipe.setProtein((int) Math.round(recipeData.getTotalNutrients().getProtein().getQuantity() / servings));
        recipe.setFat((int) Math.round(recipeData.getTotalNutrients().getFat().getQuantity() / servings));
        recipe.setIngredients(recipeData.getIngredientLines());
        recipe.setRecipyInstructions(recipeData.getInstructions());

        recipe.setUrlToRecipy(recipeData.getUrl());

        recipe.setGlycemicInd((recipeData.getGlycemicIndex()));
        recipe.setMeal(recipeData.getMealType());

        return recipe;
    }

*/
}