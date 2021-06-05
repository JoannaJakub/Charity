package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.User;
import java.util.List;

@Service
public interface UserService {
    User findByEmail(String email);
    void saveUser(User user);
    void delete(Long id);
    List<User> findAll();

    User getCurrentUser();
}
