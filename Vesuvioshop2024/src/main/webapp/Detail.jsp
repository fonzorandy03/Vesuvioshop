<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="model.ProductBean"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vesuvio Shop | Dettagli Prodotto</title>
    <link href="${pageContext.request.contextPath}/css/StyleDettagli1000.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container">
    <%
        ProductBean product = (ProductBean) request.getSession().getAttribute("product");

        if (product != null) {
    %>
    <div class="sproduct">
        <div class="row">
            <div class="col1">
                <img class="imgProduct" src="img/productIMG/<%= product.getImmagine() %>" alt="">
            </div>
            <div class="col2">
                <h3 class="nome"><%= product.getNome() %></h3>
                <p class="desc"><%= product.getDescrizione() %></p>
                <p>Prezzo: &euro;<%= product.getPrezzo() %></p>
                <p>Data di uscita: <%= product.getData() %></p>
                <a href="CartControl?action=aggiungi&codice=<%= product.getCodice() %>">
                    <button class="buy-btn">Aggiungi al carrello</button>
                </a>
            </div>
        </div>
    </div>
    <% } %>
</div>
<script>
    // Seleziona il bottone con la classe "buy-btn"
    const buyButton = document.querySelector('.buy-btn');

    // Aggiungi un event listener per il click
    buyButton.addEventListener('click', function() {
        // Mostra il messaggio pop-up
        alert('Aggiunto al carrello correttamente');
    });
</script>
<jsp:include page="footer.jsp"/>

</body>
</html>

