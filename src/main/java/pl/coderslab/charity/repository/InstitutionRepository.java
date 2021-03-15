package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Institution;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface InstitutionRepository extends JpaRepository<Institution, Long> {
 //   @Query(value = "SELECT distinct a FROM Institution a ")
    List<Institution> findTop4ById(long Id);

}
