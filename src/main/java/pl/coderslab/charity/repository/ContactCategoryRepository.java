package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.ContactCategory;


public interface ContactCategoryRepository extends JpaRepository<ContactCategory, Long> {
}