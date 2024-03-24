package iti.jets.persistence.repositories;

import iti.jets.business.entities.Cart;
import iti.jets.business.entities.Category;
import iti.jets.business.entities.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ProductRepo extends CrudRepo<Product,Integer>{

    public ProductRepo(EntityManager entityManager) {
        super(entityManager);
    }

    // findAll is done
    //add product to DB is done (save function)
    //find product by id is done

    public List<Product> findByCategoryID(int  categoryId){

        String jpql = "SELECT p FROM Product p WHERE p.category.id ="+categoryId;
        TypedQuery<Product> query = entityManager.createQuery(jpql,Product.class);
        return query.getResultList();
    }
    public long getPagesCount(){

        String jpql = "SELECT count(p.id) FROM Product p";
        Query query = entityManager.createQuery(jpql);
        long countResult = (long)query.getSingleResult();
        long finalPage = countResult % 6 >0 ? 1 : 0;
        return (countResult/6 + finalPage);
    }

    public List<Product> getProductsPerPage(int page){

        String jpql = "SELECT p FROM Product p";
        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
        query.setFirstResult((page-1)*6);
        query.setMaxResults(6);
        return query.getResultList();
    }

    public List<Product> retrieveThreeRelatedProducts(int excludedProductId,int categoryId){
        String jpql = "SELECT p FROM Product p " +
                "WHERE p.category.id = :categoryId " +  // Replace "categoryId" with the specific category ID
                "AND p.id <> :productId";             // Replace "productId" with the specific product ID to exclude

        List<Product> products = entityManager.createQuery(jpql, Product.class)
                .setParameter("categoryId", categoryId)
                .setParameter("productId", excludedProductId)
                .setMaxResults(3) // Limit the result to 3 products
                .getResultList();
        return products;
    }



}
