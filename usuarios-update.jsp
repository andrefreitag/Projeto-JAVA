<%@include file="_inc/_verificasession.jsp" %>
<%@include file="_inc/_header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="br.com.alfashop.model.Usuario" %>
<%@page import="br.com.alfashop.repository.UsuarioDAO" %>
<%
String sidu = request.getParameter("idu");
Long idu = Long.parseLong(sidu);
UsuarioDAO objdao = new UsuarioDAO();
Usuario objusu = objdao.buscarPorId(idu);

//teste para o checked do radio (ativo s ou n)
//String chksim = "";
//if (objcat.getAtivo().equals("s")) {
  //  chksim = "checked='checked'";
   // }
//String chknao = "";
//if (objcat.getAtivo().equals("n")) {
  //  chknao = "checked='checked'";
   // }

//pageContext.setAttribute("cat", objcat);
//pageContext.setAttribute("chksim", chksim);
//pageContext.setAttribute("chknao", chknao);
%>


        <div class="container">
            <div class="row">
              
            <%@include file="_inc/_menu.jsp" %>                
                
              <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                 
               <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                 <h2>Atualização dos Usuarios</h2>
                 <a href="usuarios.jsp">&laquo; Voltar para Lista</a>
               </div>
                  
               <a href="usuarios.jsp">&laquo; Voltar para Lista</a>
    <div>
        <form action="usuarios-exec" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="idu" id="iduInput" value="1">

            Nome: <br>
            <input type="text" name="nom" id="nomeInput">  
            <br><br>

            Email: <br>
            <input type="text" name="ema" id="emailInput">  
            <br><br>

            Senha: <br>
            <input type="text" name="sen" id="senhaInput">  
            <br><br>

            <button type="submit">Atualizar</button>
        </form>
    </div>

    <script>
        // Extrai o valor do idu da URL
        var idu = parseInt(new URLSearchParams(window.location.search).get('idu'));

        // Atualiza o valor do input "idu"
        document.getElementById('iduInput').value = idu;

        // Lógica para carregar os dados do usuário com base no idu
        // Substitua isso com a lógica adequada do seu backend (Java)
        if (idu === 1) {
            document.getElementById('nomeInput').value = "Nome do Usuário 1";
            document.getElementById('emailInput').value = "usuario5@alfashop.com.br";
            document.getElementById('senhaInput').value = "senhaUsuario5";
        }
    </script>
            
    </body>
</html>
