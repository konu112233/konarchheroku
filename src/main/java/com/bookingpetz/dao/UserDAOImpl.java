/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.User;
import com.bookingpetz.util.HibernateUtil;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

    public void save(User u) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            org.hibernate.Transaction tr = session.beginTransaction();
            session.save(u);
            tr.commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
        } finally {
//            session.close();
            //HibernateUtil.getSessionFactory().close();
        }
    }

    public void update(User u) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            org.hibernate.Transaction tr = session.beginTransaction();
            session.update(u);
            tr.commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
        } finally {
//            session.close();
            //HibernateUtil.getSessionFactory().close();
        }
    }

    public void delete(User u) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            org.hibernate.Transaction tr = session.beginTransaction();
            session.delete(u);
            tr.commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
        } finally {
//            session.close();
            //HibernateUtil.getSessionFactory().close();
        }
    }

    public User findById(Integer userId) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        User user = null;
        try {
            session.beginTransaction();
            user = (User) session.get(User.class, userId);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
        } finally {
//            session.close();
            //HibernateUtil.getSessionFactory().close();
        }
        return user;
    }

    public List<User> findAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        List<User> userList = null;
        try {
            org.hibernate.Transaction tr = session.beginTransaction();
            CriteriaQuery cq = session.getCriteriaBuilder().createQuery(User.class);
            cq.from(User.class);
            userList = session.createQuery(cq).getResultList();
            tr.commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
        } finally {
//            session.close();
            //HibernateUtil.getSessionFactory().close();
        }
        return userList;
    }

    public List<User> findByProperty(String propName, Object propValue) {
        List<User> userList = null;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            transaction = session.beginTransaction();
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<User> query = builder.createQuery(User.class);
            Root<User> root = query.from(User.class);
            query.select(root).where(builder.equal(root.get(propName), propValue));
            Query<User> q = session.createQuery(query);
            userList = q.getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
//            session.close();
            //HibernateUtil.getSessionFactory().close();
        }
        return userList;
    }

}
