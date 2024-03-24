package iti.jets.Services;

import iti.jets.business.entities.Customer;
import iti.jets.business.enums.CustomerFields;
import iti.jets.persistence.repositories.CustomerRepo;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.Map;

public class EditProfileService {

    private final CustomerRepo customerRepo;
    public EditProfileService(EntityManager entityManager) {
        customerRepo = new CustomerRepo(entityManager);

    }

    public void updateProfileData(int customerId, Map<CustomerFields, String> profileData){
        // update the customer's profile data in the database

        Customer customer = customerRepo.findById(Customer.class, customerId);

        System.out.println("EditProfileService.updateProfileData() customer: " + customer.getCustomerName());

        profileData.forEach((k, v) -> {
            switch (k) {
                case CUSTOMER_NAME -> {
                    System.out.println("EditProfileService.updateProfileData() customerName: " + v);
                    if (v != null)
                        customer.setCustomerName(v);
                }
                case CUSTOMER_PHONE -> {
                    if (v != null)
                        customer.setPhoneNumber(v);
                }
                case CUSTOMER_EMAIL -> {
                    if (v != null)
                        customer.setEmail(v);
                }
                case CUSTOMER_PASSWORD -> {
                    if (v != null)
                        customer.setPassword(v);
                }

                case CUSTOMER_DOB -> {
                    if (v != null)
                        customer.setDob(LocalDate.parse(v));
                }
            }
        });
        customerRepo.update(customer);
    }

    public void updateProfileImage(int customerId, byte[] image){
        // update the customer's profile image in the database


        Customer customer = customerRepo.findById(Customer.class, customerId);
        System.out.println("EditProfileService.updateProfileImage() customer: " + customer.getCustomerName());

        if(customer!=null){
            System.out.println("EditProfileService.updateProfileImage() customer: " + customer.getCustomerName());
            customer.setCustomerImage(image);
        }

        customerRepo.update(customer);

    }
}
