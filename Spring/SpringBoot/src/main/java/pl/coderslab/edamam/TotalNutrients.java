package pl.coderslab.edamam;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TotalNutrients {
        @JsonProperty("CHOCDF")
        private Nutrient carbs;
        @JsonProperty("PROCNT")
        private Nutrient protein;
        @JsonProperty("FAT")
        private Nutrient fat;
}
