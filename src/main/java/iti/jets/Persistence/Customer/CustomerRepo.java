package iti.jets.Persistence.Customer;

import iti.jets.Business.Entities.Customer;
import iti.jets.Persistence.Repository;

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
