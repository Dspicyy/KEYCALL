<%@page import="util.StormData"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@include file="cabecalho.jsp"%>

<%
    String msg = "";
    String classe = "";
    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    
    if (request.getParameter("txtTipo")!= null) {
        //obj.setIduso(Long.parseLong(request.getParameter("txtId")));
        obj.setUsutipo(Integer.parseInt(request.getParameter("txtTipo")));
        obj.setUsoemail(request.getParameter("txtEmail"));
        obj.setUsocpf(request.getParameter("txtCPF"));
               
        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();

        String redirectURL = "indexNovoAdmin.jsp";
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
            <div class="row text-center">
                <h2>Novo Cadastro de Administrador</h2>
            </div>
            <form method="get">
                <div class="row">
                    <div class="col-md-8">
                <div class="form-group">
                    <label>Tipo:</label>
                    <input class="form-control" type="text"  name="txtTipo"  required />
                </div>   


                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="text"  name="txtEmail"  required />
                </div>
                <div class="form-group">
                    <label>CPF</label>
                    <input class="form-control" type="text"  name="txtCPF"  required />
                </div>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-10">
                        <button class="btn btn-primary btn-sm">Registrar</button>
                    </div>
                </div>
                    </div>
                </div>
            </form>
        </div>  
    </div>


</body>
</html>
