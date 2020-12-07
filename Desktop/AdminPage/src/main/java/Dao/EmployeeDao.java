/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Employee;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ASUS
 */
public class EmployeeDao {
    public static Employee getEmployee(int id) {

        Transaction transaction = null;
        Employee emp = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            emp = (Employee) session.get(Employee.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return emp;
    }
    
    public static List < Employee > getAllEmp() {

        Transaction transaction = null;
        List < Employee > listOfUser = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfUser = session.createQuery("from Employee").list();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return listOfUser;
    }
    public static void saveEmp(Employee emp) {
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(emp);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    public static void updateEmp(Employee emp) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(emp);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    // edit 1 số cột
    public static void editEmp(Integer employeeId, String employeeName, String sex, String email, String phone, String address, Integer salary, Date paycheck){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Employee emp=(Employee)session.get(Employee.class, employeeId);
        emp.setEmployeeName(employeeName);
        emp.setEmail(email);
        emp.setPhone(phone);
        emp.setAddress(address);
        emp.setSalary(salary);
        emp.setPaycheck(paycheck);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(emp);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    public static void chamcongEmp(Integer employeeId){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Employee emp=(Employee)session.get(Employee.class, employeeId);
        emp.setWorkdate(emp.getWorkdate()+1);
        Calendar c = Calendar.getInstance();
        c.setTime(new Date()); // Now use today date.
        emp.setLastAtt(c.getTime());
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(emp);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    public static void editattEmp(int inteid,Date pay, int intday,Date last){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Employee emp=(Employee)session.get(Employee.class, inteid);
        emp.setWorkdate(intday);
        emp.setPaycheck(pay);
        emp.setLastAtt(last);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(emp);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    public static void traluongEmp(Integer employeeId){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Employee emp=(Employee)session.get(Employee.class, employeeId);
        emp.setWorkdate(0);
        Calendar c = Calendar.getInstance();
        c.setTime(new Date()); // Now use today date.
        c.add(Calendar.DATE, 30);
        emp.setPaycheck(c.getTime());
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(emp);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    public static void deleteEmp(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Employee emp = session.get(Employee.class, id);
            if (emp != null) {
                session.delete(emp);

            }

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
}
