<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Mini"%>
<%@page import="dao.MiniDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>
<%@include file="cabecalho.jsp"%>

<% 
    
    MiniDAO dao = new MiniDAO();
    List<Mini> lista;
    
   FuncionarioDAO dao2 = new FuncionarioDAO();
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    // verifico se é excluir
        if(request.getParameter("codigo") != null){
            Mini obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
    
    

%>

<div>
    <h1>Reservas do Mini Auditório</h1>

</div>
   <td><a href="Mini.jsp"  class="btn  btn-primary btn-sm">Novo Registro</a>
    </td>

</div><br/>



 <div class="table-responsive">
        <div class="panel panel-default">
        <form action="#" method="post">
           
        </form>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        
                        <th>Data</th>
                        <th>Horário</th>
                        <th>Responsável</th>
                        <th>Ações</th>
                       
                                                
                    </tr>
                </thead>
                <tbody>
                     <%for(Mini item: lista)
                    {
                    %>
                    <tr>
                        
                        <td><%=StormData.formata(item.getMindata()) %></td>
                        <td><%=item.getMinhorario()%></td>
                        <td><%
                            Funcionario f = dao2.buscarPorChavePrimaria(Integer.parseInt(item.getMinresponsavel()));
                            out.print(f);
                            
                            %></td>
                                              
                       
                        <td><a href="updMini.jsp?codigo=<%=item.getIdmini()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                    onclick="codigo=<%=item.getIdmini()%>">Excluir</button>  
                        </td>

                        
                    </tr>
                    <% } %>
                </tbody>
                        
                        
                    
                
            </table>
           
                <!-- /.table-responsive -->
            </div>
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
        document.location.href = "indexMini.jsp?codigo="+codigo;
    }
</script>

<%@include file="rodape.jsp"%> 