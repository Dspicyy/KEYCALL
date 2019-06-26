<% if(session.getAttribute("administrador").equals("")){
    response.sendRedirect("../site/index.jsp");   
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <link href="img/IMG-20180924-WA0004.jpg" rel="icon">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KEYCALL-REGISTROS</title>

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="bootstrap/css/all.min.css" />
    <link id="gridcss" rel="stylesheet" type="text/css" href="bootstrap/css/all.min.css" />

    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
</head>
<body>
    <div id="wrapper">
          <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <link href="img/IMG-20180924-WA0004.jpg" rel="icon">
                    <span class="icon-bar"></span>
                </button>
              <!--    <a class="navbar-brand" href="index.jsp"><img src="./img/" height="20px" width="20px"/></a> LOGO--> 
                <a class="navbar-brand" href="index.jsp">Central Administrativa</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="active" class="nav navbar-nav side-nav">
                    <li  class="selected"><a href="index.jsp"><i class="fa fa-bullseye"></i> Ramais</a></li>
                    <%
                        String[] a = {"block", "block", "block", "block", "block", "block", "block"};
                        if(session.getAttribute("administrador").equals("chefia")){
                            a[0] = "none";
                            a[1] = "none";
                            a[2] = "none";
                            a[3] = "block";
                            a[4] = "block";
                            a[5] = "block";
                            a[6] = "none";
                        }
                        else if(session.getAttribute("administrador").equals("guardas")){
                            a[0] = "none";
                            a[2] = "none";
                            a[3] = "none";
                            a[4] = "none";
                            a[5] = "none";
                            
                        }
                        else if(session.getAttribute("administrador").equals("recepção")){
                            a[3] = "none";
                            a[4] = "none";
                            a[6] = "none";
                            
                        }
                        
                        %>
                    
                    <li  style="display: <%=a[0]%>"><a href="indexChamadas.jsp"><i class="fa fa-tablet"></i>Chamadas Telefônicas</a></li>
                    <li style="display: <%=a[1]%>"><a href="indexChaves.jsp"><i class="fa fa-key"></i>Chaves</a></li>
                    <li style="display: <%=a[2]%>"><a href="indexMini.jsp"><i class="fa fa-calendar"></i> Mini Auditório</a></li>
                   <li style="display: <%=a[3]%>"><a href="indexNovoAdmin.jsp"><i class="fa fa-user"></i> Novo Admin</a></li>
                    <li style="display: <%=a[4]%>"><a href="indexFuncionario.jsp"><i class="fa fa-user"></i>Funcionários</a></li>
                     <li style="display: <%=a[5]%>"><a href="indexRelatorio.jsp"><i class="fa fa-list"></i> Relatórios</a></li>
                     <li style="display: <%=a[6]%>"><a href="indexVeiculos.jsp"><i class="fa fa-car"></i> Veículos</a></li>
                     
                    
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    
                    <li class="dropdown user-dropdown">
                        
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("administrador")%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="divider"></li>
                            <li><a href="../site/index.jsp?acao=sair"><i class="fa fa-power-off"></i> Sair </a></li>

                        </ul>
                    </li>
                    <li class="divider-vertical"></li>
                   
                </ul>
                
            </div>
        </nav>