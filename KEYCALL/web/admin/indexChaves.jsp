<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Chave"%>
<%@page import="dao.ChaveDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>

<%@include file="cabecalho.jsp"%>

<% 
    
    ChaveDAO dao = new ChaveDAO();
    List<Chave> lista;
    
    FuncionarioDAO dao2 = new FuncionarioDAO();
    
    
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    //verifico se é excluir
        if(request.getParameter("codigo") != null){
            Chave obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listarLimit();
    }
    
    

%>

<div>
    <h1>Registro de Chaves</h1>

</div>
<td><a href="chaves.jsp" class="btn  btn-primary btn-sm">Novo Registro</a>
</td>

</div><br/>



        <div class="table-responsive">
            <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite a sala desejada...">
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
                        <th style="width: 5%">Data Retirada</th>
                        <th style="width: 5%">Sala</th>
                        <th style="width: 10%">Responsável Retirada</th>
                        <th style="width: 8%">Horário Retirada:</th>
                        <th style="width: 5%">Data Entrega</th>
                        <th style="width: 8%">Horário Entrega:</th>
                        <th style="width: 8%">Entregue por:</th>
                        <th style="width: 8%">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(Chave item: lista)
                    {
                    %>
                    <tr>
                        <td><%=StormData.formata(item.getChdataretirada())%></td>
                        <td><%=item.getChsala()%></td>
                        <td><%
                            Funcionario f1 = dao2.buscarPorChavePrimaria(Integer.parseInt(item.getChresponsavel()));
                            out.print(f1);
                            
                            %></td>
                        <td><%=item.getChhorariore() %></td>
                        <td><%=StormData.formata(item.getChdataentrada()) %></td>
                        <td><%=item.getChhorarioen() %></td>
                        <td><%
                            Funcionario f = dao2.buscarPorChavePrimaria(Integer.parseInt(item.getChresponsavelre()));
                            out.print(f);
                            
                            %></td>



                        <td><a href="updChaves.jsp?codigo=<%=item.getIdchave()%>" class="btn  btn-primary btn-sm">Devolver Chave</a>

                        </td>


                    </tr>
                    <% } %>
                </tbody>



            </table>
        </div>
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
    function excluir() {
        document.location.href = "indexChaves.jsp?codigo=" + codigo;
    }
</script>

<%@include file="rodape.jsp"%> 