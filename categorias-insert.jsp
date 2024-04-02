<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean class="br.com.alfashop.repository.CategoriaDAO" id="lstcat"/>

        <div class="container">
            <a href="categorias-insert.jsp"></a>
            <div class="row">
              
            <%@include file="_inc/_menu.jsp" %>                
                
              <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                 
               <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                 <h2>Cadastro de Categorias</h2>
                 <a href="categorias.jsp">&laquo; Voltar para Lista</a>
               </div>
                  
                <form action="categorias-exec" method="post">
                    <input type="hidden" name="action" value="insert">
                    
                    Nome: <br> 
                    <input type="text" name="nom"> 
                    <br><br>
                    
                    Descricao: <br> 
                    <input type="text" name="des"> 
                    <br><br>
                    
                    <button type="submit" class="btn btn-info">Cadastrar</button>                    
                </form>
                
              </main> 
           </div>  
        </div> 
            
    </body>
</html>
