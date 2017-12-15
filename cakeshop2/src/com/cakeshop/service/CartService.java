package com.cakeshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cakeshop.dao.CartDao;

@Service
@Transactional
public class CartService {
	@Autowired
	private CartDao cartDao;
}
