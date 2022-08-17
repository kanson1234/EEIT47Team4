package com.ispan.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.springboot.model.Message;

public interface MessageDao extends JpaRepository<Message, Integer> {

}


