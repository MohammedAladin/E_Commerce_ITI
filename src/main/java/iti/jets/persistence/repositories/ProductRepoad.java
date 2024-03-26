package iti.jets.persistence.repositories;

import iti.jets.business.entities.Category;
import iti.jets.business.entities.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ProductRepoad extends CrudRepo<Product, Integer> {
    public ProductRepoad(EntityManager entityManager) {
        super(entityManager);
    }

    public Category getCategoryByName(String categoryName) {
        String jpql = "SELECT c FROM Category c WHERE c.categoryName = :categoryName";

        TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);

        query.setParameter("categoryName", categoryName);

        List<Category> result = query.getResultList();

        if (!result.isEmpty()) {
            return result.get(0);
        } else {
            return null;
        }
    }
}
