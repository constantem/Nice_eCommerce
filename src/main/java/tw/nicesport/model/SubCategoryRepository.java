package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SubCategoryRepository extends JpaRepository<SubCategoryBean, Integer> {
	
	SubCategoryBean findByName(String name);

}
