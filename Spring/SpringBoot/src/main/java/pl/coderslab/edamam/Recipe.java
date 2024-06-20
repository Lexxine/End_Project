package pl.coderslab.edamam;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Recipe {
    private String name;
    private String imageUrl;
    private String source;
    private int calories;
    private int carbs;
    private int protein;
    private int fat;

}
