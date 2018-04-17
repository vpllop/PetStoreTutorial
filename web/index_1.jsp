<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 04/04/2018, 10:58:03
    Author     : J746869

https://netbeans.org/kb/docs/javaee/ecommerce/connect-db.html
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/petstore.css">
        <title>The PetStore</title>
    </head>
    <body>
        <div id="main">

            <!-- test to access context parameters -->

            <sql:query var="categories" dataSource="jdbc/petstore">
                SELECT * FROM category
            </sql:query>

            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p>[ welcome text ]</p>
                </div>
            </div>

            <div id="indexRightColumn">
                <c:forEach var="category" items="${categories.rows}">
                    <div class="categoryBox">

                        <a href="category?${category.id}">

                            <span class="categoryLabelText">${category.name}</span>

                            <img src="${initParam.imagesPath}${category.name}.jpg"
                                 alt="${category.name}">
                        </a>
                    </div>
                </c:forEach>
            </div>


        </div>
    </body>
</html>
