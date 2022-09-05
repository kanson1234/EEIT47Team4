package com.ispan.springboot.dao;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.springboot.model.Srno;

public interface SrOrderDao extends JpaRepository<Srno, Integer> {
	
	
	@Query(value = "SELECT  * \r\n"
			+ "FROM\r\n"
			+ "ShoppingRecord  AS SR \r\n"
			+ "INNER JOIN\r\n"
			+ "Srno  As no \r\n"
			+ "ON SR.no = no.noid \r\n"
			+ "AND sr.C1_Id= :c1id order By no.noid DESC", nativeQuery = true)
	public Set<Srno> findOrderByCid(@Param("c1id") Integer c1id);	
	
	


}
