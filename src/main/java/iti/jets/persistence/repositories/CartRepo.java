package iti.jets.persistence.repositories;

import iti.jets.business.entities.Cart;
import iti.jets.business.entities.CartItem;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class CartRepo extends CrudRepo<Cart, Integer>{
    public CartRepo(EntityManager entityManager) {
        super(entityManager);
    }

    public Cart getCartByCustomerId(int customerId){
        String jpql = "SELECT c FROM Cart c WHERE c.customer.id="+ customerId;
        TypedQuery<Cart> findQuery = entityManager.createQuery(jpql, Cart.class);
        return findQuery.getSingleResult();
    }

    public List<CartItem> getCartItemsByCartId(int cartId){
        String jpql = "SELECT i FROM CartItem i WHERE i.cart.id="+ cartId;
        TypedQuery<CartItem> findQuery = entityManager.createQuery(jpql, CartItem.class);

        return findQuery.getResultList();
    }

    public List<CartItem> getCartItemsByCustomerId(int userId){
        String jpql = "SELECT i FROM CartItem i WHERE i.cart.customer.id="+ userId;
        TypedQuery<CartItem> findQuery = entityManager.createQuery(jpql, CartItem.class);

        return findQuery.getResultList();
    }

    public void addItemToCart(CartItem cartItem, int cartId){
        Cart cart = findById(Cart.class, cartId);

        if (cart == null)
            return;

        cart.addCartItem(cartItem);

        cartItem.setCart(cart);

        entityManager.getTransaction().begin();

        entityManager.persist(cartItem);
        entityManager.merge(cart);

        entityManager.getTransaction().commit();
    }

    public CartItem updateCartItem(CartItem cartItem){
        entityManager.getTransaction().begin();
        CartItem updatedEntity = entityManager.merge(cartItem);
        entityManager.getTransaction().commit();
        return updatedEntity;
    }
    public void clearCart(Cart cart){
        String jpql = "DELETE FROM CartItem i WHERE i.cart.id = :cartId";
        Query query = entityManager.createQuery(jpql);
        query.setParameter("cartId", cart.getId());

        cart.clearCart();
        entityManager.getTransaction().begin();
        entityManager.merge(cart);
        int deletedCount = query.executeUpdate();
        System.out.println("deleted count "+ deletedCount);
        entityManager.getTransaction().commit();
    }

    public void deleteCartItem(int itemId){
        CartItem cartItem = entityManager.find(CartItem.class,itemId);
        if (cartItem!= null){
            entityManager.getTransaction().begin();
            entityManager.remove(cartItem);
            entityManager.getTransaction().commit();
        }
    }

    public CartItem findCartItemById(int cartItemId){
        return entityManager.find(CartItem.class, cartItemId);
    }


//    public void incrementCartItem(CartItem cartItem, int quantity){
//        CartItem cartItem1 = entityManager.find(CartItem.class,cartItem.getId());
//        cartItem1.incrementCartItem(quantity);
//        entityManager.getTransaction().begin();
//        entityManager.merge(cartItem1);
//        entityManager.getTransaction().commit();
//    }
//
//    public void decrementCartItem(CartItem cartItem, int quantity){
//        CartItem cartItem1 = entityManager.find(CartItem.class,cartItem.getId());
//        cartItem1.decrementCartItem(quantity);
//        entityManager.getTransaction().begin();
//        entityManager.merge(cartItem1);
//        entityManager.getTransaction().commit();
//    }

}
