<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.CartBean, model.ProductBean, model.UserBean, java.util.*"%>
<%
	if (session.getAttribute("carrello") == null) {
		CartBean carrello = new CartBean();
		session.setAttribute("carrello", carrello);
	}
%>
<!DOCTYPE html>
<html lang = "it">


<head>
	<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="./css/styleHome.css">
	
	
	
	
	

	<title>Vesuvio Shop | Home</title>
</head>

<body>

		
		    <div class="header">
        <jsp:include page="header.jsp"/>
    </div>
		  <br>
	  <div class="container">
            <div class="product-container">
                <div class="product" style="background-color: #0163a1">
                    <div class="product-left">
                        <img
                            alt="maglietta del napoli"
                            class="block"
                            src="img/homeImg/magliaNapoli.jpg"
                        />
                    </div>
                    <div class="product-right">
                        <div
                            class="product-title"
                            style="font-size: 18px; margin-top: 20px"
                        >
                            Compra le magliette dei tuoi calciatori preferiti
                        </div>
                        <div
                            class="product-button product-button-white"
                            style="margin-top: 40px"
                        >  
                           <a href = "Tipologia?tipologia=MaglieGara"> Acquista ora</a>      
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-container">
                <div class="product" style="background-color: #a1caf1">
                    <div class="product-right">
                        <div
                            class="product-title"
                            style="
                                font-size: 48px;
                                margin-top: 20px;
                                color: #1e3932;
                            "
                        >
                            Crea articoli personalizzati
                        </div>
                        <div class="product-description">
                            E' arrivata finalmente la possibilita'  di personalizzare gli articoli della tua squadra del cuore
                        </div>
                        <div
                            class="product-button product-button-black"
                            style="margin-top: 10px"
                        >
                           <a href="Tipologia?tipologia=Personalizzate" style="color: #FFF; text-decoration: none;">Articoli Personalizzati</a>
                        </div>
                    </div>
                    <div class="product-left">
                        <img
                            alt="maradona"
                            class="block"
                            src="img/homeImg/Maradona.jpg"
                        />
                    </div>
                </div>
            </div>
            <div class="product-container">
                <div class="product" style="background-color: #4882bf">
                    <div class="product-left">
                        <img
                            alt="tazza."
                            class="block"
                            src="img/homeImg/tazza.jpg"
                        />
                    </div>
                    <div class="product-right">
                        <div
                            class="product-title"
                            style="
                                font-size: 48px;
                                margin-top: 60px;
                                color: white;
                            "
                        >
                            Tazze,portachiavi e molto altro
                        </div>
                        <div
                            class="product-description"
                            style="color: white; font-size: 22px"
                        >
                            Gadget del napoli. Tazze, portachiavi, articoli per la casa e tutto cio di cui un vero tifoso ha bisogno
                        </div>
                        <div
                            class="product-button product-button-white"
                            style="margin-top: 10px"
                        >
                           <a href = "Tipologia?tipologia=Gadget" style="color: ##CAF0F8; text-decoration: none;"> Gadget </a>  
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="footer">
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>