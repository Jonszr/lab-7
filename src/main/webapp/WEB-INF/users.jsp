<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>


        <div class='container'> 
            <div class='row'>

                <h1>Zhenrong's User Management System</h1>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>E-mail</th>
                            <th>First Name</th>
                            <th>Last Name</th>   
                            <th>Active</th> 
                            <th>Role</th>
                            <th>Actions</th>  
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.email}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.active ? "Y" : "N"}</td>
                                <td>${user.role.name}</td>
                                <td>
                                    <form action ="user" method="post">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="email" value="${user.email}">
                                        <button type="submit" class="btn btn-primary mb-3">delete</button>
                                    </form>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                
                <h2>Add user</h2>
                <form action="user" method="post" class="row g-3">
                    <input type="hidden" name="action" value="add">

                    <label for="email" class="form-control">E-mail</label>
                    <input type="text" name="email" id="email">
                    <br>
                    <label for="first" class="form-control">First Name</label>
                    <input type="text" name="first" id="first">
                    <br>
                    <label for="last" class="form-control">Last Name</label>
                    <input type="text" name="last" id="last">
                    <br>
                    <label for="password" class="form-control">Password</label>
                    <input type="text" name="password" id="password">
                    <br>
                    <label for="role" class="form-control">Role</label>
                    <select name="role" id="role">
                        <option value="1">System Admin</option>
                        <option value="2">Regular User</option>
                        <option value="3">Company Admin</option>
                    </select>
                    <br>
                    <button type="submit" class="btn btn-primary mb-3">Add</button>
                </form>

                <h2> Edit user </h2>
                <form action="user" method="post" class="row g-3">
                    <input type="hidden" name="action" value="edit">
                    <label for="email" class="form-control">E-mail</label>
                    <input type="text" name="email" id="email">
                    <br>
                    
                    <label for="first" class="form-control">First Name</label>
                    <input type="text" name="first" id="first">
                    <br>
                    
                    <label for="last" class="form-control">Last Name</label>
                    <input type="text" name="last" id="last">
                    <br>
                    
                    <label for="password" class="form-control">Password</label>
                    <input type="text" name="password" id="password">
                    <br>
                    
                    <label for="role" class="form-control">Role</label>
                    
                    <select name="role" id="role">
                        <option value="1">System Admin</option>
                        <option value="2">Regular User</option>
                        <option value="3">Company Admin</option>
                    </select>
                    <br>
                    <button type="submit" class="btn btn-primary mb-3">Edit</button>
                </form>
            </div>
    </body>
</html>