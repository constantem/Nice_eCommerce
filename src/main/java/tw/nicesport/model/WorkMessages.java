package tw.nicesport.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="work_messages")
public class WorkMessages {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)//自動產生
	@Column(name="id")
	private Integer id;
	
	
	// 搭配 controller的 @Valid, BindingResult
	// https://docs.jboss.org/hibernate/stable/validator/reference/en-US/html_single/#section-builtin-constraints
	@Size(min = 2, max = 199, message = "請輸入 2 到 199 個字串")
	//@Email(message = "請輸入 Email")
	@Column(name="text", columnDefinition = "nvarchar(200)")//columnDefinition客製化資料庫資料型別
	private String text;
	
	//時間從資料庫產生
	@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss")//大寫MM是月，小寫mm是分鐘
	@Temporal(TemporalType.TIMESTAMP)//說明要用哪種時間表示方式
	@Column(name="added", columnDefinition = "datetime")//columnDefinition來說明資料庫資料型別 
	private Date added;

	public WorkMessages() {
	}
	
	//讓時間從系統產生
	//蠻常使用到
	@PrePersist   // 再轉換到 Persist 狀態以前去做以下方法
	public void onCreate() {
		if(added == null) {
			added = new Date();
		}
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	@Override
	public String toString() {
		return "WorkMessages [id=" + id + ", text=" + text + ", added=" + added + "]";
	}
	
	
	

}
