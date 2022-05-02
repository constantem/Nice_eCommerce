package tw.nicesport.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AnnouncementRepository extends JpaRepository<AnnouncementBean, Integer>{

//		這兩行會報錯
//		@Query("from Announcement where name = :name")
//		public List<AnnouncementBean> findAnnouncementByName(@Param("name") String name);
//		
//		@Query(value="select*from Announcement where name = :name", nativeQuery = true)
//		public List<AnnouncementBean> findAnnouncementByName2(@Param("name") String name);
		
		@Transactional
		@Modifying
		@Query(value="delete from Announcement where id =?1", nativeQuery = true)
		public void deleteAnnouncementById(Integer announcement_id);

		//public Announcement findFirstByOrderByAddedDesc();
		
		//public List<Announcement> findByLevelOrderByName(Integer level);
}
