package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Transaction;

public class TransactionDAO {

	public List<Transaction> getTransactionsByAccountId(long accountNumber) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DbCon.getConnection();
		List<Transaction> transactions = new ArrayList<Transaction>();
		String query = "select * from transactions where accountNumber = ?";
		PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setLong(1, accountNumber);
        ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Transaction t = new Transaction();
                t.setTransactionId(rs.getLong(1));
                t.setAccountNumber(rs.getLong(2));
                t.setTransactionType(rs.getString(4));
                t.setTransactionAmount(rs.getDouble(3));
                t.setTransactionMode(rs.getString(5));
                transactions.add(t);
            }
            return transactions;
        
		
	}

}
