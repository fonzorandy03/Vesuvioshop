<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.ProductBean, java.text.DecimalFormat"%>
<% 
	ProductBean prodotto = null;
	if (request.getAttribute("prodottoDettaglio") == null) {
		response.sendRedirect("./ProductControl?action=dettaglio&codice=" + request.getParameter("codice"));	
		return;
	}
	else {
		prodotto = (ProductBean) request.getAttribute("prodottoDettaglio");
	}		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/StyleDettagli1000.css">
<title>Vesuvio Shop | Dettagli Prodotto</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<section class="container sproduct" style="margin-bottom: 190px; margin-top: 120px">
		<div class="row mt-5">
			<div></div>
			<div class="col1">
				<%
					String immagine = "img/productIMG/" + prodotto.getImmagine();
				%>
				<img class="imgProduct" src="<%=immagine%>" alt="">
			</div>
			<div class="col2">
				<h6><%=prodotto.getTipologia()%> / <%=prodotto.getTag() %></h6>
				<h3 class="nome"><%=prodotto.getNome()%></h3>	
				
				<%
					Double tot = prodotto.getPrezzo() + prodotto.getSpedizione();
					DecimalFormat df = new DecimalFormat("0.00");
					String prezzoTot = df.format(tot);
				%>
				<h2><%=prezzoTot%>&euro;</h2>
				<a href="CartControl?action=aggiungi&codice=<%=prodotto.getCodice()%>"><button class="buy-btn" style="margin-bottom: 20px; cursor: pointer">Aggiungi al carrello</button></a>
				<h3 class="desc" style="font-size: 1.3em">Descrizione prodotto  <i class="fa-solid fa-indent" style="color: #000000"></i></h3>
				<p><%=prodotto.getDescrizione()%></p>
			</div>
			<div></div>
		</div>
	</section>
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