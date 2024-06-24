package pl.coderslab.edamam;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.board.Board;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RecipeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String imageUrl;
    private String urlToRecipy;
    private int calories;
    private int carbs;
    private int protein;
    private int fat;

    @ManyToOne
    @JoinColumn(name = "board_id")
    private Board board;

}
