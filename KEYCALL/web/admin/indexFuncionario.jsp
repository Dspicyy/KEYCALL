<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>
<%@include file="cabecalho.jsp"%>

<% 
    
    FuncionarioDAO dao = new FuncionarioDAO();
    List<Funcionario> lista;
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    // verifico se é excluir
        if(request.getParameter("codigo") != null){
            Funcionario obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listarLimit();
    }
    
    

%>

<div>
    <h1>Funcionários Cadastrados</h1>

</div>
   <td><a href="addFuncionario.jsp" class="btn  btn-primary btn-sm">Novo Cadastro</a>
    </td>

</div><br/>


 <div class="table-responsive">
        <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite o funcionário desejado...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        
                        <th>Nome</th>
                        <th>Cargo</th>
                        <th>Ações</th>
                                                
                    </tr>
                </thead>
                <tbody>
                     <%for(Funcionario item: lista)
                    {
                    %>
                    <tr>
                        
                        <td><%=item.getFuncnome()%></td>
                        <td><%=item.getFunccargo()%></td>
                        
                       
                        <td><a href="updFuncionario.jsp?codigo=<%=item.getIdfunc()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                    onclick="codigo=<%=item.getIdfunc()%>">Excluir</button>  
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
        document.location.href = "indexFuncionario.jsp?codigo="+codigo;
    }
</script>

<%@include file="rodape.jsp"%> 