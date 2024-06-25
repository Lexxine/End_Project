package pl.coderslab.edamam;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
@Setter
@NoArgsConstructor
public class RecipeData {

    private String label;
    private String image;
    private String source;
    private String yield;
    private String calories;
    private TotalNutrients totalNutrients;
    private List<String> ingredientLines;
    private String instructions;
    private String url;
    private Double glycemicIndex;
    private List<String> mealType;

}
