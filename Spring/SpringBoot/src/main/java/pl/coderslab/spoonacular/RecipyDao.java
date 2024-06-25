package pl.coderslab.spoonacular;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class RecipyDao {

    @PersistenceContext
    private EntityManager em;

    public void save(RecipeEntity recipe) {
        em.persist(recipe);
    }
    public RecipeEntity findById(Long id) {
        return em.find(RecipeEntity.class, id);
    }
    public void update(RecipeEntity recipe) {
        em.merge(recipe);
    }

    public void delete(RecipeEntity recipe) {
        em.remove(em.contains(recipe) ? recipe : em.merge(recipe));
    }
    public List<RecipeEntity> findAllByBoardId(Long boardId) {
        return em.createQuery("SELECT l FROM RecipeEntity l WHERE l.board.id = :boardId", RecipeEntity.class)
                .setParameter("boardId", boardId)
                .getResultList();
    }


}
