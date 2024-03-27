package iti.jets.persistence.repositories;

import iti.jets.business.entities.Cart;
import iti.jets.business.entities.Category;
import iti.jets.business.entities.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.math.BigDecimal;
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

    public List<Product> filterProducts(String categories, BigDecimal minPrice, BigDecimal maxPrice, int pageNumber, int pageSize) {
        StringBuilder jpqlBuilder = new StringBuilder("SELECT p FROM Product p WHERE 1 = 1");

        // Add filters based on provided criteria
        if (categories != null && !categories.isEmpty()) {
            String[] categoryArray = categories.split(",");
            jpqlBuilder.append(" AND p.category.categoryName IN (");
            for (int i = 0; i < categoryArray.length; i++) {
                if (i > 0) {
                    jpqlBuilder.append(",");
                }
                jpqlBuilder.append(":category").append(i);
            }
            jpqlBuilder.append(")");
        }
        if (minPrice != null) {
            jpqlBuilder.append(" AND p.price >= :minPrice");
        }
        if (maxPrice != null && maxPrice.compareTo(BigDecimal.valueOf(-1)) != 0) {
            jpqlBuilder.append(" AND p.price <= :maxPrice");
        }

        // Create query and set parameters
        Query query = entityManager.createQuery(jpqlBuilder.toString(), Product.class);
        if (categories != null && !categories.isEmpty()) {
            String[] categoryArray = categories.split(",");
            for (int i = 0; i < categoryArray.length; i++) {
                query.setParameter("category" + i, categoryArray[i]);
            }
        }
        if (minPrice != null) {
            query.setParameter("minPrice", minPrice);
        }
        if (maxPrice != null && maxPrice.compareTo(BigDecimal.valueOf(-1)) != 0) {
            query.setParameter("maxPrice", maxPrice);
        }

        // Pagination
        query.setFirstResult((pageNumber - 1) * pageSize);
        query.setMaxResults(pageSize);

        // Execute query and return results
        return query.getResultList();
    }

    public long countFilteredProducts(String categories, BigDecimal minPrice, BigDecimal maxPrice) {
        StringBuilder countJpqlBuilder = new StringBuilder("SELECT COUNT(p) FROM Product p WHERE 1 = 1");

        // Add filters based on provided criteria
        if (categories != null && !categories.isEmpty()) {
            String[] categoryArray = categories.split(",");
            countJpqlBuilder.append(" AND p.category.categoryName IN (");
            for (int i = 0; i < categoryArray.length; i++) {
                if (i > 0) {
                    countJpqlBuilder.append(",");
                }
                countJpqlBuilder.append(":category").append(i);
            }
            countJpqlBuilder.append(")");
        }
        if (minPrice != null) {
            countJpqlBuilder.append(" AND p.price >= :minPrice");
        }
        if (maxPrice != null && maxPrice.compareTo(BigDecimal.valueOf(-1)) != 0) {
            countJpqlBuilder.append(" AND p.price <= :maxPrice");
        }

        // Create query and set parameters
        Query countQuery = entityManager.createQuery(countJpqlBuilder.toString());

        if (categories != null && !categories.isEmpty()) {
            String[] categoryArray = categories.split(",");
            for (int i = 0; i < categoryArray.length; i++) {
                countQuery.setParameter("category" + i, categoryArray[i]);
            }
        }
        if (minPrice != null) {
            countQuery.setParameter("minPrice", minPrice);
        }
        if (maxPrice != null && maxPrice.compareTo(BigDecimal.valueOf(-1)) != 0) {
            countQuery.setParameter("maxPrice", maxPrice);
        }

        // Execute query and return the count
        return (long) countQuery.getSingleResult();
    }





}
