package tw.nicesport.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Entity
@Table(name = "Stock")
@Component
public class StockBean implements Serializable {



	
	@Id
	@Column(name="stock_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private Integer quantity;

	private String createdAt;

	private String modifiedAt;
	
	
	public StockBean() {
	}
	
	
	
	public StockBean(Integer stock_id,Integer quantity,String createdAt, String modifiedAt) {
		
		this.id = stock_id;
		this.quantity = quantity;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
	}
	
	

	public Integer getStock_id() {
		return id;
	}

	public void setStock_id(Integer stock_id) {
		this.id = stock_id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

}
