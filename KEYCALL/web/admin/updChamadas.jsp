<%@include file="cabecalho.jsp"%>
<%@page import="dao.CtelefonicaDAO"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Ctelefonica"%>

<%
String msg ="";
String classe = "";
    
    CtelefonicaDAO dao = new CtelefonicaDAO();
    Ctelefonica obj = new Ctelefonica();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no 
       
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtIdchamadas")));
       
        obj.setCtsolitante(request.getParameter("txtSolicitante"));
        obj.setCtsetsolicitante(request.getParameter("txtSetsolicitante"));
        obj.setCtramal(request.getParameter("txtRamal"));
        obj.setCtnumero(request.getParameter("txtNumero"));
        obj.setCthorario(request.getParameter("txtHorario"));
        
        String redirectURL = "indexChamadas.jsp";
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
            response.sendRedirect("indexChamadas.jsp");
            return;
        }
        
        dao = new CtelefonicaDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("indexChamadas.jsp");
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
                <h2>Novo Cadastro de Chamada Telefônica</h2>
            </div>
            <form method="POST">

                <div class="row">
                    <div class="col-md-9">
                <div class="form-group">
                    <label>ID</label>
                    <input class="form-control" type="text"  name="txtIdchamadas"  readonly value="<%=obj.getIdtel()%>" />
                </div>
                
                <div class="form-group">
                    <label>Solicitante:</label>
                    <input class="form-control" type="text"  name="txtSolicitante"  required value="<%=obj.getCtsolitante()%>"/>
                </div>   

                <div class="form-group">
                    <label>Setor Solicitante:</label>
                    <input class="form-control" type="text"  name="txtSetsolicitante"  required value="<%=obj.getCtsetsolicitante()%>"/>
                </div> 
                <div class="row">
                <div class="col-md-2">
                <div class="form-group">
                    <label>Ramal:</label>
                    <input class="form-control" type="text"  name="txtRamal"  required value="<%=obj.getCtramal()%>"/>
                </div>
                 </div>
                 <div class="col-md-6">
                <div class="form-group">
                    <label>Número:</label>
                    <input class="form-control" type="text"  name="txtNumero"  required value="<%=obj.getCtnumero()%>"/>
                </div>
                 </div>
                 <div class="col-md-4">
                <div class="form-group">
                    <label>Horário:</label>
                    <input class="form-control" type="text"  name="txtHorario"  required value="<%=obj.getCthorario()%>"/>
                </div>
                 </div>
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-10">
                        <button class="btn btn-primary btn-sm">Salvar</button>
                    </div>
                </div>
              </div>
            </form>
        </div>  
    </div>
                
 </body>
</html>
