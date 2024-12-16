package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Account;

public class AccountDAO {

	public ArrayList<Account> getAllAcoountsBySSNId(String ssnid) throws Exception {
		// TODO Auto-generated method stub
		Connection con = DbCon.getConnection();
		ArrayList<Account> accounts = new ArrayList<Account>();
            PreparedStatement ps = con.prepareStatement("select * from account where customerSSNId  = ?");
            ps.setString(1, ssnid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Account a = new Account();
                a.setAccountNumber(rs.getLong(1));
                a.setCustomerSSNId(Long.parseLong(rs.getString(2)));
                a.setAccountType(rs.getString(3));
                a.setAccountBalance(rs.getDouble(4));
                if(rs.getString(5).equals("Active"))
                    a.setAccountStatus(true);
                else
                    a.setAccountStatus(false);
                accounts.add(a);
                System.out.println(a.isAccountStatus());
            }
            return accounts;
        
		
	}

	public boolean checkAccountBalance(String account, String amount)throws Exception {
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
		ps=con.prepareStatement("select Balance from account where accountNumber = ?");
		ps.setString(1, account);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
		if (rs.getDouble(1) > Double.parseDouble(amount)) {
			System.out.println("Balance is sufficient");
			return true;
		}
		return false;
	}
	return false;
}

	public void transfer(String fromAccount,String toAccount, String amount) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("its happening");
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
			System.out.println("its happening");
			ps = con.prepareStatement("update account set Balance = Balance - ? where accountNumber = ?");
			ps.setString(1, amount);
			ps.setString(2, fromAccount);
			ps.executeUpdate();
			ps = con.prepareStatement("update account set Balance = Balance + ? where accountNumber = ?");
			ps.setString(1, amount);
			ps.setString(2, toAccount);
			ps.executeUpdate();
			ps = con.prepareStatement("select max(transactionId) from transactions");
			ResultSet rs = ps.executeQuery();
			rs.next();
			int transactionId = rs.getInt(1) + 1;
			ps = con.prepareStatement("insert into transactions (transactionId,accountNumber, transactionAmount, transactionType, method) values(?,?, ?, ?, ?)");
			ps.setInt(1, transactionId);
			ps.setString(2,fromAccount);
			ps.setString(3, amount);
			ps.setString(4, "Debit");
			ps.setString(5, "Transfer");
			ps.executeUpdate();
			
			ps = con.prepareStatement("insert into transactions (transactionId,accountNumber, transactionAmount, transactionType, method) values(?,?, ?, ?, ?)");
			ps.setInt(1, transactionId+1);
			ps.setString(2,toAccount);
			ps.setString(3, amount);
			ps.setString(4, "Credit");
			ps.setString(5, "Transfer");
			ps.executeUpdate();
			// TODO Auto-generated catch block
			System.out.println("its happend");
		
	}

	public double getAllAcoountsBalanceBySSNId(long ssnid) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DbCon.getConnection();
		double balance = 0;
		PreparedStatement ps;
		ps=con.prepareStatement("select sum(Balance) from account where customerSSNId = ? group by customerSSNId");
		ps.setLong(1, ssnid);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			balance = rs.getDouble(1);
		}
		return balance;
	}

	public long getMaxAccountNumber() throws Exception {
		// TODO Auto-generated method stub
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
		ps = con.prepareStatement("select max(accountNumber) from account");
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			return rs.getLong(1);
		else
			return 100001;
	}

	public void createAccount(Account a) throws Exception {
		// TODO Auto-generated method stub
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
		ps = con.prepareStatement("insert into account (accountNumber, customerSSNId, accountType, Balance, status) values(?,?,?,?,?)");
		ps.setLong(1, a.getAccountNumber());
		ps.setLong(2, a.getCustomerSSNId());
		ps.setString(3, a.getAccountType());
		ps.setDouble(4, a.getAccountBalance());
		ps.setString(5, "Active");
		ps.executeUpdate();
		System.out.println("Account created successfully");
		
		
	}

	public void doDebit(String accno, String amount) throws SQLException {
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
		ps = con.prepareStatement("update account set Balance = Balance - ? where accountNumber = ?");
		ps.setString(1, amount);
		ps.setString(2, accno);
		ps.executeUpdate();
		ps = con.prepareStatement("select max(transactionId) from transactions");
		ResultSet rs = ps.executeQuery();
		rs.next();
		int transactionId = rs.getInt(1) + 1;
		ps = con.prepareStatement("insert into transactions (transactionId,accountNumber, transactionAmount, transactionType, method) values(?,?, ?, ?, ?)");
		ps.setInt(1, transactionId);
		ps.setString(2,accno);
		ps.setString(3, amount);
		ps.setString(4, "Debit");
		ps.setString(5, "Withdraw");
		ps.executeUpdate();

		
		
	}
	public void doCredit(String accno, String amount) throws SQLException {
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
		ps = con.prepareStatement("update account set Balance = Balance + ? where accountNumber = ?");
		ps.setString(1, amount);
		ps.setString(2, accno);
		ps.executeUpdate();
		ps = con.prepareStatement("select max(transactionId) from transactions");
		ResultSet rs = ps.executeQuery();
		rs.next();
		int transactionId = rs.getInt(1) + 1;
		ps = con.prepareStatement("insert into transactions (transactionId,accountNumber, transactionAmount, transactionType, method) values(?,?, ?, ?, ?)");
		ps.setInt(1, transactionId);
		ps.setString(2,accno);
		ps.setString(3, amount);
		ps.setString(4, "Credit");
		ps.setString(5, "Deposit");
		ps.executeUpdate();
		
	}
	
	
	
	

}
