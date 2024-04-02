<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean class="br.com.alfashop.repository.UsuarioDAO" id="lstusu"/>

        <div class="container">
            <div class="row">
              
            <%@include file="_inc/_menu.jsp" %>                
                
              <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                
                  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h2>Lista de Usuarios</h2>
                    <a href="usuarios-insert.jsp" class="btn btn-info">Cadastrar Usuarios</a>
                  </div> 
                
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead> 
                         <tr>
                        <a href="usuarios-update.jsp"></a>
                            <th scope="col">Cod</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Email</th>
                            <th scope="col">Senha</th>
                            <th scope="col">Opcoes</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${lstusu.usuarios}" var="objusu">
                          <tr>
                            <td>${objusu.idusuarios}</td>
                            <td>${objusu.nome}</td>
                            <td>${objusu.email}</td>
                            <td>${objusu.senha}</td>
                            <td>
                                
                                <a href="#" onclick="atualizarIdu(${objusu.idusuarios})" class="btn btn-warning">[ A ]</a>
                            
                                <form action="usuarios-exec" method="post" id="fdel${objusu.idusuarios}">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="idu" value="${objusu.idusuarios}">
                                    <button class="btn btn-danger" type="button" onclick="avisoDel('${objusu.nome}',${objusu.idusuarios})">[ X ]</button>
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
                function atualizarIdu(idu) {
                    var ok = confirm("Deseja atualizar o usuario com idu=" + idu + " ?");
                    if (ok) {
                        window.location.href = "usuarios-update.jsp?idu=" + idu;
                    }
                }
             
               function avisoDel(nom, idu) {
                    console.log("Função avisoDel chamada com nom = " + nom + " e idu = " + idu);
                    var ok = confirm("Deseja excluir o usuario " + nom + "???");
                    if (ok) {
                        document.getElementById("fdel" + idu).submit();
                    }
                }
            </script>
            
    </body>
</html>
