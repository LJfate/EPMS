import com.lj.domain.Employee;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test_spring {
    @Test
    public void test1(){
        //获取spring容器
        ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-core.xml");
        //通过容器id获取bean对象
        //使用接口调用方法

    }
    @Test
    public void date(){
        Employee employee = new Employee();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        Date date = new Date();
        System.out.println("1:"+date);
        //java.sql.Date date1 = new java.sql.Date(1988-1900,12-1,12);
        //System.out.println("2:"+date1);
        //new Date("yyyy-MMMM-dd hh-mm-ss")
    }
}
