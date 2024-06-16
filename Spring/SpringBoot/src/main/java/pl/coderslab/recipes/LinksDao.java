package pl.coderslab.recipes;



import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class LinksDao {

    @PersistenceContext
    private EntityManager em;

    public List<Links> findAll() {
        return em.createQuery("from Links", Links.class).getResultList();
    }

    public void save(Links links) {
        em.persist(links);
    }

    public Links findById(Long id){
        return em.find(Links.class,id);
    }

    public void update(Links links){
        em.merge(links);
    }

    public void delete(Links links){
        em.remove(em.contains(links) ? links : em.merge(links));
    }
    public List<Links> findAllByBoardId(Long boardId) {
        // Implementacja pobierania linków według ID tablicy
        return em.createQuery("SELECT l FROM Links l WHERE l.board.id = :boardId", Links.class)
                .setParameter("boardId", boardId)
                .getResultList();
    }

}
