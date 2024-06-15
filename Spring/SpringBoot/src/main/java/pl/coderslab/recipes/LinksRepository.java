package pl.coderslab.recipes;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.recipes.Links;

import java.util.List;

public interface LinksRepository extends JpaRepository<Links, Long> {
    List<Links> findAllByBoardId(Long boardId);
}
