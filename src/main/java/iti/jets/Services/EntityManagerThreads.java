package iti.jets.Services;

import iti.jets.persistence.connection.JPAManager;
import jakarta.persistence.EntityManager;

public class EntityManagerThreads {

    static ThreadLocal<EntityManager> threadLocal = new ThreadLocal<>();

    public static EntityManager getEntityManager(){
        EntityManager entityManager = threadLocal.get();
        if(entityManager == null){
            entityManager = JPAManager.INSTANCE.getEntityManagerFactory().createEntityManager();
            threadLocal.set(entityManager);
        }
        return entityManager;
    }

    public static void closeEntityManager(){
        EntityManager entityManager = threadLocal.get();
        if(entityManager != null){
            entityManager.close();
            threadLocal.remove();
        }
    }
    
}
