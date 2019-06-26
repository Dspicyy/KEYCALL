<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="cabecalho.jsp"%>

<%
String msg ="";
String classe = "";
    
    UsuarioDAO dao = new UsuarioDAO();
    Usuario obj = new Usuario();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no 
       
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtIduso")));
       
        obj.setUsutipo(Integer.parseInt(request.getParameter("txtTipo")));
        obj.setUsoemail(request.getParameter("txtEmail"));
        obj.setUsocpf(request.getParameter("txtCPF"));
        
        String redirectURL = "indexNovoAdmin.jsp";
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
            response.sendRedirect("indexNovoAdmin.jsp");
            return;
        }
        
        dao = new UsuarioDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("indexNovoAdmin.jsp");
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

    <div id="wrapper">
        

       <div>
        <div class="row text-center">
            <h2>Alterar Cadastro Administrador</h2>
        </div>
             <form method="POST">
                 <div class="row">
                    <div class="col-md-8">
                 <div class="form-group">
                    <label>ID:</label>
                    <input class="form-control" type="text"  name="txtIduso"  readonly value="<%=obj.getIduso()%>" />
                </div> 
                 
                <div class="form-group">
                    <label>Tipo:</label>
                    <input class="form-control" type="text"  name="txtTipo"  required value="<%=obj.getUsutipo()%>" />
                </div>   


                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="text"  name="txtEmail"  required value="<%=obj.getUsoemail()%>"  />
                </div>
                <div class="form-group">
                    <label>CPF</label>
                    <input class="form-control" type="text"  name="txtCPF"  required value="<%=obj.getUsocpf()%>"  />
                </div>

                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-8">
                        <button class="btn btn-primary btn-sm">Salvar</button>
                    </div>
                </div>
                 </div>
                </div>

            </form>
        </div>  
    </div>

</html>
