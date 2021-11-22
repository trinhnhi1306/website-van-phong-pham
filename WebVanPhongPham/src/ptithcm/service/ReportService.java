package ptithcm.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.bean.MyItem;
import ptithcm.dao.ReportDAO;

@Service
@Transactional
public class ReportService {
	
	@Autowired
	ReportDAO reportDAO;
	
	public List<MyItem> reportOrder()
	{
		List<MyItem> list = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            MyItem myItem = new MyItem();
            myItem.setName("abc");
            //System.out.println(orderDAO.countOrderByStatus(i));
            myItem.setValue(reportDAO.countOrderByStatus(i));
            list.add(myItem);
        }
        return list;
	}
	
	public List<MyItem> reportReceipt(Date date, int limit) {
        List<MyItem> list = new ArrayList<>();
        for (int i = limit - 1; i >= 0; i--) {
            Date d = subDays(date, i);
            MyItem myItem = new MyItem();
            myItem.setName(covertD2S(d));
            myItem.setValue(reportDAO.countItemByDate(d));
            list.add(myItem);
        }
        return list;
    }
	
	public List<MyItem> reportUser(Date date, int limit) {
        List<MyItem> list = new ArrayList<>();
        for (int i = limit - 1; i >= 0; i--) {
            Date d = subDays(date, i);
            MyItem myItem = new MyItem();
            myItem.setName(covertD2S(d));
            myItem.setValue(reportDAO.countUserByDate(d));
            list.add(myItem);
        }
        return list;
    }
	
	public Date addDays(Date date, int days) {
        GregorianCalendar cal =  new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }

    public Date subDays(Date date, int days) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, -days);
        return cal.getTime();
    }

    private String covertD2S(Date date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyy");
        return df.format(date);
    }

}
