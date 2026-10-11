package dao;

import java.util.List;
import javax.persistence.EntityManager;
import com.cafe.util.JPAUtil;
import entity.Food;

public class FoodDAO {

    public boolean save(Food food) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            if (food.getId() > 0) {
                em.merge(food);
            } else {
                em.persist(food);
            }
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    public boolean delete(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Food food = em.find(Food.class, id);
            if (food != null) {
                em.remove(food);
                em.getTransaction().commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    public Food findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Food.class, id);
        } finally {
            em.close();
        }
    }

    public List<Food> getAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT f FROM Food f", Food.class).getResultList();
        } finally {
            em.close();
        }
    }

    public long count() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT COUNT(f) FROM Food f", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }
}
