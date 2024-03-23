package iti.jets.business.Mappings;

import iti.jets.business.Dtos.CartItemDto;
import iti.jets.business.entities.CartItem;

public class CartItemMapping extends GenericMapping<CartItem, CartItemDto>{

    private static CartItemMapping instance;

    private CartItemMapping(){
        if (instance!= null){
            throw new RuntimeException("wld 3eeb");
        }
    }

    public static synchronized CartItemMapping getInstance(){
        if (instance == null){
            instance = new CartItemMapping();
        }
        return instance;
    }


}
