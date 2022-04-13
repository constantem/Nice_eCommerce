package tw.nicesport.model;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	public static final int CODE_SUCCESS = 0;
	public static final int CODE_FAIL = 100;

	// 狀態碼
	private int code;

	// 提示資訊
	private String msg;

	public Msg() {
	}

	// 返回給瀏覽器的資料
	private Map<String, Object> extend = new HashMap<String, Object>();

	public static Msg success() {
		Msg msg = new Msg();
		msg.setCode(CODE_SUCCESS);
		msg.setMsg("處理成功");
		return msg;
	}

	public static Msg fail() {
		Msg msg = new Msg();
		msg.setCode(CODE_FAIL);
		msg.setMsg("處理失敗");
		return msg;
	}

	// 向 Msg 中新增資料
	public Msg add(String key, Object value) {
		this.extend.put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
}
