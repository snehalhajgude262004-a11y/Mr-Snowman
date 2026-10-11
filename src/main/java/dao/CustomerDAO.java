package dao;

import com.cafe.util.JPAUtil;
import entity.Customer;

public class CustomerDAO {

    public boolean registerCustomer(Customer c) {
        var em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(c);
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

    public boolean validateCustomer(String email, String password) {
        return findByEmailAndPassword(email, password) != null;
    }

    public Customer findByEmail(String email) {
        var em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT c FROM Customer c WHERE c.email = :email", Customer.class)
                    .setParameter("email", email)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } finally {
            em.close();
        }
    }

    public Customer findByEmailAndPassword(String email, String password) {
        var em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT c FROM Customer c WHERE c.email = :email AND c.password = :password",
                    Customer.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
    }

    public java.util.List<Customer> getAllCustomers() {
        var em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Customer c", Customer.class).getResultList();
        } finally {
            em.close();
        }
    }

    public long count() {
        var em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT COUNT(c) FROM Customer c", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public boolean deleteCustomer(int id) {
        var em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Customer c = em.find(Customer.class, id);
            if (c != null) {
                em.remove(c);
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
}
