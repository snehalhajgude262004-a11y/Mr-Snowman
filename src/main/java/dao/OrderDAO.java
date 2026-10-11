package dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.cafe.util.JPAUtil;

import entity.CustomerOrder;

public class OrderDAO {

public boolean save(
        CustomerOrder order
){

    EntityManager em =
            JPAUtil.getEntityManager();

    try{

        em.getTransaction().begin();

        em.persist(order);

        em.getTransaction().commit();

        return true;

    }

    catch(Exception e){

        if(
                em.getTransaction()
                        .isActive()
        ){

            em.getTransaction()
                    .rollback();

        }

        e.printStackTrace();

        return false;

    }

    finally{

        em.close();

    }

}





public List<CustomerOrder> findByCustomerEmail(
        String email
){

    EntityManager em =
            JPAUtil.getEntityManager();

    try{

        return em.createQuery(

                "SELECT DISTINCT o " +

                "FROM CustomerOrder o " +

                "LEFT JOIN FETCH o.items " +

                "WHERE o.customerEmail=:email " +

                "ORDER BY o.createdAt DESC",

                CustomerOrder.class

        )

                .setParameter(
                        "email",
                        email
                )

                .getResultList();

    }

    finally{

        em.close();

    }

}





public List<CustomerOrder> getAllOrders(){

    EntityManager em =
            JPAUtil.getEntityManager();

    try{

        return em.createQuery(

                "SELECT DISTINCT o " +

                "FROM CustomerOrder o " +

                "LEFT JOIN FETCH o.items " +

                "ORDER BY o.createdAt DESC",

                CustomerOrder.class

        )

                .getResultList();

    }

    finally{

        em.close();

    }

}





public CustomerOrder findById(
        int id
){

    EntityManager em =
            JPAUtil.getEntityManager();

    try{

        return em.find(
                CustomerOrder.class,
                id
        );

    }

    finally{

        em.close();

    }

}





public boolean updateStatus(

        int id,

        String status

){

    EntityManager em =
            JPAUtil.getEntityManager();

    try{

        em.getTransaction()
                .begin();

        CustomerOrder order =
                em.find(
                        CustomerOrder.class,
                        id
                );

        if(order==null){

            return false;

        }

        order.setStatus(
                status
        );

        em.getTransaction()
                .commit();

        return true;

    }

    catch(Exception e){

        if(
                em.getTransaction()
                        .isActive()
        ){

            em.getTransaction()
                    .rollback();

        }

        e.printStackTrace();

        return false;

    }

    finally{

        em.close();

    }

}

public long count() {
    EntityManager em = JPAUtil.getEntityManager();
    try {
        return em.createQuery("SELECT COUNT(o) FROM CustomerOrder o", Long.class).getSingleResult();
    } finally {
        em.close();
    }
}

public java.math.BigDecimal getTotalRevenue() {
    EntityManager em = JPAUtil.getEntityManager();
    try {
        java.math.BigDecimal rev = em.createQuery("SELECT SUM(o.totalAmount) FROM CustomerOrder o", java.math.BigDecimal.class).getSingleResult();
        return rev != null ? rev : java.math.BigDecimal.ZERO;
    } finally {
        em.close();
    }
}

public boolean deleteOrder(int id) {
    EntityManager em = JPAUtil.getEntityManager();
    try {
        em.getTransaction().begin();
        CustomerOrder order = em.find(CustomerOrder.class, id);
        if (order != null) {
            em.remove(order);
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
