package tw.nicesport.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface CustomerSupportDAO extends JpaRepository<CustomerBean, Integer> {

	public CustomerBean findFirstByOrderByIdDesc();
	
	@Modifying  //要對資料庫進行修改或刪除時，必須使用這個標籤
	@Query(value="delete from customer where id =?1", nativeQuery = true) //nativeQuery = true，才能使用原生sql語法
	public void deleteCustomerById(Integer id);
	
	//單獨搜尋
	@Query(value="select * from CustomerSupport where id=#{id}", nativeQuery = true)
	public Optional<CustomerBean> findById(int id);
	
	//搜尋全部
	@Query(value="select * from CustomerSupport", nativeQuery = true)
	public List<CustomerBean> findAll();
	
	//刪除一筆
	@Modifying
	@Query(value="delete from CustomerSupport where id=#{id}", nativeQuery = true)
	public void deleteById(Integer id);
	
	//更新部分欄位
	@Modifying
	@Query(value="update CustomerSupport set processStatus=#{processStatus},remark=#{remark},modifiedAt=now() where id=#{id}", nativeQuery = true)
	public void update(CustomerBean csb);
	
	//客人新增一筆
	@Query(value="insert into CustomerSupport(serviceInfo,description,name,phone,preferedContactTime,createdTime) "
			+ "values (#{serviceInfo},#{description},#{name},#{phone},#{preferedContactTime},now())", nativeQuery = true)
	public void add1(CustomerBean csb);

	//員工新增一筆
	@Query(value="insert into CustomerSupport(remark,modifiedAt) values (#{remark},now())", nativeQuery = true)
	public void add(CustomerBean csb1);
	
	

}


