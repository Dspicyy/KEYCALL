<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Ctelefonica"%>
<%@page import="dao.CtelefonicaDAO"%>
<%@include file="cabecalho.jsp"%>

<% 
    
    CtelefonicaDAO dao = new CtelefonicaDAO();
    List<Ctelefonica> lista;
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    // verifico se é excluir
        if(request.getParameter("codigo") != null){
            Ctelefonica obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listarLimit();
    }
    
    

%>

<div>
    <h1>Chamadas Telefônicas</h1>

</div>
   <td><a href="addChamadas.jsp" class="btn  btn-primary btn-sm">Novo Registro</a>
    </td>

</div><br/>



 <div class="table-responsive">
        <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite o setor desejado...">
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
                        <th>Solicitante</th>
                        <th>Setor Solicitante</th>
                        <th>Ramal</th>
                        <th>Número</th>
                        <th>Horário</th>                      
                        <th >Ações</th>
                    </tr>
                </thead>
                <tbody>
                    
                    
                    <tbody>
                     <%for(Ctelefonica item: lista)
                    {
                    %>
                    <tr>
                        
                        <td><%=item.getCtsolitante()%></td>
                        <td><%=item.getCtsetsolicitante()%></td>
                        <td><%=item.getCtramal()%></td>
                        <td><%=item.getCtnumero()%></td>
                        <td><%=item.getCthorario() %></td>
                        
                        
                       
                        <td><a href="updChamadas.jsp?codigo=<%=item.getIdtel()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                    onclick="codigo=<%=item.getIdtel()%>">Excluir</button>  
                        </td>

                        
                    </tr>
                    <% } %>
                </tbody>
                    
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
        document.location.href = "indexChamadas.jsp?codigo="+codigo;
    }
</script>

<%@include file="rodape.jsp"%> 