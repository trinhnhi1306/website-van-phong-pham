package ptithcm.accessgoogle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginGoogleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		} else {
			String accessToken = GoogleUtils.getToken(code);
			GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
			request.setAttribute("idGoogle", googlePojo.getId());
			request.setAttribute("pictureGoogle", googlePojo.getPicture());
			request.setAttribute("emailGoogle", googlePojo.getEmail());
		
			System.out.println(googlePojo.getId());
			System.out.println(googlePojo.getName());
			System.out.println(googlePojo.getEmail());
			System.out.println(googlePojo.getFamily_name());
			System.out.println(googlePojo.getGiven_name());
			System.out.println(googlePojo.getLink());
			System.out.println(googlePojo.getPicture());
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}