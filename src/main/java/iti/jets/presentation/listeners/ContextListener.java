package iti.jets.presentation.listeners;

import iti.jets.persistence.connection.JPAManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener

public class ContextListener implements ServletContextListener  {
    private  EntityManagerFactory entityManagerFactory;
    private boolean contextInitialized;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("ContextListener.contextInitialized..........Model is ready.");
         entityManagerFactory= JPAManager.INSTANCE.getEntityManagerFactory();
        contextInitialized = true;


    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        entityManagerFactory.close();
    }

    public boolean isContextInitialized() {
        return contextInitialized;
    }
}
