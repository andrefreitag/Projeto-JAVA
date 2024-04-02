<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean class="br.com.alfashop.repository.ProdutoDAO" id="lstpro"/>
            
        <div class="container">
            <div class="row">
              
            <%@include file="_inc/_menu.jsp" %>                
                
              <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                
              <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">    
                  <h2>Lista dos Produtos</h2>
                  <a href="produtos-insert.jsp" class="btn btn-info">Cadastrar Produtos</a>
              </div> 
                  
                  <div class="table-responsive">
                    <table class="table table-striped table-sm">
                      <thead> 
                         <tr>
                      <a href="produtos-update.jsp"></a>
                            <th scope="col">Cod</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Peso</th>
                            <th scope="col">Destaque</th>
                            <th scope="col">Ativo</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Opcoes</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${lstpro.produtos}" var="objpro">  
                          <tr>
                            <td>${objpro.idprodutos}</td>
                            <td>${objpro.nome}</td>
                            <td>${objpro.valor}</td>
                            <td>${objpro.peso}</td>
                            <td>${objpro.destaque}</td>
                            <td>${objpro.ativo}</td>
                            <td>${objpro.categoriaid}</td>
                            <td>
                                <a href="produtos-update.jsp?idp=${objpro.idprodutos}" class="btn btn-warning">[ A ]</a>
                                

                                <form action="produtos-exec" method="post" id="fdel${objpro.idprodutos}">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="idp" value="${objpro.idprodutos}">
                                    <button class="btn btn-danger" type="button" onclick="avisoDel('${objpro.nome}',${objpro.idprodutos})">[ X ]</button>
                                </form>
                            </td>
                          </tr>
                          </c:forEach> 
                          
                        </tbody>
                    </table>
                </div> 
                
              </main> 
           </div>  
        </div> 
            
           <script type="text/javascript">
                function avisoDel(nom, idp) {
                    var ok = confirm("Deseja excluir o produto "+nom+"???");
                    if (ok) {
                        var div = document.getElementById("fdel"+idp).submit();
                    }
                }
            </script>
    </body>
</html>
