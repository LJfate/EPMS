import com.lj.dao.UserInfDao;
import com.lj.domain.User_inf;
import com.lj.util.JsonResult;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;
import  com.lj.domain.Attendance;
public class test {
ClassPathXmlApplicationContext ac;
@Before
public void  before(){
    ac=new ClassPathXmlApplicationContext("spring-core.xml");
}
@After
public void alter(){
    ac.close();
}
@Test
public void  findByUserName(){
    UserInfDao userInfDao = ac.getBean("userInfDao", UserInfDao.class);
    User_inf admin = userInfDao.findByUserName("admin");
    System.out.println(admin.getLogin_name());
    JsonResult jsonResult = new JsonResult(1);
    //System.out.println(jsonResult.getResult());
}
}