package com.cafe.util;

import javax.persistence.*;

public class JPAUtil {

    private static EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("berryPU");

    public static EntityManager getEntityManager() {

        return emf.createEntityManager();

    }

}