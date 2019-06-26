<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Veiculos"%>
<%@page import="dao.VeiculoDAO"%>


<%@include file="cabecalho.jsp"%>

<% 
    
    VeiculoDAO dao = new VeiculoDAO();
    List<Veiculos> lista;
    
    
    
    
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    //verifico se é excluir
        if(request.getParameter("codigo") != null){
            Veiculos obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
    
    

%>

<div>
    <h1>Registro de Veiculos</h1>

</div>
   <td><a href="addVeiculos.jsp" class="btn  btn-primary btn-sm">1-Saída</a>
    </td>
     <td><a href="addVeiculos2.jsp" class="btn  btn-primary btn-sm">2-Retorno</a>
    </td>

</div><br/>



 <div class="table-responsive">
        <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite o veiculo desejado...">
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
                        <th style="width: 5%">Tipo</th>
                        <th style="width: 5%">Data</th>
                        <th style="width: 5%">Hora</th>
                        <th style="width: 5%">Veículo</th>
                        <th style="width: 5%">Placa</th>
                        <th style="width: 5%">Destino</th>
                        <th style="width: 5%">Hodômetro</th>
                        <th style="width: 5%">Motorista</th>
                        <th style="width: 5%">Vigilante</th>
                        <th style="width: 15%">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(Veiculos item: lista)
                    {
                    %>
                    <tr>
                        <td><%=item.getTipovei() %></td>
                        <td><%=StormData.formata(item.getDatasai()) %></td>
                        <td><%=item.getHorariosai() %></td>
                        <td><%=item.getVeiculo() %></td>
                        <td><%=item.getPlaca() %></td>
                       
                        <td><%=item.getDestino() %></td>
                        <td><%=item.getHodometrosai() %></td>
                        <td><%=item.getMotorista() %></td>
                        <td><%=item.getVigilante() %>
                        
                        
                        
                        
                       
                        <td><a href="updVeiculos.jsp?codigo=<%=item.getIdvei()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" 
                                    onclick="codigo=<%=item.getIdvei()%>">Excluir</button>  
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
        document.location.href = "indexVeiculos.jsp?codigo="+codigo;
    }
</script>

<%@include file="rodape.jsp"%> 