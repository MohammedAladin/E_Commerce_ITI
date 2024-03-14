package iti.jets.persistence.repositories;

import iti.jets.business.entities.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

public class CustomerRepo extends CrudRepo<Customer, Integer>{
    public CustomerRepo(EntityManager entityManager) {
        super(entityManager);
    }

    public Customer findByUsername(String username){
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
        Root<Customer> customer = cq.from(Customer.class);
        Predicate predicate = cb.equal(customer.get("customerName"), username);
           cq.where(predicate);
        try {
            return entityManager.createQuery(cq).getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    public Customer findByEmail(String email){
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
        Root<Customer> customer = cq.from(Customer.class);
        Predicate predicate = cb.equal(customer.get("email"), email);
        cq.where(predicate);
        try {
            return entityManager.createQuery(cq).getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
