package pl.coderslab.charity.Service;

import pl.coderslab.charity.model.User;

public interface UserService {
    User findByEmail(String email);
    void saveUser(User user);
}
