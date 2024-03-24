package iti.jets.presentation.Filters;

import jakarta.servlet.*;

import java.io.IOException;

public class EncodingFilter implements Filter {

    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Get encoding parameter from web.xml or use default if not specified
        encoding = filterConfig.getInitParameter("encoding");
        if (encoding == null) {
            encoding = "UTF-8"; // Default encoding
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Set character encoding for request
        request.setCharacterEncoding(encoding);

        // Set character encoding for response
        response.setCharacterEncoding(encoding);

        // Continue with the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
