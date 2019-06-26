<%@page import="util.StormData"%>
<%@page import="dao.MiniDAO"%>
<%@page import="modelo.Mini"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>

<%
    String msg = "";
    String classe = "";
    Mini obj = new Mini();
    MiniDAO dao = new MiniDAO();
    FuncionarioDAO dao2 = new FuncionarioDAO();
    List<Funcionario> lista;
    lista = dao2.listar();
    
    if (request.getParameter("txtHorario")!= null) {
        //obj.setIduso(Long.parseLong(request.getParameter("txtId")));
        obj.setMindata(StormData.formata(request.getParameter("txtData")));
        obj.setMinhorario(request.getParameter("txtHorario"));
        obj.setMinresponsavel(request.getParameter("txtResponsavel"));
        
        //select idmini,mindata,minhorario,funcnome from Mini left join funcionario on Mini.minresponsavel=funcionario.idfunc
               
        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();

        String redirectURL = "indexMini.jsp";
        response.sendRedirect(redirectURL);
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
    } 
    

%>

<style>

    div {
        padding-bottom:20px;
    }

</style>
</head>
<body>

    <div id="page-wrapper">


        <div>
            <div class="row text-center">
                <h2>Nova Reserva do Mini Auditório</h2>
            </div>
            <form method="get">
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Data:</label>
                    <input class="form-control" type="date"  name="txtData" id="txtData" required />
                </div>   
                 </div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Horário:</label>
                    <input class="form-control" type="text"  name="txtHorario" id="txtHorario" required />
                </div>
                    </div>
                <div class="col-md-3"></div>
                </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Responsável</label>
                    <select class="form-control" name="txtResponsavel" required>
                        <%for(Funcionario item: lista){
                        %>
                        <option value="<%=item.getIdfunc()%>"><%=item.getFuncnome()%></option>
                        <%}%>
                    </select>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
                <div class="row">
                    <div class="col-md-5">
                    </div>
                    <div class="col-md-7">
                        <button class="btn btn-primary btn-sm">Registrar</button>
                    </div>
                </div>

            </form>
        </div>  
    </div>

<script>
var data = new Date();
document.getElementById("txtData").value     = data.toISOString().slice(0,10);
var hora = data.toISOString().slice(11,13);
var min = data.toISOString().slice(14,16);
document.getElementById("txtHorario").value  = (hora - 3) + ":" + min;
</script>
</body>
</html>
