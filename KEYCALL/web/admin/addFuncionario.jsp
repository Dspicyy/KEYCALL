<%@page import="util.StormData"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
<%@include file="cabecalho.jsp"%>

<%
    String msg = "";
    String classe = "";
    Funcionario obj = new Funcionario();
    FuncionarioDAO dao = new FuncionarioDAO();
    
    if (request.getParameter("txtNome")!= null) {
        //obj.setIduso(Long.parseLong(request.getParameter("txtId")));
        obj.setFuncnome(request.getParameter("txtNome"));
        obj.setFunccargo(request.getParameter("txtCargo"));
               
        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();

        String redirectURL = "indexFuncionario.jsp";
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
                <h2>Novo Cadastro de Funcionário</h2>
            </div>
            <form method="get">
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Nome:</label>
                    <input class="form-control" type="text"  name="txtNome"  required />
                </div>   
                </div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Cargo:</label>
                    <input class="form-control" type="text"  name="txtCargo"  required />
                </div>
                </div>
                <div class="col-md-3"></div>
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


</body>
</html>
