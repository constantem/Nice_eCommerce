package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface CourseRepository extends JpaRepository<Course, Integer> {
	
	List<Course> findByCourseNameContaining(String courseName);
}
