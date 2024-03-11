package iti.jets.persistence.repositories;

import iti.jets.business.entities.Customer;
import jakarta.persistence.EntityManager;

public class CustomerRepo extends CrudRepo<Customer, Integer>{
    public CustomerRepo(EntityManager entityManager) {
        super(entityManager);
    }

    //here you have an object from entity manager and you can deal with database
}
