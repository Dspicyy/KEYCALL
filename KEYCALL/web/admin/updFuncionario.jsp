<%@include file="cabecalho.jsp"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>

<%
String msg ="";
String classe = "";
    
    FuncionarioDAO dao = new FuncionarioDAO();
    Funcionario obj = new Funcionario();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no 
       
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtIdfuncionario")));
       
        obj.setFuncnome(request.getParameter("txtNome"));
        obj.setFunccargo(request.getParameter("txtCargo"));
        
        String redirectURL = "indexFuncionario.jsp";
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
            response.sendRedirect("indexFuncionario.jsp");
            return;
        }
        
        dao = new FuncionarioDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("indexFuncionario.jsp");
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
                <h2>Alterar Cadastro de Funcionário</h2>
            </div>
            <form method="POST">
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6"> 
                <div class="form-group">
                    <label>ID</label>
                    <input class="form-control" type="text"  name="txtIdfuncionario"  readonly value="<%=obj.getIdfunc()%>" />
                </div>
                <div class="col-md-3"></div>
                </div>
                </div>
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Nome:</label>
                    <input class="form-control" type="text"  name="txtNome"  required value="<%=obj.getFuncnome()%>"/>
                </div> </div>  

                <div class="col-md-3">
                <div class="form-group">
                    <label>Cargo:</label>
                    <input class="form-control" type="text"  name="txtCargo"  required value="<%=obj.getFunccargo()%>"/>
                </div>
                </div>
                <div class="col-md-3"></div>
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

</body>
</html>
