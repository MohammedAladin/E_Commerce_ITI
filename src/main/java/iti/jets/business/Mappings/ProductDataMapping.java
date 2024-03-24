package iti.jets.business.Mappings;

import iti.jets.business.Dtos.ProductData;
import iti.jets.business.Dtos.ProductDto;
import iti.jets.business.entities.Product;

public class ProductDataMapping extends GenericMapping<Product, ProductData>{
    private static ProductDataMapping instance;

    private ProductDataMapping(){
        if (instance!=null){
            throw new RuntimeException("wld 3eeb");
        }
    }

    public static synchronized ProductDataMapping getInstance(){
        if (instance == null){
            instance = new ProductDataMapping();
        }
        return instance;
    }
}
