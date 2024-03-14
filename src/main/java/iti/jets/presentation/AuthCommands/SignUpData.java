package iti.jets.presentation.AuthCommands;

public class SignUpData {
    private String username;
    private String password;
    private String email;
    private String confirmPassword;
    private String phoneNumber;
    private String dob;

    // Constructors, getters, and setters
    public SignUpData() {
    }

    public SignUpData(String username, String password, String email, String confirmPassword, String phoneNumber, String dob) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.confirmPassword = confirmPassword;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
    }

    // Getter and Setter methods for each field
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
}
