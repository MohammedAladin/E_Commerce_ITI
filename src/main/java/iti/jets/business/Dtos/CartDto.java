package iti.jets.business.Dtos;

import iti.jets.business.entities.Customer;

import java.io.Serializable;
import java.util.List;

public class CartDto implements Serializable {
    private Integer id;

    public CartDto() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
