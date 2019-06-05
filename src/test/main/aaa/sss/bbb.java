package aaa.sss;

import org.junit.Test;

import java.util.Calendar;
import java.util.Date;

/**
 * @author SGN196
 * @date 2019/5/24 ss.txt:19
 */

public class bbb
{

    @Test
    public  void  test02(){
        System.out.println(new Date());
        Calendar cal  = Calendar.getInstance();
        cal.add(Calendar.DATE, -7);

        System.out.println(cal.getTime());
    }
    @Test
    public void test01(){
        Calendar cal = Calendar.getInstance();
        java.util.Date[] dates = new java.util.Date[7];
        dates[6] = cal.getTime();
        for (int i = 5; i >= 0; i--)
        {
            cal.add(Calendar.DATE, -7);
            dates[i] = cal.getTime();
        }

        for (int i = 0; i < 7; i++)
        {
            System.out.println(dates[i]);
        }

    }
}
