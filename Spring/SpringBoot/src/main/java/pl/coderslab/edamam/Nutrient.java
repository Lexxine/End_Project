package pl.coderslab.edamam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Nutrient {
    private String label;
    private int quantity;
    private String unit;
}
