package pl.coderslab.edamam;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.edamam.Recipe;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PaginatedRecipes {
    private List<Recipe> recipes;
    private String nextPageUrl;
    private String PrevPageUrl;

}
