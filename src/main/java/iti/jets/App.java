package iti.jets;

import iti.jets.business.entities.Customer;
import iti.jets.persistence.connection.JPAManager;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public class App {
    public static void main(String[] args) {

        EntityManagerFactory emf = JPAManager.INSTANCE.getEntityManagerFactory();
        EntityManager em = emf.createEntityManager();

        Customer customer = new Customer();
        customer.setCustomerName("Ahmed");
        customer.setEmail("mohammed@gmail.com");
        customer.setPhoneNumber("01000000000");
        customer.setDob(java.time.LocalDate.now());
        customer.setCreditLimit(1500.0);
        customer.setPassword("123456789");

        em.getTransaction().begin();

        em.persist(customer);

        em.getTransaction().commit();


        

    }
}
