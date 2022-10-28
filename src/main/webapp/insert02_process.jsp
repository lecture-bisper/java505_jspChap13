<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오전 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>DB사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
  request.setCharacterEncoding("utf-8");

  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userNm = request.getParameter("userName");

  Statement stmt = null;

  try {
    String sql = "INSERT INTO member (id, passwd, name) ";
    sql += "VALUES ('" + userId + "', '" + userPw + "', '" + userNm + "') ";

    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    out.println("member 테이블에 데이터를 추가하였습니다.");
  }
  catch (SQLException e) {
    out.print("member 테이블에 데이터 추가를 실패하였습니다.");
    out.print("SQLException : " + e.getMessage());
  }
  finally {
    if (stmt != null) { stmt.close(); }
    if (conn != null) { conn.close(); }
  }
%>

</body>
</html>






