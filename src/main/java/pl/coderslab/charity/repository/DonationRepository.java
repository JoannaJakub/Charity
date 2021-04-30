package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.model.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query(value = "SELECT sum(d.quantity) from Donation d")
    Integer sumOfDonationQuantity();

    @Query(value = "SELECT count(d.quantity) from Donation d")
    int countAllById();


    List<Donation> findDonationByUserId(long User);
    List<Donation> findDonationByInstitutionId(long Institution);

    @Query(value ="SELECT*FROM donation d JOIN  donation_categories dc  ON d.id = dc.donation_id where categories_id=?", nativeQuery=true)
    List<Donation> findDonationByCategoryId(long Category);


}
