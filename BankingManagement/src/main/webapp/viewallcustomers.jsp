<%@ page language="java" import="java.util.*, com.example.model.Customer, com.example.service.CustomerService" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View All Customers</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Customer List</h1>
    <%
        // Create CustomerService object
        CustomerService customerService = new CustomerService();
        // Call the method to get the list of customers
        List<Customer> customers = customerService.getAllCustomers();
    %>
    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Customer customer : customers) {
            %>
            <tr>
                <td><%= customer.getCustomerId() %></td>
                <td><%= customer.getName() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getPhone() %></td>
                <td><%= customer.getAddress() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
