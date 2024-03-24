package iti.jets.presentation.actions;

import iti.jets.Services.EditProfileService;
import iti.jets.Services.EntityManagerThreads;
import iti.jets.business.entities.Customer;
import iti.jets.business.enums.CustomerFields;
import iti.jets.presentation.FrontCommand;
import jakarta.persistence.EntityManager;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Map;

public class UploadImageCommand extends FrontCommand {


    @Override
    public void doPostProcess() throws IOException {

        byte[] imageData = readImageData(request.getInputStream());
        System.out.println("UploadImageCommand.doPostProcess() imageData: ");

        Customer customer = (Customer) request.getSession().getAttribute("customer");
        System.out.println("UploadImageCommand.doPostProcess() id: " + customer.getCustomerName());

        updateProfileData(imageData, customer.getId());


    }
    private void updateProfileData(byte[] img, int id) {
        EntityManager editProfileEntityManager = EntityManagerThreads.getEntityManager();
        EditProfileService editProfileService = new EditProfileService(editProfileEntityManager);
        editProfileService.updateProfileImage(id, img);
        EntityManagerThreads.closeEntityManager();
    }
    private byte[] readImageData(InputStream inputStream) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096]; // Adjust buffer size as needed

        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        return outputStream.toByteArray();
    }

    @Override
    public void doGetProcess() {

        Customer customer = (Customer) request.getSession().getAttribute("customer");
        byte[] img = customer.getCustomerImage();

        System.out.println("UploadImageCommand.doGetProcess() img: " + Arrays.toString(img));
        response.setContentType("image/jpeg");
        try {
            response.getOutputStream().write(img);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
