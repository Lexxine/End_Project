package pl.coderslab.edamam;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
@Setter
public class RecipeData {
    private String label;
    private String image;
    private String source;
    private Double yield;
    private Double calories;
    private TotalNutrients totalNutrients;

}
