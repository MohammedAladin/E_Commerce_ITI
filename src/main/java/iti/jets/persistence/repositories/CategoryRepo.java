package iti.jets.persistence.repositories;

import iti.jets.business.entities.CartItem;
import iti.jets.business.entities.Category;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaDelete;
import jakarta.persistence.criteria.Root;

public class CategoryRepo extends CrudRepo<Category, Integer>{

    public CategoryRepo(EntityManager entityManager) {
        super(entityManager);
    }


}
