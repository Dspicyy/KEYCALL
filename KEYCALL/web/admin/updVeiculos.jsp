<%@include file="cabecalho.jsp"%>
<%@page import="dao.VeiculoDAO"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Veiculos"%>

<%
String msg ="";
String classe = "";
    
    VeiculoDAO dao = new VeiculoDAO();
    Veiculos obj = new Veiculos();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no 
       
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtIdveiculos")));
        obj.setTipovei(request.getParameter("txtTipo"));
        obj.setDatasai(StormData.formata(request.getParameter("txtDatasai")));
        obj.setHorariosai(request.getParameter("txtHorariosai"));
        obj.setVeiculo(request.getParameter("txtVeiculo"));
        obj.setPlaca(request.getParameter("txtPlaca"));
        obj.setDestino(request.getParameter("txtDestino"));
        obj.setHodometrosai(request.getParameter("txtHodometrosai"));
        obj.setMotorista(request.getParameter("txtMotorista"));
        obj.setVigilante(request.getParameter("txtVigilante"));
        String redirectURL = "indexVeiculos.jsp";
        response.sendRedirect(redirectURL);
        
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("indexVeiculos.jsp");
            return;
        }
        
        dao = new VeiculoDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("indexVeiculos.jsp");
            return;
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
                <h2>Alterar Registro de Veículo</h2>
            </div>
            <form method="POST">
                <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>ID</label>
                    <input class="form-control" type="text"  name="txtIdveiculos"  readonly value="<%=obj.getIdvei()%>" />
                </div></div>
                <div class="col-md-4"></div>
        </div>
                
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Tipo:</label>
                    <select class="form-control" name="txtTipo" value="<%=obj.getTipovei()%>" >
                        <option value="1-Saída"> 1-Saída </option>
                        <option value="2-Retorno"> 2-Retorno </option>
                    </select>
                    
                </div>   
                 </div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Data:</label>
                    <input class="form-control" type="date"  name="txtDatasai" id="txtDatasai"  required value="<%=StormData.formata(obj.getDatasai(),"yyyy-MM-dd")%>" />
                </div>
                    </div>
                <div class="col-md-3"></div>
                </div>
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Veículo:</label>
                    <select class="form-control" name="txtVeiculo" value="<%=obj.getVeiculo()%>" >
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
                    <input class="form-control" type="text"  name="txtPlaca"  required value="<%=obj.getPlaca()%>" />
                </div>
                    </div>
                <div class="col-md-3"></div>
                </div>
                 <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Horário:</label>
                    <input class="form-control" type="text"  name="txtHorariosai"  required value="<%=obj.getHorariosai()%>" />
                 </div></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Destino:</label>
                    <input class="form-control" type="text"  name="txtDestino"   required value="<%=obj.getDestino()%>" />
                </div>
                     </div>
                <div class="col-md-3"></div>
                </div>
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Hodômetro:</label>
                    <input class="form-control" type="text"  name="txtHodometrosai"  required value="<%=obj.getHodometrosai()%>"  />
                 </div></div>
                <div class="col-md-3">
                 <div class="form-group">
                    <label>Motorista</label>
                    <select class="form-control" name="txtMotorista" value="<%=obj.getMotorista()%>" >
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
                    <input class="form-control" type="text"  name="txtVigilante"  required value="<%=obj.getVigilante()%>"  />
                    </select>
                 </div></div>
                
                <div class="col-md-3"></div>
                </div>
        </div>
        
                <div class="row">
                    <div class="col-md-5">
                    </div>
                    <div class="col-md-7">
                        <button class="btn btn-primary btn-sm">Salvar</button>
                    </div>
                </div>

            </form>
        </div>  
    </div>
<script>
var data = new Date();
document.getElementById("txtDatasai").value = data.toISOString().slice(0,10);
document.getElementById("txtDataret").value = data.toISOString().slice(0,10);
</script>
</body>
</html>
