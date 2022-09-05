package com.ispan.springboot.dao;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.springboot.model.Srno;

public interface SrOrderDao extends JpaRepository<Srno, Integer> {
	
	
	@Query(value = "SELECT  * FROM "
			+ "ShoppingRecord  AS SR "
			+ "INNER JOIN Srno  As no "
			+ "ON SR.no = no.noid"
			+ " AND sr.C1_Id= 2000004", nativeQuery = true)
	public Set<Srno> findOrderByCid();	
	
	


}
