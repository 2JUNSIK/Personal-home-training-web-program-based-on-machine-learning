package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.WorkOutDAO;
import com.model.WorkOutDTO;

public class legCon implements ICommand{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		WorkOutDAO dao = new WorkOutDAO();
		ArrayList<WorkOutDTO> arr = dao.legList();
		session.setAttribute("legList", arr);
	}
}
