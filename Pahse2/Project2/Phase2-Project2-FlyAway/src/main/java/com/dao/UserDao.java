package com.dao;

//import java.sql.SQLException;
//import java.sql.ResultSet;
//import java.sql.Statement;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.User;

public class UserDao  {
		
    public void saveUser(User user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public boolean validate(String userName, String password) {

        Transaction transaction = null;
        User user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            user = (User) session.createQuery("FROM User U WHERE U.username = :userName").setParameter("userName", userName)
                .uniqueResult();

            if (user != null && user.getPassword().equals(password)) {
                return true;
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean changePassword(String userName, String password) {

        Transaction transaction = null;
        User user = null;
        try  (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            user = (User) session.createQuery("FROM User U WHERE U.username = :userName").setParameter("userName", userName)
                .uniqueResult();

            if (user == null || !user.getUsername().equals(userName)) {
                return false;
            }
            user = (User) session.createQuery("update User U set password='"+password+"' where username='"+userName+"'");
    		return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

    
 /* public boolean changeAdminPassword(String userName, String password) {
	  Transaction ts = null;
    	 Statement st=null; 

    	try { Session s = HibernateUtil.getSessionFactory().openSession()) {
    		ts = s.beginTransaction();
    		
			ResultSet rs=st.executeQuery("select * from admin_users where username='"+userName+"'");
    		if(!rs.next()) {
    			return false;
    		}
    	}
    		st.execute("update admin_users set password='"+password+"' where username='"+userName+"'");
    		return true;
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return false;
    }  */
    
}