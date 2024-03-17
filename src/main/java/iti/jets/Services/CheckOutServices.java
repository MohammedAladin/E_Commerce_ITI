package iti.jets.Services;

import iti.jets.business.ExceptionsHandling.CustomException;
import iti.jets.business.entities.Cart;
import iti.jets.business.entities.CartItem;
import iti.jets.business.entities.Customer;
import iti.jets.business.entities.CustomerOrder;
import iti.jets.persistence.repositories.CartItemRepo;
import iti.jets.persistence.repositories.CartRepo;
import iti.jets.persistence.repositories.CustomerOrderRepo;
import iti.jets.persistence.repositories.CustomerRepo;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.Set;

public class CheckOutServices {

    CustomerRepo customerRepo;
    CustomerOrderRepo customerOrderRepo;
    CartItemRepo cartItemRepo;
    CartRepo cartRepo;
    EntityManager entityManager;

    public CheckOutServices() {
        entityManager = EntityManagerThreads.getEntityManager();
        customerRepo = new CustomerRepo(entityManager);
        customerOrderRepo = new CustomerOrderRepo(entityManager);
        cartRepo = new CartRepo(entityManager);
        cartItemRepo = new CartItemRepo(entityManager);
    }

    public void checkOut(int customerId) throws CustomException {
        Customer customer = customerRepo.findById(Customer.class, customerId);

        validateCreditLimit(customer);
        processOrder(customer);
        updateInventory(customer.getCart().getCartItems());
        clearCart(customer);
    }

    private void validateCreditLimit(Customer customer) throws CustomException {
        Cart cart = customer.getCart();
        double total = cart.getTotalPrice();
        if (customer.getCreditLimit() < total) {
            throw new CustomException("Insufficient balance", 400);
        }
    }

    private void processOrder(Customer customer) {
        Cart cart = customer.getCart();

        CustomerOrder customerOrder = new CustomerOrder();
        customerOrder.setCustomer(customer);
        customerOrder.setDate(LocalDate.now());
        customerOrder.setTotalPrice(cart.getTotalPrice());
        customerOrder.setOrderStatus("Done");
        customerOrderRepo.save(customerOrder);

        customer.updateCreditLimit(cart.getTotalPrice());
        customerRepo.update(customer);

    }

    private void updateInventory(Set<CartItem> cartItems) {

        cartItems.forEach(item -> {
            item.getProduct().decrementQuantity(item.getQuantity());
            cartItemRepo.delete(item);
        });

    }

    private void clearCart(Customer customer) {
        customer.getCart().getCartItems().clear();
    }

}
