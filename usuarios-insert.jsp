<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean class="br.com.alfashop.repository.UsuarioDAO" id="lstusu"/>

        <div class="container">
            <a href="usuarios-insert.jsp"></a>
            <div class="row">
              
            <%@include file="_inc/_menu.jsp" %>                
                
              <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                 
               <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                 <h2>Cadastro de Usuarios</h2>
                 <a href="usuarios.jsp">&laquo; Voltar para Lista</a>
               </div>
                  
                <form action="usuarios-exec" method="post">
                    <input type="hidden" name="action" value="insert">
                    
                    Nome: <br> 
                    <input type="text" name="nom"> 
                    <br><br>
                    
                    Email: <br> 
                    <input type="text" name="ema"> 
                    <br><br>
                    
                    Senha: <br> 
                    <input type="text" name="sen"> 
                    <br><br>
                    
                    <button type="submit" class="btn btn-info">Cadastrar</button>                    
                </form>
                
              </main> 
           </div>  
        </div> 
            
    </body>
</html>
