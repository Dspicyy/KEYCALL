<%@include file="cabecalho.jsp"%>
<%@page import="modelo.Chave"%>
<%@page import="dao.ChaveDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="util.StormData"%>
<%@page import="java.util.List"%>

<%
String msg ="";
String classe = "";
    
    ChaveDAO dao = new ChaveDAO();
    Chave obj = new Chave();
    FuncionarioDAO dao2 = new FuncionarioDAO();
    List<Funcionario> lista;
    lista = dao2.listar();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no 
       
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtIdchave")));
       
        obj.setChdataretirada(StormData.formata(request.getParameter("txtDatare")));
        obj.setChsala(request.getParameter("txtSala"));
        obj.setChresponsavel(request.getParameter("txtResponsavelre"));
        obj.setChhorariore(request.getParameter("txtHorariore"));
        obj.setChdataentrada(StormData.formata(request.getParameter("txtDataEntrada")));
        obj.setChhorarioen(request.getParameter("txtHorarioen"));
        obj.setChresponsavelre(request.getParameter("txtResponsavel")); 
        
        String redirectURL = "indexChaves.jsp";
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
            response.sendRedirect("indexChaves.jsp");
            return;
        }
        
        dao = new ChaveDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("indexChaves.jsp");
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
            <h2>Alterar Registro de Saída ou Entrada de Chave</h2>
        </div><br/><br/>
        
        <form action="../UploadWS" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6"> 
            <div class="form-group">
                    <label>ID</label>
                    <input class="form-control" type="text"  name="txtIdchave"  readonly value="<%=obj.getIdchave()%>" />
                </div>
                 <div class="col-md-3"></div>
                </div>
                </div>         
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Data Retirada</label>
                        <input class="form-control" type="date"  name="txtDatare"  readonly value="<%=StormData.formata(obj.getChdataretirada(),"yyyy-MM-dd")%>" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Data Entrega</label>
                        <input class="form-control" type="date"  name="txtDataEntrada"  required value="<%=StormData.formata(obj.getChdataentrada(),"yyyy-MM-dd")%>" />
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Horário Retirada</label>
                        <input class="form-control" type="text"  name="txtHorariore"  readonly value="<%=obj.getChhorariore()%>" />
                    </div>
                </div>
                <div class="col-md-3">

                    <div class="form-group">
                        <label>Horário Entrega</label>
                        <input class="form-control" type="text"  name="txtHorarioen" required value="<%=obj.getChhorarioen()%>" />
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Sala</label>
                    <input class="form-control" type="text"  name="txtSala"  readonly value="<%=obj.getChsala()%>" />
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Responsável Retirada</label>
                    <select class="form-control" name="txtResponsavelre" readonly value="<%=obj.getChresponsavel()%>">
                        <%for(Funcionario item: lista){
                            String oi = "";
                            if(Integer.parseInt(obj.getChresponsavel()) == item.getIdfunc()){ oi = "selected"; 
                        %>
                        <option <%=oi%>  value="<%=item.getIdfunc()%>"><%=item.getFuncnome()%></option>
                        <%}}%>
                    </select>




                </div></div>
                    <div class="col-md-3"></div>
            </div>
                     <div class="row">
                <div class="col-md-3"></div>

                <div class="col-md-3">
                <div class="form-group">
                    <label>Responsável Entrada</label>
                    <select class="form-control" name="txtResponsavel"  required value="<%=obj.getChresponsavelre()%>">
                        <%for(Funcionario item: lista){
                        %>
                        <option value="<%=item.getIdfunc()%>"><%=item.getFuncnome()%></option>
                        <%}%>
                    </select>

                </div>
                
                </div>
                <div class="col-md-3"></div>
            </div>
                    <br/><br/>
            <div class="row">
                <div class="col-md-5">
                </div>

                <div class="col-md-7">
                    <button type="submit" class="btn  btn-primary btn-sm">Registrar</button>
                </div>
            </div>
    </div>  
</div>
</div>
    </form>
</html>
