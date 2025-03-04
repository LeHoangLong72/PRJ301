package dao;

import java.util.List;

public interface IDAO <T, K>{
    public boolean create(T entity);
    public List<T> readAll();
    public T readByUsername(K username);
    public boolean update(T entity);
    public boolean delete(K username);
    public List<T> search(String searchTerm);
}
