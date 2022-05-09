package tw.nicesport.util;

public class DiscountUtils {
	
	private static final String WITH_THRESHOLD = "有門檻";
	private static final String WITHOUT_THRESHOLD = "無門檻";
	private static final String PERCENT_DISCOUNT = "比例折扣";
	private static final String AMOUNT_DISCOUNT = "定額折扣";
	
	// 回傳 true, 代表總金額符合折價門檻, 優惠券可使用
	// 回傳 false, 代表總金額"不"符合折價門檻, 優惠券不可使用
	// 回傳 null, 代表優惠券設定有誤, 無效的優惠券
	public static Boolean isDiscountable(
			int oldMoney, String conditionCategory, Integer conditionPrice , Integer currentQuantity) {
		
		if(conditionCategory==null) {
			return null;
		}
		
		switch(conditionCategory) {
		
			/////////////////////////////////////////////////////////////
			case WITH_THRESHOLD: // 有門檻
				
				// 無門檻值 
				if( conditionPrice == null && currentQuantity > 0) {
					return null;
				}
				
				// 有門檻值, 且過門檻值
				if( oldMoney >= conditionPrice && currentQuantity > 0 ) {
					return true;
				// 沒過門檻值, 不適用折價券
				} else {
					return false;
				} 
				
			/////////////////////////////////////////////////////////////
			case WITHOUT_THRESHOLD: // 無門檻
				if(currentQuantity > 0) {
					return true;
				} else {
					return false;
				}
				
			/////////////////////////////////////////////////////////////
			default: // 若 conditionCategory 不是寫 "有門檻", "無門檻"
				return null;
		}

	}
	
	// 回傳折扣後的金額: 代表使用優惠券, 並獲得折價後的金額
	// 回傳 null: 代表優惠券設定有誤, 無效的優惠券
	public static Integer resultCalculator(
			int oldMoney, String discountCategory, Integer discountPercent, Integer discountAmount) {
		
		if(discountCategory == null) {
			return null;
		}
		
		switch(discountCategory) {
			
			/////////////////////////////////////////////////////////////
			case PERCENT_DISCOUNT: // 比例折扣
				// discountPercent 沒寫的狀況
				if(discountPercent == null) {
					return null;
				} 
				
				if(discountPercent>100 || discountPercent<=0) {
					return null;
				}
				
				return ((int) (oldMoney*(100-discountPercent)/100));
			
			/////////////////////////////////////////////////////////////
			case AMOUNT_DISCOUNT: // 定額折扣
				
				// discountAmount 沒寫的狀況
				if(discountAmount == null) {
					return null;
				}
				
				if(discountAmount <= 0) {
					return null;
				}
				
				return discountAmount;
				
			/////////////////////////////////////////////////////////////
			default: // 若 discountCategory 不是寫 "比例折扣", "定額折扣"
				return null;
		}
		
	}
	
}
