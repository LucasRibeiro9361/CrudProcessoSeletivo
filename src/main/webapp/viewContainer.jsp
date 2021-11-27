<%@page import="com.crudProject.dao.ContainerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.crudProject.bean.*, com.crudProject.dao.*, java.util.*" %>

<%
	if( request.getParameter("container") != null){
		Container container = new Container(
				request.getParameter("container"),
				request.getParameter("cliente"),
				Integer.parseInt(request.getParameter("tipo")),
				Integer.parseInt(request.getParameter("status")),
				Integer.parseInt(request.getParameter("categoria"))
				);
		ContainerDao.insert(container);
	}

	if(request.getParameter("idDel") != null){
		ContainerDao.delete(request.getParameter("idDel"));
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body>
<nav>
	<div class="nav-wrapper">
	<ul>
		<li><a href="viewContainer">Containers</a></li>
		<li><a href="viewMovimentacao">Movimentacao</a></li>
		<li></li>
	</ul>
	</div>
</nav>

<div class ="container">
	<div class ="row">
		<div class="col s6">
			<form>
				<div class="input-field col s10">
					<input type="text" id="nm_container" name="container" required pattern="[A-Z]{4}[0-9]{7}">
					<label class="active" for="nm_container">Numero conteiner</label>
				</div>
				<div class="input-field col s6">
					<input type="text" id="client" name="cliente" required class ="validade">
					<label class="active" for="client">Cliente</label>
				</div>
				<div class="input-field col s4">
					<select name="tipo">
						<option value ="1">20</option>
						<option value ="0">40</option>
					</select>
					<label>Tipo</label>
				</div>
				<div class ="input-field col s5">
					<select name ="status">
						<option value="1">Cheio</option>
						<option value="0">Vazio</option>
					</select>
				</div>
				<div class ="input-field col s5">
					<select name ="categoria">
						<option value="1">Importacao</option>
						<option value="0">Exportacao</option>
					</select>
				</div>
				<div class="align-center col s3">
					<input type="submit" class="btn green" value="Inserir"> 
				</div>
				
			</form>
		</div>
		<div class="col s6">
			<table class="highlight">
				<tr>
					<th>ContainerID</th>
					<th>Cliente</th>
					<th>Tipo</th>
					<th>Status</th>
					<th>Categoria</th>
					<th> </th>
					<th> </th>
				</tr>
				<% for( Container c: ContainerDao.getAllContainers() ){ %>
					<tr>
						<td><%= c.getNmContainer() %></td>
						<td><%= c.getCliente() %></td>
						<td><%= c.getTipo() == 1 ? "20" : "40" %></td>
						<td><%= c.getStatus() == 1 ? "cheio" : "vazio" %></td>
						<td><%= c.getCategoria() == 1 ? "Importacao" : "Exportacao" %></td>
						<form>
							<input type="hidden" name="id" value="<%= c.getNmContainer() %>">
							<td> <input type="submit" class="btn green" value="editar"></td>
						</form>
						<form>
							<input type="hidden" name="idDel" value="<%= c.getNmContainer() %>">
							<td> <input type="submit" class="btn green" value="Excluir"></td>
						</form>
					</tr>
				<% } %>
			</table>
		</div>
	</div>
</div>
</body>

<script >
$(document).ready(function(){
    $('select').formSelect();
});
</script>
</html>