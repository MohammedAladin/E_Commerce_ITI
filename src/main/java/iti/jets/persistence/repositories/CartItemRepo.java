package iti.jets.persistence.repositories;

import iti.jets.business.entities.CartItem;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaDelete;
import jakarta.persistence.criteria.Root;

public class CartItemRepo extends CrudRepo<CartItem, Integer>{

    public CartItemRepo(EntityManager entityManager) {
        super(entityManager);
    }

    public void deleteByCartId(Integer cartId) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<CartItem> delete = cb.createCriteriaDelete(CartItem.class);
        Root<CartItem> root = delete.from(CartItem.class);

        delete.where(cb.equal(root.get("cart").get("id"), cartId));

        entityManager.createQuery(delete).executeUpdate();
    }


}
