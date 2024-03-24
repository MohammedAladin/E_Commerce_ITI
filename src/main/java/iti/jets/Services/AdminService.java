package iti.jets.Services;

import iti.jets.business.Dtos.*;
import iti.jets.business.Mappings.CartItemMapping;
import iti.jets.business.Mappings.CustomersMapping;
import iti.jets.business.Mappings.ProductDataMapping;
import iti.jets.business.Mappings.ProductIMapping;
import iti.jets.business.entities.Category;
import iti.jets.business.entities.Customer;
import iti.jets.business.entities.CustomerOrder;
import iti.jets.business.entities.Product;
import iti.jets.business.util.JsonMapper;
import iti.jets.persistence.connection.JPAManager;
import iti.jets.persistence.repositories.CategoryRepo;
import iti.jets.persistence.repositories.CustomerOrderRepo;
import iti.jets.persistence.repositories.CustomerRepo;
import iti.jets.persistence.repositories.ProductRepoad;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.persistence.EntityManager;

import javax.persistence.PersistenceException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import java.util.Base64;
import java.util.stream.Collectors;

public class AdminService {

    EntityManager em;
    ProductRepoad productRepo;

    public AdminService(){
        em = JPAManager.INSTANCE.getEntityManagerFactory().createEntityManager();
        productRepo = new ProductRepoad(em);
    }

    public List<ProductData> getAllProduct(){
        List<Product> products = productRepo.findAll(Product.class);

        List<ProductData> items = products.stream()
                .map(product -> ProductDataMapping.getInstance().mapEntityToDto(product, ProductData.class))
                .toList();
        return items;
    }

    public boolean deleteProductById(int id){
        try {
            Product product = productRepo.deleteById(Product.class, id);
            return true;
        }catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

    public void addProduct(ProductData productData) {
        Category category = getCategoryByName(productData.getCategoryName());
        System.out.println("category get "+ category.getCategoryName());
//        byte[] decodedImageData = Base64.getDecoder().decode(productData.getProductImage());

        System.out.println("desc "+ productData.getProductDescription());
        Product newProduct = new Product();
        newProduct.setProductName(productData.getProductName());
        newProduct.setProductDescription(productData.getProductDescription());
        newProduct.setCategory(category);
        newProduct.setPrice(BigDecimal.valueOf(productData.getPrice()));
        newProduct.setStockCount(productData.getStockCount());
        newProduct.setProductImage(productData.getProductImage());

        System.out.println(newProduct.getProductName());
        System.out.println(newProduct.getCategory().getCategoryName());
        System.out.println(newProduct.getProductImage().length);
        System.out.println(newProduct.getPrice());
        System.out.println("desc after "+newProduct.getProductDescription());
        productRepo.save(newProduct);

        //you need to modify size of picture in database
    }

    public Category getCategoryByName(String categoryName){
        return productRepo.getCategoryByName(categoryName);
    }

    public void updateProduct(ProductData updatedProduct) {
        Product product = productRepo.findById(Product.class, updatedProduct.getId());
//        byte[] decodedImageData = Base64.getDecoder().decode(updatedProduct.getProductImage());
        Category category = getCategoryByName(updatedProduct.getCategoryName());

        product.setProductName(updatedProduct.getProductName());
        product.setPrice(BigDecimal.valueOf(updatedProduct.getPrice()));
        product.setStockCount(updatedProduct.getStockCount());
        product.setCategory(category);
        product.setProductImage(updatedProduct.getProductImage());
        product.setProductDescription(updatedProduct.getProductDescription());

        productRepo.update(product);
    }

    public List<String> getAllCategoryNames(){
        CategoryRepo categoryRepo = new CategoryRepo(em);

        List<String> categoryNames = categoryRepo.findAll(Category.class)
                .stream()
                .map(Category::getCategoryName)
                .toList();

        return categoryNames;
    }

    public List<CustomerDto> getAllCustomers() {
        CustomerRepo customerRepo = new CustomerRepo(em);

        List<Customer> all = customerRepo.findAll(Customer.class);
        List<CustomerDto> customerDtos = new ArrayList<>();

        CustomersMapping customersMapping = new CustomersMapping();
        all.forEach(customer -> {
            CustomerDto customerDto = customersMapping.mapEntityToDto(customer, CustomerDto.class);
            customerDtos.add(customerDto);
        });

        customerDtos.forEach(System.out::println);
        return customerDtos;
    }

    public List<CustomerOrderDto> getAllOrders() {
        CustomerOrderRepo customerOrderRepo = new CustomerOrderRepo(em);

        List<CustomerOrder> allOrders = customerOrderRepo.findAll(CustomerOrder.class);
        List<CustomerOrderDto> customerDtos = new ArrayList<>();

        allOrders.forEach(order -> {
            CustomerOrderDto orderDto = new CustomerOrderDto();
            orderDto.setId(order.getId());
            orderDto.setTotalPrice(order.getTotalPrice());
            orderDto.setDate(order.getDate().toString());
            orderDto.setOrderStatus(order.getOrderStatus());
            orderDto.setCustomerId(order.getCustomer().getId());
            orderDto.setCustomerName(order.getCustomer().getCustomerName());

            customerDtos.add(orderDto);
        });

        return customerDtos;
    }
}
