package pl.coderslab.edamam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Nutrient {
    private String label;
    private double quantity;
    private String unit;
}
