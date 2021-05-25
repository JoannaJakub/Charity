package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.model.Contact;
import pl.coderslab.charity.model.Donation;

import java.util.List;


public interface ContactRepository extends JpaRepository<Contact, Long> {
    List<Contact> findContactByUserId(long User);
    List<Contact> findByContactCategoryId(long ContactCategory);


}
