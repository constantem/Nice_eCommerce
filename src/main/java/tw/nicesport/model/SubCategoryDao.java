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
public class SubCategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<SubCategoryBean> queryAll() {
		Session session = sessionFactory.openSession();

		Query<SubCategoryBean> query = session.createQuery("from SubCategoryBean", SubCategoryBean.class);

		return query.list();
	}

	public SubCategoryBean insertSubCategory(SubCategoryBean subBean) {
		Session session = sessionFactory.openSession();
		if (subBean != null) {
			session.save(subBean);
		}
		return subBean;
	}

}
