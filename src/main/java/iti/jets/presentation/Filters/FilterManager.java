package iti.jets.presentation.Filters;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class FilterManager {

    public static void processAuthFilterChain(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilterChain filterChain = new FilterChainImpl(new AuthenticationFilter());
        filterChain.doFilter(request, response);
    }
    public static void processLoggingFilterChain(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilterChain filterChain = new FilterChainImpl(new LoggingFilter());
        filterChain.doFilter(request, response);
    }


}
