package pl.coderslab.edamam;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.board.Board;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.List;


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
    private List<String> ingredients;
    private String recipyInstructions;
    private String urlToRecipy;
    private Double glycemicInd;
    private List<String> meal;

    @ManyToOne
    @JoinColumn(name = "board_id")
    private Board board;
}
