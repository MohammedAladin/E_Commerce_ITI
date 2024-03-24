package iti.jets.presentation.listeners;

import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.security.Timestamp;


public class MyServletRequestListener implements ServletRequestListener {

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();

        // Log request details with timestamps
        System.out.println("Request received at: " + System.currentTimeMillis());
        System.out.println("Request URL: " + request.getRequestURL());
        System.out.println("Request method: " + request.getMethod());
        System.out.println("Remote IP address: " + request.getRemoteAddr());

        // Start session if required and capture session ID
        HttpSession session = request.getSession(true);
        String sessionId = session.getId();
        System.out.println("Session ID: " + sessionId);

        // You can access or store additional request attributes here
        String username = (String) request.getAttribute("username");
        if (username != null) {
            System.out.println("Logged in user: " + username);
        }
    }

    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
        HttpSession session = request.getSession(false);

        // Log session invalidation (if applicable)
        if (session != null) {
            System.out.println("Session with ID: " + session.getId() + " was invalidated.");
        }
    }
}