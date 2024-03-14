package iti.jets.business.ExceptionsHandling;

public class CustomException extends Exception{


    private final String description;
    private final Integer status;

    public CustomException(String description, Integer status) {
        this.description = description;
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public Integer getStatus() {
        return status;
    }


}
