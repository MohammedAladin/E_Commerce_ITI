package iti.jets.presentation.PagesCommands;

import com.fasterxml.jackson.databind.ObjectMapper;
import iti.jets.Services.EditProfileService;
import iti.jets.Services.EntityManagerThreads;
import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.ExceptionsHandling.CustomException;
import iti.jets.business.entities.Customer;
import iti.jets.business.enums.CustomerFields;
import iti.jets.business.util.JsonMapper;
import iti.jets.presentation.FrontCommand;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static iti.jets.business.enums.CustomerFields.*;



public class EditProfileCommand extends FrontCommand {


    @Override
    public void doPostProcess() throws ServletException, IOException {

        try {
            System.out.println("EditProfileCommand-> doPostProcess()...");

            CustomerDto customerDto = parseJsonToCustomerDto(getJsonString());

            System.out.println("EditProfileCommand.doPostProcess() customer: " + customerDto.getCustomerName());

            Map<CustomerFields, String> profileData = prepareProfileData(customerDto);

            System.out.println("EditProfileCommand.doPostProcess() profileData: " + profileData);

            Customer customer = (Customer) request.getSession().getAttribute("customer");

            updateProfileData(profileData, customer.getId());


            response.setStatus(200);
            response.getWriter().write("Profile updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(400);
            response.getWriter().write("Error: " + e.getMessage());
        }



    }

    private String getJsonString() throws IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString();
    }

    private CustomerDto parseJsonToCustomerDto(String jsonString) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(jsonString, CustomerDto.class);
    }

    private Map<CustomerFields, String> prepareProfileData(CustomerDto customerDto) {
        String dob;
        try {
            dob = customerDto.getDob().toString();
        } catch (Exception e) {
            System.out.println("EditProfileCommand.doPostProcess() dob is null");
            dob = null;
        }

        Map<CustomerFields, String> profileData = new HashMap<>();
        profileData.put(CUSTOMER_NAME, customerDto.getCustomerName());
        profileData.put(CUSTOMER_PHONE, customerDto.getPhoneNumber());
        profileData.put(CUSTOMER_EMAIL, customerDto.getEmail());
        profileData.put(CUSTOMER_PASSWORD, customerDto.getPassword());
        profileData.put(CUSTOMER_DOB, dob);
        profileData.put(CUSTOMER_Country, customerDto.getCountry());

        return profileData;
    }

    private void updateProfileData(Map<CustomerFields, String> profileData, int id) {
        EntityManager editProfileEntityManager = EntityManagerThreads.getEntityManager();
        EditProfileService editProfileService = new EditProfileService(editProfileEntityManager);
        editProfileService.updateProfileData(id, profileData);
        EntityManagerThreads.closeEntityManager();
    }

    @Override
    public void doGetProcess() throws ServletException, IOException {

    }
}
