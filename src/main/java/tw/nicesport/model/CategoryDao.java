package tw.nicesport.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<CategoryBean> queryAll() {

		Session session = sessionFactory.openSession();
		Query<CategoryBean> query = session.createQuery("from CategoryBean", CategoryBean.class);

		return query.list();

	}
	
	public CategoryBean insertCategory( CategoryBean catBean) {
		Session session = sessionFactory.openSession();
		
		if(catBean!=null) {
			session.save(catBean);
		}
		return catBean;
	}
	
	

}
