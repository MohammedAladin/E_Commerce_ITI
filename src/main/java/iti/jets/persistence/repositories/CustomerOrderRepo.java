package iti.jets.persistence.repositories;

import iti.jets.business.entities.CustomerOrder;
import jakarta.persistence.EntityManager;

public class CustomerOrderRepo extends CrudRepo<CustomerOrder, Integer>{

    public CustomerOrderRepo(EntityManager entityManager) {
        super(entityManager);
    }
}
