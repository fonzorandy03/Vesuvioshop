<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.UserBean"%>
<% if (session.getAttribute("registeredUser") == null) {
    response.sendRedirect("loginPage.jsp");
    return;
} %>
<jsp:useBean id="registeredUser" class="model.UserBean" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vesuvio Shop | Account</title>
<link rel="stylesheet" href="./css/StyleAccount.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
        <jsp:include page="header.jsp"/>
    </div>

    <div class="main-content">
        <div class="container">
            <div class="title">Informazioni Account</div>
            <div class="content">
                <form action="AccountSettings" method="POST">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">E-mail</span>
                            <input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email non valida" maxlength="50" value="<jsp:getProperty name='registeredUser' property='email'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">Nome</span>
                            <input type="text" name="nome" maxlength="50" value="<jsp:getProperty name='registeredUser' property='nome'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">Cognome</span>
                            <input type="text" name="cognome" maxlength="50" value="<jsp:getProperty name='registeredUser' property='cognome'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">Indirizzo</span>
                            <input type="text" name="indirizzo" maxlength="50" value="<jsp:getProperty name='registeredUser' property='indirizzo'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">Numero di telefono</span>
                            <input type="text" name="telefono" pattern="[0-9]{10,15}" title="Inserisci un numero di telefono di 10-15 cifre" value="<jsp:getProperty name='registeredUser' property='telefono'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">Numero carta di credito</span>
                            <input type="text" name="carta" pattern="[0-9]{16}" title="Inserisci un numero valido di 16 cifre" value="<jsp:getProperty name='registeredUser' property='numero'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">Intestatario</span>
                            <input type="text" name="intestatario" maxlength="50" value="<jsp:getProperty name='registeredUser' property='intestatario'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                        <div class="input-box">
                            <span class="details">CVV</span>
                            <input type="text" name="cvv" pattern="[0-9]{3}" title="Inserisci un numero di 3 cifre" value="<jsp:getProperty name='registeredUser' property='cvv'/>" <%= registeredUser.getRole().equals("cliente") ? "readonly" : "" %>>
                        </div>
                    </div>
                    <div class="button-container">
                        <% if (!registeredUser.getRole().equals("Cliente")) { %>
                            <input type="submit" name="salva" value="Salva informazioni" class="button">
                        <% } %>
                        <input type="submit" class="button ordini" name="ordini" value="Lista ordini">
                        <% if (registeredUser.getRole().equals("Venditore")) { %>
                            <input type="submit" class="button vendi" name="vendi" value="Vendi un prodotto">
                        <% } %>
                        <input type="submit" name="logout" value="Logout" class="button">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>

