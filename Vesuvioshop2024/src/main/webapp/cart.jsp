<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.CartBean, model.ProductBean, java.text.DecimalFormat, java.util.*"%>    
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/StyleCart22.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer">
<title>Vesuvio Shop | Carrello</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="cart-container">

<div class="small-container cart-page">
	<table>
		<tr>
			<th>Immagine</th>
			<th>Prodotto</th>
			<th>Prezzo</th>
			<th>Costo spedizione</th>
			<th>Quantità</th>
			<th>Rimuovi</th>
			<th>Subtotal</th>
		</tr>
		<%
		Collection<ProductBean> carrello = null;
		double somma = 0;
		DecimalFormat df = new DecimalFormat("0.00");

		if (session.getAttribute("carrello") != null) {
			CartBean cart = (CartBean) session.getAttribute("carrello");
			carrello = cart.getCarrello();
		}

		if (carrello != null && carrello.size() != 0) {
			Iterator<?> it = carrello.iterator();
			while (it.hasNext()) {
				ProductBean bean = (ProductBean) it.next();
				
				Double price = bean.getPrezzo();
				String prezzo = df.format(price);
			
				Double sped = bean.getSpedizione();
				String spedizione = df.format(sped);
			
				Double tot = (bean.getPrezzo() + bean.getSpedizione()) * bean.getQuantity();
				String prezzoTot = df.format(tot);
				somma += tot;
			
				String image = "img/productIMG/" + bean.getImmagine();
		%>
		<tr>
			<td>
				<div class="cart-info">
					<img src="<%=image%>" alt="<%=bean.getNome()%>">
				</div>
			</td>
			<td><%=bean.getNome()%></td>
			<td class="price"><%=prezzo%> &euro;</td>
			<td class="shipping"><%=spedizione%> &euro;</td>
			<td>
				<div class="quantity-control">
					<a href="CartControl?action=diminuisci&codice=<%=bean.getCodice()%>"><i class="fas fa-minus"></i></a>
					<input type="number" value="<%=bean.getQuantity()%>" min="1" max="99" readonly>
					<a href="CartControl?action=aumenta&codice=<%=bean.getCodice()%>"><i class="fas fa-plus"></i></a>
				</div>
			</td>
			<td><a href="CartControl?action=rimuovere&codice=<%=bean.getCodice()%>" class="remove-link"><i class="fas fa-trash-alt"></i></a></td>
			<td class="product-total"><%=prezzoTot%> &euro;</td>
		</tr>
		<% 		}
			}
		%>
	</table>

<%  String totale = df.format(somma);
	if (!carrello.isEmpty()) {
%>
<div class="total-price">
	<table>
		<tr>
			<td>Totale</td>
			<td><%=totale%> &euro;</td>
		</tr>
	</table>
</div>
<%
	if (session.getAttribute("registeredUser") != null) {
%>
<div class="button-buy-container">
	<a href="OrderControl"><button class="buy-button">PROCEDI ALL'ACQUISTO</button></a>
</div>
<% 	}
	else {
%>
<div class="button-buy-container">
	<a href="loginPage.jsp"><button class="buy-button">REGISTRATI PER ACQUISTARE</button></a>
</div>
<%
	}
%>
<% }
   else {
%>
<div class="total-price empty-cart-message">
	<p>Carrello vuoto! Inserisci un prodotto per continuare</p>
</div>
<% }
%>

</div>
</section>

<jsp:include page="footer.jsp"/>

</body>
</html>
    