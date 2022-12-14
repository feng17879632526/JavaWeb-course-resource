<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 86178
  Date: 2021/11/14
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:E:\\Java Workspace\\实验六\\实验六  JSP+JDBC开发\\bookstore.db";
    String sql = "select id,name,author,price,image,description,category_id from book" +
            " where category_id = ?";
    String categoryID = request.getParameter("id");
    Connection conn = DriverManager.getConnection(url);
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1, categoryID);
    ResultSet rs = pstat.executeQuery();
    while (rs.next()) {
%>
<div class="col-sm-9 col-md-3" >
    <div class="thumbnail" ><img src="images/book.jpg">
        <div class="caption"><h4>
            <%=rs.getString("name")%>
        </h4>
            <p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 3;overflow: hidden;">
                <%=rs.getString("description")%>
            </p>
            <p><a href="#" class="btn btn-primary" role="button">加入购物车</a> <a href="#" class="btn btn-default"
                                                                              role="button">查看详情
            </a></p></div>
    </div>
</div>
<%
    }
    pstat.close();
    conn.close();
%>
</body>

</html>
