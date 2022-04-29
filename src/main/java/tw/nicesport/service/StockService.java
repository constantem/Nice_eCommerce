
package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ProductBean;
import tw.nicesport.model.ProductRepository;
import tw.nicesport.model.StockBean;
import tw.nicesport.model.StockDao;
import tw.nicesport.model.StockRepository;

@Service
@Transactional
public class StockService {

	@Autowired
	private StockDao stDao;

	@Autowired
	private StockRepository stRes;

	public List<StockBean> queryAll() {
		return stDao.queryAll();
	}
	
	public List<StockBean> findAll(){
		return stRes.findAll();
	}

	public StockBean insertStock(StockBean stBean) {
		return stDao.insertStock(stBean);
	}

	public StockBean StockBeanfindById(Integer stockId) {
		Optional<StockBean> option = stRes.findById(stockId);

		if (!option.isEmpty()) {
			return option.get();
		}
		return null;
	}

}
