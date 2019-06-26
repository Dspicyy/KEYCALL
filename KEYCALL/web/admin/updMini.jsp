<%@page import="modelo.Mini"%>
<%@page import="dao.MiniDAO"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>

<%
String msg ="";
String classe = "";
    
    MiniDAO dao = new MiniDAO();
    Mini obj = new Mini();
    
    FuncionarioDAO dao2 = new FuncionarioDAO();
    List<Funcionario> lista;
    lista = dao2.listar();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no 
       
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtIdmini")));
       
        obj.setMindata(StormData.formata(request.getParameter("txtData")));
        obj.setMinhorario(request.getParameter("txtHorario"));
        obj.setMinresponsavel(request.getParameter("txtResponsavel"));
        
        String redirectURL = "indexMini.jsp";
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
            response.sendRedirect("indexMini.jsp");
            return;
        }
        
        dao = new MiniDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("indexMini.jsp");
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
                <h2>Alterar Reserva do Mini Auditório</h2>
            </div>
            <form method="POST">
                <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>ID:</label>
                    <input class="form-control" type="text"  name="txtIdmini"  readonly value="<%=obj.getIdmini()%>" />
                </div>   
                </div>
                <div class="col-md-4"></div>
        </div>
                <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Data:</label>
                    <input class="form-control" type="date"  name="txtData"  required  value="<%=StormData.formata(obj.getMindata(),"yyyy-MM-dd")%>"/>
                </div>   
                 </div>
                <div class="col-md-3">
                <div class="form-group">
                    <label>Horário:</label>
                    <input class="form-control" type="text"  name="txtHorario"  required value="<%=obj.getMinhorario()%>"/>
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
                        <button class="btn btn-primary btn-sm">Salvar</button>
                    </div>
                </div>
                
            </form>
        </div>  
    </div>


</body>
</html>
