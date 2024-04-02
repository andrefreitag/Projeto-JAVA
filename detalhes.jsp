<%@include file="./_inc/_header.jsp" %>
<!-- banner -->
<%@include file="./_inc/_menu.jsp" %>

<%@page import="java.util.List" %>
<%@page import="br.com.alfashop.model.Produto" %>"
<%@page import="br.com.alfashop.repository.ProdutoDAO" %>"
<%
String filtro = "1 != 1";
Long idp = 0L;

//pegar o parametro "idc" que veio na URL (id da categoria)
if (request.getParameter("idp") != null){
    String sidp = request.getParameter("idp");    
    try {
       idp = Long.parseLong(sidp);
       filtro = "idprodutos = "+idp;
    }catch(Exception e) {}
}
ProdutoDAO daopro = new ProdutoDAO();  
//usar o retorno (lista) para exibir os dados (nesse caso, sem fazer o uso do <jsp:useBean>
List<Produto> lstpro = daopro.buscar(filtro);  
//adicionar o objeto a um atributo da pagina, para ser usado no EL(Expression Language)
pageContext.setAttribute("lstpro", lstpro);
%>

<style>
   /* Estilo personalizado para o botão */
   .btn-custom {
      font-size: 14px;
      padding: 5px 10px;
      margin-top: 10px; /* Adicione uma margem superior para separar o botão dos outros elementos */
   }
</style>

<script>
    function adicionar(idprodutos, nome, valor) {
        // Aqui você pode adicionar a lógica para adicionar o produto ao carrinho
        // Neste exemplo, vamos apenas exibir um alerta com os detalhes do produto
        alert('Produto adicionado ao carrinho:\nID: ' + idprodutos + '\nNome: ' + nome + '\nValor: ' + valor);
    }
</script>

<c:forEach items="${lstpro}" var="objpro">  
    <div class="container px-4 py-4" id="custom-cards">
      <h2 class="pb-2 border-bottom">${objpro.getNome()}</h2>
      <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
      <div class="col">
        ${objpro.getDescricao()}
        <br><br>
        ${objpro.getMaisinfo()}
        <br><br>
        ${objpro.getValor()}
        <br><br>
        <button class="btn btn-primary btn-sm" type="submit" onclick="adicionar('${objpro.getIdprodutos()}', '${objpro.getNome()}', '${objpro.getValor()}')">Adicionar ao carrinho</button>
      </div>      
    </div>
  </div>
</c:forEach>


 <%@include file="./_inc/_footer.jsp" %>

