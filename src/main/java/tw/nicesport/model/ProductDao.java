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
public class ProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<ProductBean> selectAll() {
		Session session = sessionFactory.openSession();
		Query<ProductBean> query = session.createQuery("from ProductBean", ProductBean.class);
		return query.list();
	}

	public ProductBean insertProduct(ProductBean prodBean) {
		Session session = sessionFactory.openSession();
		if (prodBean != null) {
			session.save(prodBean);
		}
		return prodBean;
	}

	public boolean UpdateById(Integer product_id ,ProductBean p) {
		Session session = sessionFactory.openSession();
		ProductBean pdBean = session.get(ProductBean.class, product_id);
		
		if(pdBean!=null) {
			pdBean.setProductName(p.getProductName());
		pdBean.setSize(p.getSize());
		pdBean.setSupplier(p.getSupplier());
		pdBean.setColor(p.getColor());
		pdBean.setPrice(p.getPrice());
		pdBean.setWeight(p.getWeight());
		return true;
		}
		return false;
	}
	
	
	public void deleteById(Integer product_id){
		Session session = sessionFactory.openSession();
		ProductBean pdBean = session.get(ProductBean.class, product_id);
		session.delete(pdBean);
	}
	
	
	public ProductBean queryById(Integer product_id) {
		Session session = sessionFactory.openSession();
		return session.get(ProductBean.class, product_id);
	}
	
	
	

}
