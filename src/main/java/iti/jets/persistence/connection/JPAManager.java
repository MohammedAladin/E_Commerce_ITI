package iti.jets.persistence.connection;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public enum JPAManager {
    INSTANCE;

    private final EntityManagerFactory entityManagerFactory;

    JPAManager(){
        entityManagerFactory = Persistence.createEntityManagerFactory("fruit");
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }
}
