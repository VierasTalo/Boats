package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vene;
import dao.Dao;


@WebServlet("/PoistaVene")
public class PoistaVene extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PoistaVene() {
        super();
        System.out.println("PoistaVene.PoistaVene()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaVene.doGet()");
		int tunnus = Integer.parseInt(request.getParameter("tunnus"));
		Dao dao = new Dao();
		Vene vene = dao.loytyykoVene(tunnus);
		request.setAttribute("vene", vene);
		String jsp="/poistavene.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaVene.doPost()");
		int tunnus = Integer.parseInt(request.getParameter("tunnus"));
		String nimi = request.getParameter("nimi");
		String merkkimalli = request.getParameter("merkkimalli");
		Double pituus = Double.parseDouble(request.getParameter("pituus"));
		Double leveys = Double.parseDouble(request.getParameter("leveys"));
		int hinta = Integer.parseInt(request.getParameter("hinta"));
		Vene vene = new Vene(tunnus, nimi, merkkimalli, pituus, leveys, hinta);
		Dao dao = new Dao();		
		dao.poistaVene(vene);
		response.sendRedirect("HaeVeneet");		
	}

}
