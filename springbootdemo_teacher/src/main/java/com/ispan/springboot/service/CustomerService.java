package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.dao.CustomerDao;
import com.ispan.springboot.model.Customer;

@Service
@Transactional
public class CustomerService {
	@Autowired
	private CustomerDao cDao;

	// 登入驗證
	public Customer checkCustomerLogin(String caccount, String cpwd) {
		Customer ca = cDao.findByCustomerAccount(caccount, cpwd);
		return ca;
	}

	public Customer findCustomerAccount(String caccount) {
		Customer ca = cDao.findCustomerAccount(caccount);
		return ca;
	}

	// 註冊
	public void insertCustomer(Customer ct) {
		cDao.save(ct);
	}

	// 找全部
	public List<Customer> findAllCustomer() {
		return cDao.findAll();
	}

	// 找照片
	public Customer getPhotoById(Integer id) {
		Optional<Customer> optional = cDao.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	// 刪除，用不到
	public void deleteCustomer(Integer id) {
		cDao.deleteById(id);
	}

	// 找ID
	public Customer findCustomerById(Integer id) {
		return cDao.getById(id);
	}

	// 模糊搜尋，已被前端取代
	public List<Customer> findSpecialCustomer(String keywords) {
		return cDao.findSpecial(keywords);
	}

	// 忘記密碼寄信
	public Customer forgotPassword(String cAccount, String cEmail) {
		return cDao.findAccountAndEmail(cAccount, cEmail);
	}

	// 找有權
	public List<Customer> findCustomerByTrue() {
		return cDao.findByStatus(true);
	}

	// 找停權
	public List<Customer> findCustomerByFalse() {
		return cDao.findByStatus(false);
	}

	// 找重複註冊
	public List<Customer> findAllByAccount(String cAccount) {
		return cDao.findAllByAccount(cAccount);
	}
}
