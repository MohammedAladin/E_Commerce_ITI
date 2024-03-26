package iti.jets.business.Mappings;

import iti.jets.business.Dtos.ProductData;
import iti.jets.business.Dtos.ProductDto;
import iti.jets.business.entities.Product;

public class ProductIMapping extends GenericMapping<Product, ProductData>{
    private static ProductIMapping instance;

    private ProductIMapping(){
        if (instance!=null){
            throw new RuntimeException("wld 3eeb");
        }
    }

    public static synchronized ProductIMapping getInstance(){
        if (instance == null){
            instance = new ProductIMapping();
        }
        return instance;
    }
}
