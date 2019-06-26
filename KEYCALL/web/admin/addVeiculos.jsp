<%@page import="dao.VeiculoDAO"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Veiculos"%>
<%@include file="cabecalho.jsp"%>

<%
    String msg = "";
    String classe = "";
    Veiculos obj = new Veiculos();
    VeiculoDAO dao = new VeiculoDAO();
    
    if (request.getParameter("txtVeiculo")!= null) {
        //obj.setIduso(Long.parseLong(request.getParameter("txtId")));
        obj.setTipovei(request.getParameter("txtTipo"));
        obj.setDatasai(StormData.formata(request.getParameter("txtDatasai")));
        obj.setHorariosai(request.getParameter("txtHorariosai"));
        obj.setVeiculo(request.getParameter("txtVeiculo"));
        obj.setPlaca(request.getParameter("txtPlaca"));
        obj.setDestino(request.getParameter("txtDestino"));
        obj.setHodometrosai(request.getParameter("txtHodometrosai"));
        obj.setMotorista(request.getParameter("txtMotorista"));
        obj.setVigilante(request.getParameter("txtVigilante"));

        
        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();

        String redirectURL = "indexVeiculos.jsp";
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
                <h2>Novo Registro de Veículo</h2>
            </div>
            <form method="get">
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Tipo:</label>
                    <select class="form-control" name="txtTipo">
                        <option value="1"> 1 </option>
                    </select>
                    
                </div>   
                 </div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Data:</label>
                    <input class="form-control" type="date"  name="txtDatasai" id="txtDatasai"  required />
                </div>
                    </div>
                <div class="col-md-3"></div>
                </div>
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Veículo:</label>
                    <select class="form-control" name="txtVeiculo">
                        <option value="doblo"> Doblô </option>
                        <option value="hilux"> Hilux </option>
                        <option value="onibus"> Ônibus </option>
                        <option value="gol"> Gol </option>
                        <option value="micro"> Micro-ônibus </option>
                        <option value="trator"> Trator </option>
                    </select>
                 </div>
                    </div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Placa:</label>
                    <input class="form-control" type="text"  name="txtPlaca"  required />
                </div>
                    </div>
                <div class="col-md-3"></div>
                </div>
                 <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Horário:</label>
                    <input class="form-control" type="text"  name="txtHorariosai"  id="txtHorariosai" required />
                 </div></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Destino:</label>
                    <input class="form-control" type="text"  name="txtDestino"   required />
                </div>
                     </div>
                <div class="col-md-3"></div>
                </div>
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Hodômetro:</label>
                    <input class="form-control" type="text"  name="txtHodometrosai"  required />
                 </div></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Motorista</label>
                    <select class="form-control" name="txtMotorista">
                        <option value="Alex"> Alex </option>
                        
                    </select>
                    
                </div>
                    </div>
                <div class="col-md-3"></div>
                </div>
                 <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Vigilante</label>
                    <input class="form-control" type="text"  name="txtVigilante"  required />
                    </select>
                 </div></div>
                
                <div class="col-md-3"></div>
                </div>
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
data.setHours(data.getHours() - 3);
document.getElementById("txtDatasai").value     = data.toISOString().slice(0,10);
var hora = data.toISOString().slice(11,13);
var min = data.toISOString().slice(14,16);
document.getElementById("txtHorariosai").value  = hora + ":" + min;
</script>

</body>
</html>
