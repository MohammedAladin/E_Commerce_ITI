package iti.jets.Services;

import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.ExceptionsHandling.CustomException;
import iti.jets.business.Mappings.CustomersMapping;
import iti.jets.business.Validations.CustomerValidations;
import iti.jets.business.entities.Cart;
import iti.jets.business.entities.Customer;
import iti.jets.persistence.repositories.CartRepo;
import iti.jets.persistence.repositories.CustomerRepo;
import jakarta.persistence.EntityManager;

import java.math.BigDecimal;

public class AuthServices {

    CustomerRepo customerRepo;
    CartRepo cartRepo;
    public AuthServices() {
        EntityManager entityManager = EntityManagerThreads.getEntityManager();
        customerRepo = new CustomerRepo(entityManager);
        cartRepo = new CartRepo(entityManager);
    }

    public Customer login(String username, String password){
        Customer customer = customerRepo.findByEmail(username);

        if(customer != null){
            if(customer.getPassword().equals(password)){
                System.out.println("Logged in successfully--- login service");
                return customer;
            }
        }
        System.out.println("Invalid email or password--- login service");
        return null;
    }

    public Customer register(CustomerDto customerDto) throws IllegalAccessException, CustomException {

        CustomersMapping customersMapping = new CustomersMapping();
        System.out.println(customerDto.getCustomerName());
        Customer customer = customersMapping.mapDtoToEntity(customerDto, Customer.class);
        customer.setDob(customerDto.getDob());
        System.out.println(customer.getCustomerName());
        customer.setCreditLimit(1500.0);

        if(CustomerValidations.hasNullNonNullableFields(customer)) {
            System.out.println("Null fields are not allowed");
            throw new CustomException("Null fields are not allowed", 400);
        }
        if(customerRepo.findByEmail(customer.getEmail()) != null){
            System.out.println("Email already exists");
            throw new CustomException("Email already exists", 400);
        }


        try {
            customerRepo.save(customer);

            Cart cart = new Cart();
            cart.setCustomer(customer);

            cartRepo.save(cart);
            //customer.setCart(cart);


        }catch (Exception e){
            System.out.println(e.getMessage());
            throw new CustomException("Error in saving customer", 400);
        }



        return customer;
    }

    public boolean logout(){
        return true;
    }

    public boolean forgetPassword(String username){
        return true;
    }

    public boolean changePassword(String username, String oldPassword, String newPassword){
        return true;
    }

    public boolean changeEmail(String username, String newEmail){
        return true;
    }

    public boolean changePhone(String username, String newPhone){
        return true;
    }

    public boolean changeAddress(String username, String newAddress){
        return true;
    }

    public boolean changeProfilePic(String username, String newProfilePic){
        return true;
    }

    public boolean changeBio(String username, String newBio){
        return true;
    }

    public boolean changeJob(String username, String newJob){
        return true;
    }

    public boolean changeBirthDate(String username, String newBirthDate){
        return true;
    }

    public boolean changeGender(String username, String newGender){
        return true;
    }

    public boolean changeStatus(String username, String newStatus){
        return true;
    }

    public boolean changeInterests(String username, String newInterests){
        return true;
    }

    public boolean changeHobbies(String username, String newHobbies){
        return true;
    }

    public boolean changeRelationshipStatus(String username, String newRelationshipStatus){
        return true;
    }

    public boolean changeEducation(String username, String newEducation){
        return true;
    }

    public boolean changeWork(String username, String newWork){
        return true;
    }

    public boolean changeSkills(String username, String newSkills){
        return true;
    }

    public boolean changeLanguages(String username, String newLanguages){
        return true;
    }

    public boolean changeNationality(String username, String newNationality){
        return true;
    }

    public boolean changeReligion(String username, String newReligion){
        return true;
    }

    public boolean changePoliticalViews(String username, String newPoliticalViews){
        return true;
    }

    public boolean changeWebsite(String username, String newWebsite){
        return true;
    }

    public boolean changeSocialMedia(String username, String newSocialMedia){
        return true;
    }
}
