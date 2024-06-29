package pl.coderslab.spoonacular;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Recipe {
    private String id;
    private String title;
    private String image;
    private String summary;
    private String sourceUrl;
    private Nutrition nutrition;
    private int servings;
    int amount;
}
