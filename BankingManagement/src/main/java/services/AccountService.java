package services;

import java.util.*;

import dao.AccountDAO;
import dao.CustomerDAO;
import dao.TransactionDAO;
import models.Account;
import models.Customer;
import models.Transaction;

public class AccountService {
	
	public static ArrayList<Account> getAllAcoountsBySSNId(String ssnid){
		ArrayList<Account> accounts = new ArrayList<Account>();
        AccountDAO dao = new AccountDAO();
        try {
			accounts = dao.getAllAcoountsBySSNId(ssnid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return accounts;
    }
	
	public static double getAllAcoountsBalanceBySSNId(long ssnid){
		double balance = 0;
        AccountDAO dao = new AccountDAO();
        try {
        	 balance = dao.getAllAcoountsBalanceBySSNId(ssnid);
        	}
        catch (Exception e) { 
        	e.printStackTrace();
        	                    	            
        }
        return balance;
    }

	public static List<Transaction> getTransactionsByAccountId(long accountNumber) {
		List<Transaction> transactions = new ArrayList<Transaction>();
		TransactionDAO dao = new TransactionDAO();
		try {
			transactions = dao.getTransactionsByAccountId(accountNumber);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transactions;
	}

	public static int transfer(String fromAccount,String toAccount, String amount,String ssnId,boolean role) {
		// TODO Auto-generated method stub
		
		AccountDAO accountDAO = new AccountDAO();
		AccountDAO dao = new AccountDAO();
		if(fromAccount.equals(toAccount)) {return -2;}
		if(Double.parseDouble(amount) <= 0) {return -3;}
		if(!role) {
		List<Account> a=null;
		try {
			a = accountDAO.getAllAcoountsBySSNId(ssnId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long from=Long.parseLong(fromAccount);
        if(a.stream().filter(x->x.getAccountNumber()==from).count()==0) {return -4;}

		}
		
		try {
			if (!dao.checkAccountBalance(fromAccount,amount)) {
				return -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			dao.transfer(fromAccount,toAccount, amount);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
		
	}

	public long getMaxAccountNumber() {
		AccountDAO dao = new AccountDAO();
		try {
			return dao.getMaxAccountNumber();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return -1;
	}

	public int createAccount(Account a) {
		// TODO Auto-generated method stub
		AccountDAO dao = new AccountDAO();
		try {
			dao.createAccount(a);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int doDebit(String accno, String amount) {
		// TODO Auto-generated method stub
		AccountDAO dao=new AccountDAO();
		try{
			if (!dao.checkAccountBalance(accno,amount)) {
				return -2;
			}
			
			dao.doDebit(accno, amount);
			return 1;
			
			
		}
		catch(Exception e){e.printStackTrace();return -1;}
	}
	public int doCredit(String accno, String amount) {
		// TODO Auto-generated method stub
		AccountDAO dao=new AccountDAO();
		try{
			dao.doCredit(accno, amount);
			return 1;
		}
		catch(Exception e){e.printStackTrace();return -1;}
	}
	
	
	}

