<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>db 사용하기 - Statement(select)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<div class="container mt-4">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <table class="table table-hover table-striped">
        <thead>번
          <tr>
            <th>아이디</th>
            <th>비밀호</th>
            <th>이름</th>
          </tr>
        </thead>
        <tbody>
        <%
          ResultSet rs = null;
          Statement stmt = null;
          try {
            String sql = "SELECT * FROM member ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
              String userId = rs.getString("id");
              String userPw = rs.getString("passwd");
              String userNm = rs.getString("name");

//              out.println("<tr><td>" + userId + "</td><td>" + userPw + "</td><td>" + userNm + "</td></tr>");
        %>
          <tr>
            <td><%=userId%></td>
            <td><%=userPw%></td>
            <td><%=userNm%></td>
          </tr>
        <%
            }
          }
          catch (SQLException e) {
            out.println("member 테이블의 데이터 조회가 실패했습니다.");
            out.println("SQLException : " + e.getMessage());
          }
          finally {
            if (rs != null) { rs.close(); }
            if (stmt != null) { stmt.close(); }
            if (conn != null) { conn.close(); }
          }
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>

</table>
</body>
</html>






