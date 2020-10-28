<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bitcamp.home.BoardDAO"%>
<%@page import="com.bitcamp.home.BoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webJSP/etc/bootstrap.js"></script>

</head>
<body>
	<h1>DBCP(컨넥션풀: DataBase Connection Pool)</h1>
	<div>
		<ol>
		<%
			BoardDAO dao = new BoardDAO();
			List<BoardVO> list = dao.getAllselect();
			
			for(int i=0; i<list.size(); i++){
				BoardVO vo = list.get(i);
				%>
					<li><%=vo.getNo() %>, <%=vo.getUserid() %>, <%=vo.getSubject() %></li>
				<%
			}
			
		%>
		</ol>
	</div>
</body>
</html>
<!-- 
	DBCP 설정하기
	1. Framework 준비하기
	 http://commons.apache.org에서 다운로드 한다.
	 
	 dbcp -> downloads -> commons-dbcp2-2.8.0-bin.zip 다운로드
	 Collection -> downloads now -> commons-collections4-4.4-bin.zip 다운로드
	 Pool -> downloads-> Apache Commons Pool Downloads page-> commons-pool2-2.9.0-bin.zip 다운로드
	 
	 2. http://www.oracle.com에서
	 	ojdbc6.jar
	 
	 3. 이클립스의 WEB-INF/lib, 톰캣/lib에서 복사
		 commons-collections4-4.4.jar
		 commons-dbcp2-2.8.0.jar
		 commons-pool2-2.9.0.jar
		 ojdbc6.jar
		 
	4. CLASSPATH 설정
		commons-collections4-4.4.jar
		commons-dbcp2-2.8.0.jar
		commons-pool2-2.9.0.jar
		ojdbc6.jar
		
	5. 톰캣서버의 conf\server.xml의 <GlobalNamingResources>태그 사이에 추가		
		name : db안에서 프로그램에서 쓰는 이름
		maxActive: 최대연결
		maxIdle: 노는
		maxWait:기다리는 수
		<Resource
			name="jdbc/myoracle"
			auth="container"
			type="javax.sql.DataSource"
			driverClassName="oracle.jdbc.driver.OralcleDriver"
			url="jdbc:oracle:thin:@loaclhost:1521:xe"
			username="scott"
			password="tiger"
			maxActive="20"
			maxIdle="10"
			maxWait="-1"/>
		
	6. 톰캣 서버의 conf/context.xml의 <Context reloadable="true">태그에 추가
		<ResourceLink
			global="jdbc/myoracle"
			name="jdbc/myoracle"
			type="oracle.jdbc.pool.OracleDataSource"/>
	
	7. 이클립스의 WEB-INF/web.xml의 <web-app>태그에 추가
		<resource-ref>
		  	<description>Oracle Datasource example</description>
		  	<res-ref-name>jdbc/myoracle</res-ref-name>
		  	<res-type>javax.sql.DataSource</res-type>
		  	<res-auth>Container</res-auth>oracle.jdbc.pool.
		  </resource-ref>	
	8. 톰캣의 conf/context.xml을 이클립스의  META-INF에 복사
		톰캣서버의 conf/server.xml수정 내용을 복붙
		<Resource
			name="jdbc/myoracle"
			auth="container"
			type="javax.sql.DataSource"
			driverClassName="oracle.jdbc.driver.OralcleDriver"
			url="jdbc:oracle:thin:@loaclhost:1521:xe"
			username="scott"
			password="tiger"
			maxActive="20"
			maxIdle="10"
			maxWait="-1"/>
	
 -->