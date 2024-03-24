package iti.jets;

import com.google.gson.Gson;
import iti.jets.Services.AdminService;
import iti.jets.business.Dtos.ProductData;
import iti.jets.business.Dtos.ProductDto;
import iti.jets.business.entities.Product;
import iti.jets.business.util.JsonMapper;
import iti.jets.persistence.connection.JPAManager;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class App {
    public static void main(String[] args) {

//        EntityManagerFactory emf = JPAManager.INSTANCE.getEntityManagerFactory();
//        EntityManager em = emf.createEntityManager();

        AdminService adminService = new AdminService();

        List<ProductData> allProduct = adminService.getAllProduct();

        List<String> jsonProducts = new ArrayList<>();
        allProduct.forEach(productData -> {
            String productToJson = productToJson(productData);
            jsonProducts.add(productToJson);
        });
        System.out.println(jsonProducts);


    }

    public static <T> String convertToJson(T object) {
        Gson gson = new Gson();
        return gson.toJson(object);
    }


    private static String productToJson( ProductData productData) {
        System.out.println("inside productToJson function");
        JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder();
        System.out.println("inside productToJson function2");
        jsonObjectBuilder.add( "productId", productData.getId() )

                .add("productName", productData.getProductName())
                .add("productDescription", productData.getProductDescription())
                // Assuming productImage is converted to Base64 for JSON
                .add("productImage", Base64.getEncoder().encodeToString(productData.getProductImage()))
                .add("price", productData.getPrice())
                .add("stockCount", productData.getStockCount())
                .add("categoryName", productData.getCategoryName());
        System.out.println("inside productToJson function3");
        return jsonObjectBuilder.build().toString();
    }
}
