package iti.jets.Persistence;

import java.util.List;

public interface Repository<T, ID> {
    T save(T entity);
    T findById(ID id);
    List<T> findAll();
    T update(T entity);
    void delete(T entity);
    void deleteById(ID id);
}