package iti.jets.business;

import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.Mappings.ProductMapping;
import iti.jets.business.entities.Product;
import iti.jets.persistence.connection.JPAManager;
import iti.jets.persistence.repositories.ProductRepo;
import iti.jets.presentation.PagesCommands.SinglePageCommand;
import jakarta.persistence.EntityManager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private final ProductRepo productRepo ;

    public ProductService() {
        //productRepo = new ProductRepo(EntityManagerThreads.getEntityManager());
        EntityManager em = JPAManager.INSTANCE.getEntityManagerFactory().createEntityManager();
        productRepo = new ProductRepo(em);
    }

    public List<ProductDtoYousif> retrieveProducts(){
        System.out.println("inside product service");
        List<Product> products = productRepo.findAll(Product.class);
        ProductMapping productMapping = new ProductMapping();
        List<ProductDtoYousif> productDtoYousifs = new ArrayList<>();
        for(Product product:products){
            ProductDtoYousif productDtoYousif = productMapping.mapEntityToDto(product, ProductDtoYousif.class);
            productDtoYousifs.add(productDtoYousif);
        }
        System.out.println(productDtoYousifs.size());
        return productDtoYousifs;
    }

    public long getPagesCount(){
        return productRepo.getPagesCount();
    }
    public List<ProductDtoYousif>retrieveProductsPerPage(int pageNumber){
        System.out.println("inside product service");
        List<Product> products = productRepo.getProductsPerPage(pageNumber);
        System.out.println("products size = "+products.size());
        ProductMapping productMapping = new ProductMapping();
        List<ProductDtoYousif> productDtoYousifs = new ArrayList<>();
        for(Product product:products){
            ProductDtoYousif productDtoYousif = productMapping.mapEntityToDto(product, ProductDtoYousif.class);
            productDtoYousifs.add(productDtoYousif);
        }
        System.out.println(productDtoYousifs.size());
        return productDtoYousifs;
    }

    public List<ProductDtoYousif> retrieveProductsForSingleProductsPage(){

        System.out.println("inside product service");
        List<Product> products = productRepo.retrieveThreeRelatedProducts(SinglePageCommand.excludedProductId,SinglePageCommand.theCategoryId);
        ProductMapping productMapping = new ProductMapping();
        List<ProductDtoYousif> productDtoYousifs = new ArrayList<>();
        for(Product product:products){
            ProductDtoYousif productDtoYousif = productMapping.mapEntityToDto(product, ProductDtoYousif.class);
            productDtoYousifs.add(productDtoYousif);
        }
        System.out.println(productDtoYousifs.size());
        return productDtoYousifs;
    }

    public ProductDtoYousif retrieveProductById(int id){
        Product product = productRepo.findById(Product.class, id);
        ProductMapping productMapping = new ProductMapping();
        ProductDtoYousif productDtoYousif = productMapping.mapEntityToDto(product, ProductDtoYousif.class);
        return productDtoYousif;
    }

    public List<ProductDtoYousif> retrieveFilteredProducts(String categories, BigDecimal minPrice, BigDecimal maxPrice, int pageNumber, int pageSize){

        List<Product>filteredProducts=productRepo.filterProducts(categories, minPrice, maxPrice, pageNumber, pageSize);
        ProductMapping productMapping = new ProductMapping();
        List<ProductDtoYousif> productDtoYousifs = new ArrayList<>();
        for(Product filteredProduct:filteredProducts){
            ProductDtoYousif productDtoYousif = productMapping.mapEntityToDto(filteredProduct, ProductDtoYousif.class);
            productDtoYousifs.add(productDtoYousif);
        }
        System.out.println(productDtoYousifs.size());
        return productDtoYousifs;
    }

}
