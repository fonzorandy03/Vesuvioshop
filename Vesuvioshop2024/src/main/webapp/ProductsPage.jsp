<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.ProductBean, model.UserBean, java.util.*, javax.servlet.RequestDispatcher, java.text.DecimalFormat"%>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./ProductControl");	
		return;
	}
	String tipologia = request.getParameter("tipologia");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vesuvio Shop | Prodotti</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/productlist555.css">
</head>
<body>

	<%	
		if (session.getAttribute("refreshProduct") != null && (Boolean) session.getAttribute("refreshProduct") == true) {
			request.getSession().setAttribute("refreshProduct", false);
	%>
		<script>
			window.location.reload();
		</script>
	<%
		}
	%>
	
	<jsp:include page="header.jsp"/>
	
	<div class="wrapper" style="margin-bottom: 200px">
		<div class="container">
			<div class="heading-title" style="margin-top: 75px">
				<h1 style="font-weight: bold;"><%=tipologia %></h1>
			</div>
			
			
			<div class="item-grid" style="margin-top: 20px">
				
				<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
						Double tot = bean.getPrezzo() + bean.getSpedizione();
						DecimalFormat df = new DecimalFormat("0.00");
						
						String prezzoTot = df.format(tot) + " €";	
						String image = "img/productIMG/" + bean.getImmagine();
				%>
				
				<div class="item">
					<div class="item-img">
						<img src="<%=image%>" alt="img/productIMG/noimg.jpg">
						<div class="item-action">
							<a href="productDetail.jsp?codice=<%=bean.getCodice()%>" class="view">
								<span>
									<i class="fas fa-search-plus"></i>
								</span>
							</a>
							<a href="CartControl?action=aggiungi&codice=<%=bean.getCodice()%>" class="buy">
								<span>
									<i class="fas fa-cart-plus"></i>
								</span>
							</a>
							<% if (session.getAttribute("registeredUser") != null) { %>
							<a href="AggiungiPreferiti?codice=<%=bean.getCodice()%>" class="wishlist">
								<span>
									<i class="fas fa-heart"></i>
								</span>
							</a>
							<% } %>
							<% if (session.getAttribute("registeredUser") != null) {
								UserBean utente = (UserBean) session.getAttribute("registeredUser");
								String ruolo = (String) session.getAttribute("role");
								String emailUtente = (String) session.getAttribute("email");
								if ("admin".equals(ruolo) || bean.getEmail().equals(emailUtente)) {
							%>	
								<a href="ProductControl?action=modificaForm&codice=<%=bean.getCodice()%>" class="upd">
								<span>
									<i class="far fa-edit" style="color: red"></i>
								</span>
								</a>
								
								<a href="ProductControl?action=elimina&codice=<%=bean.getCodice()%>" class="del" onclick="return confirm('Sei sicuro di voler eliminare questo prodotto?');">
								<span>
									<i class="fas fa-trash-alt" style="color: red"></i>
								</span>
								</a>
							<% 
								}
							   }
							%>
						</div>
					</div>
					
					<div class="item-details">
						<ul class="rating">
							<%
							double votazione = bean.getVotazione();
							int count = 0;
							
							while (votazione >= 1) {
								if (votazione >= 2) {
									votazione -= 2;
									count += 1;
							%>
							<li><i class="fas fa-star"></i></li>
							<%  } 
								else if (votazione >= 1) {
									votazione -= 1;
									count += 1;
							%>
							<li><i class="fas fa-star-half-alt"></i></li>
							<% }
							}
							while (count < 5) {
								count++;
							%>
							<li><i class="far fa-star"></i></li>
							<%
							}
							%>
						</ul>
                        <p class="price"><%=prezzoTot%></p>
						<p class="name"><%=bean.getNome()%></p>
					</div>
				</div>
				<% 
						} 
					}
				%>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
	<script>
    let view = document.querySelectorAll('.view');
    let buy = document.querySelectorAll('.buy');
    let wishlist = document.querySelectorAll('.wishlist');
    let del = document.querySelectorAll('.del');

    setContent(view, 'Dettagli', '#005ca9'); // Napoli Calcio Blue
    setContent(buy, 'Aggiungi al carrello', '#005ca9'); // Napoli Calcio Blue
    setContent(wishlist, 'Aggiungi ai preferiti', '#005ca9'); // Napoli Calcio Blue
    setContent(del, 'Elimina prodotto', '#ff0000'); // Red for delete

    function setContent(list, text, color){
        list.forEach((listItem) => {
            listItem.setAttribute('data-before', text);
            listItem.style.color = color; // Change text color
        });
    }
</script>
	
	

</body>
</html>
