package com.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	public static SessionFactory getSessionFactory() {
		Configuration cfg = new Configuration();
		cfg.configure();
		return cfg.buildSessionFactory();
	}
}
