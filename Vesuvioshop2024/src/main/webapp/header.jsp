<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="./css/styleHeader1.css"> 
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <header>
        <div class="left-nav">
            <ul>
                <li>
                    <div class="home">
                        <a href="index.jsp"><img src="./img/homeImg/24.PNG"></a>
                       <a class="a-header" href="index.jsp"><b>HOME</b></a>
                    </div>
                </li>
                <li>
                    <div class="cart">
                        <a href="cart.jsp"><img src="./img/icone/Scudetto.png"></a>
                        <a class="a-header" href="cart.jsp"><b>CARRELLO</b></a>
                    </div>
                </li>
                <li>
                    <div class="box">
                        <i class='bx bx-search-alt-2' style='color:#a1caf1'  ></i>
                        <input id="searchbar" name="search" type="search" placeholder="cerca nel catalogo...">
                    </div>
                </li>
            </ul>
        </div>
        
        <div class="logo">
            <img src="./img/homeImg/Vesuvio.png" class="logohome">
        </div>
        
        <div class="right-nav">
            <ul>
                <% if (session.getAttribute("registeredUser") != null) {
                    UserBean bean = (UserBean) session.getAttribute("registeredUser");
                    if (bean.getEmail().compareTo("") != 0) {
                %>
                <%
                    if (bean.getRole().compareTo("admin") == 0) {
                %>
                <li>
                    <div class="account">
                        <a href="admin-hub.jsp"><img src="./img/icone/Napolilogo.png"></a>
                        <a class="a-header" href="admin-hub.jsp" style="color: #0077B6;"><b>ADMIN</b></a>
                    </div>
                </li>
                <%      } else { %>
                <li>
                    <div class="account">
                        <a href="account.jsp"><img src="./img/icone/Napolilogo.png"></a>
                        <a class="a-header" href="account.jsp" style="color:#0077B6 ;"><b>ACCOUNT</b></a>
                    </div>
                </li>
                <%      } %>
                <li>
                    <div class="favs">
                        <a href="preferiti.jsp"><img src="./img/icone/preferiti.png"></a>
                        <a class="a-header" href="preferiti.jsp" style="color: #0077B6;"><b>PREFERITI</b></a>
                    </div>
                </li>
                <%  } else { %>
                <li>
                    <div class="favs">
                        <a href="preferiti.jsp"><img src="./img/icone/preferiti.png"></a>
                        <a class="a-header" href="loginPage.jsp" style="color: #0077B6;"><b>PREFERITI</b></a>
                    </div>
                </li>
                <li>
                    <div class="account">
                        <a href="loginPage.jsp"><img src="./img/icone/Napolilogo.png"></a>
                        <a class="a-header" href="loginPage.jsp" style="color: #0077B6;"><b>ACCEDI</b></a>
                    </div>
                </li>
                <%  } %>
                <%  } else { %>
                <li>
                    <div class="favs">
                        <a href="preferiti.jsp"><img src="./img/icone/preferiti.png"></a>
                        <a class="a-header" href="preferiti.jsp" style="color: #0077B6;"><b>PREFERITI</b></a>
                    </div>
                </li>
                <li>
                    <div class="account">
                        <a href="loginPage.jsp"><img src="./img/icone/Napolilogo.png"></a>
                        <a class="a-header" href="loginPage.jsp" style="color: #0077B6;"><b>ACCEDI</b></a>
                    </div>
                </li>
                <% } %>
            </ul> 
        </div>
    </header>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#searchbar").keyup(function(){
                var x = $("#searchbar").val();
                if(x != ""){
                    $.get("./RicercaProdotto", {"query": x}, function(data){
                        if(data!= ""){
                            $(".risultati").empty();
                            $(".risultati").css({"display" : "block"});
                            $.each(data, function(i, item){
                                $(".risultati").append("<div id='item-r' class='item" + i + "'><img id='pic' width='65' height='65' src='img/productIMG/" + item.immagine + "'/><p id='name'>" + item.nome + "</p></div>");
                                $(".item" + i).click(function(){
                                    $.get("./dettagli23", {"id" : item.codice}, function(){
                                        window.location = "./Detail.jsp";
                                    });
                                });
                            });
                        }
                    });
                } else {
                    $(".risultati").css({"display" : "none"});
                }
            });
        });
    </script>
    
    <div class="risultati"></div>
</body>
</html>
