
package tw.nicesport.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ProductRepository;
import tw.nicesport.model.StockBean;
import tw.nicesport.model.StockDao;

@Service
@Transactional
public class StockService {
	
	@Autowired
	private StockDao stDao;
	
	
	
	public List<StockBean> queryAll(){
		return stDao.queryAll();
	}
	
	public StockBean insertStock(StockBean stBean) {
		return 	stDao.insertStock(stBean);
	}

}
