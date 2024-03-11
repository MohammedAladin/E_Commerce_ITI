package iti.jets;

import iti.jets.persistence.connection.JPAManager;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public class App {
    public static void main(String[] args) {
        EntityManagerFactory emf = JPAManager.INSTANCE.getEntityManagerFactory();
        EntityManager em = emf.createEntityManager();


    }
}
