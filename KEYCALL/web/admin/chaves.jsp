<%@page import="modelo.Chave"%>
<%@page import="dao.ChaveDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg = "";
    String classe = "";
    Chave obj = new Chave();
    ChaveDAO dao = new ChaveDAO();
    FuncionarioDAO dao2 = new FuncionarioDAO();
    List<Funcionario> lista;
    lista = dao2.listar();
    
    if (request.getParameter("txtSala") != null) {
        
        obj.setChdataretirada(StormData.formata(request.getParameter("txtDatare")));
        obj.setChsala(request.getParameter("txtSala"));
        obj.setChresponsavel(request.getParameter("txtResponsavelre"));
        obj.setChhorariore(request.getParameter("txtHorariore"));
        obj.setChdataentrada(StormData.formata(request.getParameter("txtDataEntrada")));
        obj.setChhorarioen(request.getParameter("txtHorarioen"));
        obj.setChresponsavelre(request.getParameter("txtResponsavel"));            
         
        String redirectURL = "indexChaves.jsp";
        response.sendRedirect(redirectURL);
        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
    } 
%>

<div id="page-wrapper">


    <div>
        <div class="row text-center">
            <h2>Novo Registro de Saída ou Entrada de Chave</h2>
        </div><br/><br/>
        <form action="../UploadWS" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Data Retirada</label>
                        <input class="form-control" type="date"  name="txtDatare" id="txtDatare" required />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Data Entrega</label>
                        <input class="form-control" type="date"  name="txtDataEntrada" id="txtDataEntrada" required />
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Horário Retirada</label>
                        <input class="form-control" type="text"  name="txtHorariore" id="txtHorariore" required />
                    </div>
                </div>
                <div class="col-md-3">

                    <div class="form-group">
                        <label>Horário Entrega</label>
                        <input class="form-control" type="text"  name="txtHorarioen" id="txtHorarioen" required />
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Sala</label>
                        <input class="form-control" type="text"  name="txtSala"  required />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Responsável Retirada</label>
                        <select class="form-control" name="txtResponsavelre" required>
                            <%for(Funcionario item: lista){
                            %>
                            <option value="<%=item.getIdfunc()%>"><%=item.getFuncnome()%></option>
                            <%}%>
                        </select>




                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label>Responsável Entrada</label>
                        <select class="form-control" name="txtResponsavel" required>
                            <%for(Funcionario item: lista){
                            %>
                            <option value="<%=item.getIdfunc()%>"><%=item.getFuncnome()%></option>
                            <%}%>
                        </select>


                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <br/><br/>
            <div class="row">
                <div class="col-md-5">
                </div>

                <div class="col-md-7">
                    <button type="submit" class="btn  btn-primary btn-sm">Registrar</button>
                </div>
            </div>
    </div>  
</div>
</div>
</form>
<script>
    var data = new Date();
    data.setHours(data.getHours() - 3);
    document.getElementById("txtDatare").value = data.toISOString().slice(0, 10);
    document.getElementById("txtDataEntrada").value = data.toISOString().slice(0, 10);
    var hora = data.toISOString().slice(11, 13);
    var min = data.toISOString().slice(14, 16);
    document.getElementById("txtHorariore").value = hora + ":" + min;
    var hora2 = data.toISOString().slice(11, 13);
    var min2 = data.toISOString().slice(14, 16);
    document.getElementById("txtHorarioen").value = hora + ":" + min;
</script>
</body>
</html>
