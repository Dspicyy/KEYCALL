<%@page import="dao.CtelefonicaDAO"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Ctelefonica"%>
<%@include file="cabecalho.jsp"%>

<%
    String msg = "";
    String classe = "";
    Ctelefonica obj = new Ctelefonica();
    CtelefonicaDAO dao = new CtelefonicaDAO();
    
    if (request.getParameter("txtSolicitante")!= null) {
        //obj.setIduso(Long.parseLong(request.getParameter("txtId")));
        obj.setCtsolitante(request.getParameter("txtSolicitante"));
        obj.setCtsetsolicitante(request.getParameter("txtSetsolicitante"));
        obj.setCtramal(request.getParameter("txtRamal"));
        obj.setCtnumero(request.getParameter("txtNumero"));
        obj.setCthorario(request.getParameter("txtHorario"));
        
        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();

        String redirectURL = "indexChamadas.jsp";
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

    <div id="wrapper">


        <div>
            
            <form method="get">
                <div class="row text-center">
                <h2>Novo Cadastro de Chamada Telefônica</h2>
            </div>
                <div class="row">
                    <div class="col-md-9">

                        <div class="form-group">
                            <label>Solicitante:</label>
                            <input class="form-control" type="text"  name="txtSolicitante"  required />
                        </div>   

                        <div class="form-group">
                            <label>Setor Solicitante:</label>
                            <input class="form-control" type="text"  name="txtSetsolicitante"  required />
                        </div>

                        <div class="row">
                            <div class="col-md-2">
                        <div class="form-group">
                            <label>Ramal:</label>
                            <input class="form-control" type="text"  name="txtRamal"  required />
                        </div>
                            </div>
                            <div class="col-md-6">
                        <div class="form-group">
                            <label>Número:</label>
                            <input class="form-control" type="text"  name="txtNumero"  required />
                        </div>
                            </div>
                            <div class="col-md-4">
                        <div class="form-group">
                            <label>Horário:</label>
                            <input class="form-control" type="text"  name="txtHorario" id="txtHorario" required />
                        </div>
                            </div>

                        <div class="row">
                            <div class="col-md-5">
                            </div>
                            <div class="col-md-7">
                                <button class="btn btn-primary btn-sm">Registrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>  
    </div>

<script>
var data = new Date();
data.setHours(data.getHours() - 3);
var hora = data.toISOString().slice(11,13);
var min = data.toISOString().slice(14,16);
document.getElementById("txtHorario").value  = hora + ":" + min;
</script>
</body>
</html>
