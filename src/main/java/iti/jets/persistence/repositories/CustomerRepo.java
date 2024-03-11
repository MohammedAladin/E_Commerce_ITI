package iti.jets.persistence.repositories;

public class CustomerRepo extends CrudRepo<Customer, Integer>{
    public CustomerRepo() {
        super();
    }

    //here you have an object from entity manager and you can deal with database
}
