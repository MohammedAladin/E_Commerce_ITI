package iti.jets.persistence.customer;

import iti.jets.business.entities.Customer;
import iti.jets.persistence.Repository;

import java.util.List;

public class CustomerRepo implements Repository<Customer, Integer> {

    @Override
    public Customer save(Customer entity) {
        return null;
    }

    @Override
    public Customer findById(Integer integer) {
        return null;
    }

    @Override
    public List<Customer> findAll() {
        return null;
    }

    @Override
    public Customer update(Customer entity) {
        return null;
    }

    @Override
    public void delete(Customer entity) {

    }

    @Override
    public void deleteById(Integer integer) {

    }
}
