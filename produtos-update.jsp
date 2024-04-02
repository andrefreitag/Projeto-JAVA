<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="br.com.alfashop.model.Produto" %>
<%@page import="br.com.alfashop.repository.ProdutoDAO" %>

<%
    //try {
        String sidp = request.getParameter("idp");
        Long idp = Long.parseLong(sidp);
        ProdutoDAO objdao = new ProdutoDAO();
        Produto objpro = objdao.buscarPorId(idp);

       String chksim = (objpro.getDestaque() != null && objpro.getDestaque().equals("s")) ? "checked='checked'" : "";
       String chknao = (objpro.getDestaque() != null && objpro.getDestaque().equals("n")) ? "checked='checked'" : "";



pageContext.setAttribute("pro", objpro);
pageContext.setAttribute("chksim", chksim);
pageContext.setAttribute("chknao", chknao);
%>

<div class="container">
    <div class="row">
        <%@include file="_inc/_menu.jsp" %>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Atualização dos Produtos</h2>
                <a href="produtos.jsp">&laquo; Voltar para Lista</a>
            </div>
            <form action="produtos-exec" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="idp" value="${pro.idprodutos}">
                Nome: <br>
                <input type="text" name="nom" value="${pro.nome}">
                <br><br>
                Valor: <br>
                <input type="text" name="val" value="${pro.valor}">
                <br><br>
                Peso: <br>
                <input type="text" name="pes" value="${pro.peso}">
                <br><br>
                Destaque: <br>
                <input type="radio" name="dtq" value="s" ${chksim}> SIM <br>
                <input type="radio" name="dtq" value="n" ${chknao}> NÃO
                <br><br>
                <button type="submit" class="btn btn-info">Atualizar</button>
            </form>
        </main>
    </div>
</div>
</body>
</html>