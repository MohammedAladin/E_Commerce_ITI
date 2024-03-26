package iti.jets.presentation.listeners;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class MyHttpSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // Session creation logic
        HttpSession session = se.getSession();
        System.out.println("Session Created: " + session.getId());
        // You can perform any initialization tasks here
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // Session destruction logic
        HttpSession session = se.getSession();
        System.out.println("Session Destroyed: " + session.getId());
        // You can perform any cleanup tasks here
    }
}