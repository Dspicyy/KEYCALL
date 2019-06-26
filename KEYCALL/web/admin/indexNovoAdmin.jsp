<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="cabecalho.jsp"%>

<% 
    
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista;
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    // verifico se é excluir
        if(request.getParameter("codigo") != null && Integer.parseInt(request.getParameter("codigo")) != 1 ){
            Usuario obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
    
    

%>

<div>
    <h1>Administradores Cadastrados</h1>

</div>
   <td><a href="addNovoAdmin.jsp" class="btn  btn-primary btn-sm">Novo Cadastro</a>
    </td>

</div><br/>


 <div class="table-responsive">
     
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        
                        <th>Tipo</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Ações</th>
                        
                    </tr>
                </thead>
                <tbody>
                     <%for(Usuario item: lista)
                    {
                    %>
                    <tr>
                        
                        <td><%=item.getUsutipo()%></td>
                        <td><%=item.getUsoemail()%></td>
                        <td><%=item.getUsocpf()%></td>
                        
                       
                        <td><a href="updNovoAdmin.jsp?codigo=<%=item.getIduso()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                    onclick="codigo=<%=item.getIduso()%>">Excluir</button>  
                        </td>

                        
                    </tr>
                    <% } %>
                </tbody>
                        
                        
                    
                
            </table>
           
                <!-- /.table-responsive -->
            </div>
 


                    <!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
            </div>
            <div class="modal-body">
                Tem certeza que deseja excluir?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="excluir()">Confirmar Exclusão</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script>
    var codigo;
    function excluir(){
        document.location.href = "indexNovoAdmin.jsp?codigo="+codigo;
    }
</script>
                    
<%@include file="rodape.jsp"%> 