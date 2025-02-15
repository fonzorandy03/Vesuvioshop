package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import model.CartBean;
import model.CartModel;
import model.PreferitiModel;
import model.ProductBean;
import model.ProductModel;

@WebServlet("/dettagli23")
public class DettagliServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductModel prodDao = new ProductModel();
		
		try {
				int id = Integer.parseInt(request.getParameter("id"));
				request.getSession().removeAttribute("product");
				request.getSession().setAttribute("product", prodDao.TrovaByKey(id));
			
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		/*RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/productDetail.jsp");
		dispatcher.forward(request, response);*/
		response.sendRedirect(request.getContextPath() + "/Detail.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}




