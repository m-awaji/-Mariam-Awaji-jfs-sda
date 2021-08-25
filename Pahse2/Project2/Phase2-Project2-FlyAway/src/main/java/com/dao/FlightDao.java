package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;


import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.model.Flights;

public class FlightDao {

	public int store(Flights flights) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		int generatedId = 0;
		Transaction tx = session.beginTransaction();
		generatedId = (int)session.save(flights);
		tx.commit();
		session.close();
		factory.close();
		return generatedId;
	}
	
	public List<Flights> getFlights() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session1 = factory.openSession();
		TypedQuery<Flights> query = session1.createQuery("select f from com.model.Flights f", Flights.class);
		List<Flights> flights = query.getResultList();
		session1.close();
		factory.close();
		return flights;
	}
	
	public List<Flights> getAirlines() {
		SessionFactory factory2 = HibernateUtil.getSessionFactory();
		Session session2 = factory2.openSession();
		TypedQuery<Flights> query2 = session2.createQuery("select a from Flights a where a.airline = ?1", Flights.class);
		List<Flights> airlines = query2.getResultList();
		session2.close();
		factory2.close();
		return airlines;
	} 
	
}

