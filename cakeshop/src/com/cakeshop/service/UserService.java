package com.cakeshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cakeshop.bean.User;
import com.cakeshop.dao.UserDao;

@Service("userService")
public class UserService {

	@Autowired
    private UserDao userdao;
    
    @Transactional(readOnly=true)
    public User login(String userName) {
        return userdao.selectByUserName(userName);
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
}
