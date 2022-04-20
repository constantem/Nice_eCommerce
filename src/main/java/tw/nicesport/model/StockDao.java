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
public class StockDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<StockBean> queryAll() {
		Session session = sessionFactory.openSession();
		Query<StockBean> query = session.createQuery("from StockBean", StockBean.class);

		session.close();
		return query.list();
	}

	public StockBean insertStock(StockBean stBean) {
		Session session = sessionFactory.openSession();

		if (stBean != null) {
			session.save(stBean);
		}
		
		session.close();
		return stBean;
	}

}
