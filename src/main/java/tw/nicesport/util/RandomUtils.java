package tw.nicesport.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.ThreadLocalRandom;

public class RandomUtils {
	
    public static LocalDate getRandomDate(int minYear, int maxYear) {
        /** Given a group size, this method will return `n` random birthday
         * between 1922-2022 where `n=groupSize`.
         * 
         * @param   groupSize   the number of random birthday to return
         * @param   minYear     the min year [lower bound]
         * @param   maxYear     the max year [upper bound]
         * @return              a list of random birthday with format YYYY-MM-DD
         */
        
    	// 隨便以今天為初始值
    	LocalDate anyDate = LocalDate.now(); 
    	
        // 亂數使用更有效率的 ThreadLocalRandom, 確保多 thread 時亂數不排隊
        
        // 年亂數, 先決定該年有幾天
        LocalDate dateWithRandYear = anyDate.withYear(ThreadLocalRandom.current().nextInt(minYear, maxYear));

        // 日亂數
        // 先亂數 1-365,366
        int randDayOfYear = ThreadLocalRandom.current().nextInt(1, dateWithRandYear.lengthOfYear());
        LocalDate dateWithRandYearAndRandRandDayOfYear = dateWithRandYear.withDayOfYear(randDayOfYear);

        // D 轉 d (?)
        LocalDate randDate = LocalDate.of(
        	dateWithRandYearAndRandRandDayOfYear.getYear(),
        	dateWithRandYearAndRandRandDayOfYear.getMonth(),
        	dateWithRandYearAndRandRandDayOfYear.getDayOfMonth()
        );

        // 以指定格式轉 String
//        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // y 指 day-based year (cf. Y 指 weak-based year), d 指 day of month (cf. D 指 day of year) 
//        String formattedDate = dateFormat.format(randDate);

        return randDate;
    }
    
    public static int getRandPositiveInt(int minInt, int maxInt) {
    	return minInt + (int) Math.floor(   (Math.random()*(maxInt-minInt))   );
    }
    
    public static int getRandomIndex(int length){
    	   return ThreadLocalRandom.current().nextInt(length);
    	}
}
