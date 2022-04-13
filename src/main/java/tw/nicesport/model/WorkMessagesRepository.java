package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkMessagesRepository extends JpaRepository<WorkMessages, Integer>{

	//時間最大就是最新的
	//先寫Entity再寫Dao再寫Service
	public WorkMessages findFirstByOrderByAddedDesc();
}
