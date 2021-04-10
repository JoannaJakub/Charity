package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.User;

import java.util.List;

@Service
public interface UserService {
    User findByEmail(String email);
    User findById(long id);
    void saveUser(User user);
    User deleteUser(Long id);
    List<User> findAll();

}