package test;

import java.sql.Connection;

import model.BoardDAO;

public class Test {

	public static void main(String[] args) {
		BoardDAO boardDAO = new BoardDAO();
		Connection conn = boardDAO.getCon();
	}

}
