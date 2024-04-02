<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="br.com.alfashop.model.Produto" %>
<%@page import="br.com.alfashop.repository.ProdutoDAO" %>
<jsp:useBean class="br.com.alfashop.repository.ProdutoDAO" id="lstpro"/>
<%
// Verificar se sidp é nulo ou vazio antes de tentar convertê-lo para Long
String sidp = request.getParameter("idp");
Long idp = (sidp != null && !sidp.isEmpty()) ? Long.parseLong(sidp) : null;

//produto
ProdutoDAO objdao = new ProdutoDAO();

// Verificar se idp é nulo antes de usar como argumento para buscarPorId

//produto
Produto objpro = (idp != null) ? objdao.buscarPorId(idp) : null;
// Verificar se objpro é nulo antes de acessar suas propriedades
if (objpro != null) {
 //teste para o checked do radio (destaque s ou n)
 String chcksim = "";
   if ("s".equals(objpro.getDestaque())) {
            chcksim = "checked='checked'";
  

    }
    String chcknao = "";
 if ("n".equals(objpro.getDestaque())) {
            chcknao = "checked='checked'";
        }

pageContext.setAttribute("pro", objpro);
pageContext.setAttribute("chcksim", chcksim);
pageContext.setAttribute("chcknao", chcknao);
    
    }

%>

            
        <div class="container">
            <div class="row">
              
            <%@include file="_inc/_menu.jsp" %>                
                
              <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">  
                  <h2>Cadastro de Produtos</h2>
                  <a href="produtos.jsp">&laquo; Voltar para Lista</a>
                </div>
                  
                <form action="produtos-exec" method="post">
                    <input type="hidden" name="action" value="insert">
                    
                    Nome: <br> 
                    <input type="text" name="nom"> 
                    <br><br>
                    
                    Valor: <br> 
                    <input type="text" name="val"> 
                    <br><br>
                    
                    Peso: <br> 
                    <input type="text" name="pes"> 
                    <br><br>
                    
                    Destaque: <br> 
                    <input type="radio" name="dtq" value="s" ${chcksim}> SIM <br>
                    <input type="radio" name="dtq" value="n" ${chcknao}> NÃO
                    <br><br>
                    
                    <br> 
                            <label for="idc">Categoria:</label>
                            <select id="idc" name="idc" required>
                                <option value="1">Amplificador</option>
                                <option value="2">Baixo</option>
                                <option value="3">Guitarra</option>
                                <option value="4">Microfone</option>
                                <option value="5">Bateria</option>
                            </select>
                            
                    
                    <br><br>
                    
                    <button type="submit" class="btn btn-info">Cadastrar</button>                    
                </form> 
                                 
              </main> 
           </div>  
        </div> 
            
    </body>
</html>
