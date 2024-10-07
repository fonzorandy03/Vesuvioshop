<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.UserBean, model.ProductBean"%>
<% if (session.getAttribute("registeredUser") == null) {
		response.sendRedirect("loginPage.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<title>Vesuvio Shop | Modifica prodotto</title>
    <link rel="stylesheet" href="./css/StyleProdottoModifica.css">
    <link rel="icon" href="./img/icon.png">
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"/>
	</div>
	
	<%	if (request.getAttribute("updateProd") != null) {
			ProductBean bean = (ProductBean) request.getAttribute("updateProd");
			
			String tipologia = bean.getTipologia();
			String tag = bean.getTag();
	%>
	
	<div class="test">
	<div class="container" style="height: 485px">
		<div class="title">Modifica prodotto</div>
		<div class="content">
		<form action="ProductControl?action=modifica&codice=<%=bean.getCodice()%>" METHOD="POST">
			<div class="user-details">
				<div class="input-box">
					<span class="details">Nome prodotto</span>
					<input type="text" name="nome" maxlength="50" placeholder="Inserire nome del prodotto" value="<%=bean.getNome()%>" required/>
				</div>
				<div class="input-box">
					<span class="details">Prezzo</span>
					<input type="number" step="0.01" name="prezzo" max="9999999" value="<%=bean.getPrezzo()%>" placeholder="Inserire prezzo" required/>
				</div>
				<div class="input-box">
					<span class="details">Spese di spedizione</span>
					<input type="number" step="0.01" name="spedizione" max="999" value="<%=bean.getSpedizione()%>" placeholder="Inserire spese di spedizione" required/>
				</div>
				<div class="input-box">
					<span class="details">Tipologia</span>
					<select id="tipologia" name="tipologia" required>
						<% if (tipologia.compareTo("MaglieGara") == 0) { %>
   						<option value="MaglieGara" selected>Maglie Gara</option>
   						<% } else { %>
   						<option value="MaglieGara">Maglie Gara</option>
   						<% } %>
   						<% if (tipologia.compareTo("Gadget") == 0) { %>
   						<option value="Gadget" selected>Gadget</option>
   						<% } else { %>
   						<option value="Gadget">Gadget</option>
   						<% } %>
   						<% if (tipologia.compareTo("Personalizzate") == 0) { %>
   						<option value="Personalizzate" selected>Articoli Personalizzati</option>
   						<% } else { %>
   						<option value="Personalizzate">Articoli Personalizzati</option>
   						<% } %>
  					</select>
				</div>
				<div class="input-box">
					<span class="details">Tag</span>
					<select id="tag" name="tag" required>
						<% if (tag.compareTo("Maglie") == 0) { %>
   						<option value="Maglie" selected>Maglie</option>
   						<% } else { %>
   						<option value="Maglie">Maglie</option>
   						<% } %>
						<% if (tag.compareTo("Personalizzate") == 0) { %>
   						<option value="Personalizzate" selected>Personalizzate</option>
   						<% } else { %>
   						<option value="Personalizzate">Personalizzate</option>
   						<% } %>
   						<% if (tag.compareTo("Sciarpe") == 0) { %>
   						<option value="Sciarpe" selected>Sciarpe</option>
   						<% } else { %>
   						<option value="Sciarpe">Sciarpe</option>
   						<% } %>
   						<% if (tag.compareTo("Tazze") == 0) { %>
   						<option value="Tazze" selected>Tazze</option>
   						<% } else { %>
   						<option value="Tazze">Tazze</option>
   						<% } %>
   						  <% if (tag.compareTo("Vari") == 0) { %>
   						<option value="Vari" selected>Vari</option>
   						<% } else { %>
   						<option value="Vari">Vari</option>
   						<% } %>
  					</select>
				</div>
				<div class="input-box">
					<span class="details">Descrizione</span>
					<textarea id="descrizione" name="descrizione" rows="4" cols="60" style="resize: none; width: 310px; height: 80px" required><%=bean.getDescrizione()%></textarea>
				</div>
			</div>
			<div class="button">
				<input type="submit" name="salva" value="Salva modifiche" style="margin-bottom: 40px">
			</div>
		</form>
		
	</div>
	</div>
	</div>
<% } %>


</body>

</html>