package com.cakeshop.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cakeshop.bean.Order;
import com.cakeshop.bean.OrderDetail;
import com.cakeshop.bean.Product;
import com.cakeshop.bean.ProductItem;
import com.cakeshop.bean.User;
import com.cakeshop.dao.UserDao;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;

	public boolean register(User user) {
		boolean registerResult = userDao.insert(user);
		return registerResult;
	}
	
	public User checkUserName(String userName) {
		return userDao.selectByUserName(userName);
	}
	
	public User login(String userName) {
		return userDao.selectByUserName(userName);
	}

	public Product addProductToCart(int proid) {
		return userDao.selectById(proid);
	}
	
	public User getUserById(int userId) {
		return userDao.selectByUserId(userId);
	}
	
	public Set<Order> getUserOrder(int loginUserId) {
		User user = userDao.selectByUserId(loginUserId);
		Set<Order> orderSet = user.getOrderSet();
		if(orderSet.isEmpty()) {
			System.out.println(false);
		}else {
			System.out.println(true);
		}
		return orderSet;
	}
	
	public  void updateUserOrder(int userId,Map<String,ProductItem> cart) {
		//设置日期，并格式化
		Order order = new Order();
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		User user = userDao.selectByUserId(userId);
		order.setOrderaddress(user.getUserAddress());
		order.setOrderstate("未支付");
		order.setOrdertime(form.format(date));
		System.out.println("order is"+order);
		//loginUser和订单建立关联关系
		user.getOrderSet().add(order);
		order.setUser(user);
		//map循环cart,得到商品项
		for(String key:cart.keySet()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setProductitemcount(cart.get(key).getProductItemCount());
			Product product = cart.get(key).getProduct();
			orderDetail.setProid(product.getProid());
			orderDetail.setProname(product.getProname());
			orderDetail.setPrice(product.getPrice());
			orderDetail.setListimg(product.getListimg());
			//order和orderDetail建立联系
			order.getOrderdetailSet().add(orderDetail);
			orderDetail.setOrder(order);
		}
		
		userDao.createOrder(order);
	}
	
	public void sendMail(String userEmail) {
		Properties prop = System.getProperties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.host", "smtp.163.com");
		prop.put("mail.smtp.auth", true);
		
		Session session = Session.getInstance(prop, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("javatest2282", "zhangtao123");
			}
		});
		Message msg = new MimeMessage(session);
		try{
			msg.setFrom(new InternetAddress("javatest2282@163.com"));
			msg.addRecipient(Message.RecipientType.TO , new InternetAddress(userEmail));
			msg.setSubject("邮箱激活");
			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			mimeBodyPart.setContent("<a href='http://localhost:8080/cakeshop2/activate.action?useremail="+userEmail+"'>点击激活</a>", "text/html;charset=UTF-8");
			MimeMultipart mimeMultipart = new MimeMultipart();
			mimeMultipart.addBodyPart(mimeBodyPart);
			msg.setContent(mimeMultipart);
			msg.setHeader("X-Mailer", "smtpsend");
			msg.setSentDate(new Date());
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	public void activate(String userEmail) {
		User u = userDao.selectByUserByUserEmail(userEmail);
		u.setUserState(1);
	}
	
	public void updateUser(User user,User loginUser) {
		User u = userDao.selectByUserId(loginUser.getUserid());
		u.setUsername(user.getUsername());
		u.setUserpwd(user.getUserpwd());
		if(!u.getUseremail().equals(user.getUseremail()))
		{
			sendMailUpdate(user.getUseremail());
		}
		u.setUserAddress(user.getUserAddress());
	}
	
	public void sendMailUpdate(String userEmail) {
		Properties prop = System.getProperties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.host", "smtp.163.com");
		prop.put("mail.smtp.auth", true);
		
		Session session = Session.getInstance(prop, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("javatest2282", "zhangtao123");
			}
		});
		Message msg = new MimeMessage(session);
		try{
			msg.setFrom(new InternetAddress("javatest2282@163.com"));
			msg.addRecipient(Message.RecipientType.TO , new InternetAddress(userEmail));
			msg.setSubject("邮箱激活");
			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			mimeBodyPart.setContent("<a href='http://localhost:8080/cakeshop2/activate.action?useremail="+userEmail+"'>确认更改邮箱</a>", "text/html;charset=UTF-8");
			MimeMultipart mimeMultipart = new MimeMultipart();
			mimeMultipart.addBodyPart(mimeBodyPart);
			msg.setContent(mimeMultipart);
			msg.setHeader("X-Mailer", "smtpsend");
			msg.setSentDate(new Date());
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	public void updateUserEmail(String email,int id) {
		userDao.updateUserEmail(email,id);
	}
}
