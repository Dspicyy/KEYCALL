<!DOCTYPE html>
<%
//logando direto
String msg="";

if(request.getParameter("acao")!=null){
        session.setAttribute("administrador","");
    }

if(request.getMethod().equals("POST")){
    
    if((request.getParameter("txtLogin").equals("recepção")  || 
            request.getParameter("txtLogin").equals("guardas") || 
            request.getParameter("txtLogin").equals("chefia"))
            &&request.getParameter("txtSenha").equals("12345")){
        //salvar session
        session.setAttribute("administrador", request.getParameter("txtLogin"));
        //vai pra página inicial
        response.sendRedirect("../admin/index.jsp");
        
        return;
    }
    else{
        msg = "Login/Senha incorreta";
    }
}


%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>KEYCALL</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link href="img/IMG-20180924-WA0004.jpg" rel="icon">
        <!--<link href="img/key.jpg" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts .googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!-- Libraries CSS Files -->
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="css/style.css" rel="stylesheet">

        <!-- =======================================================
          Theme Name: BizPage
          Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
          Author: BootstrapMade.com
          License: https://bootstrapmade.com/license/
        ======================================================= -->
    </head>

    <body>

        <!--==========================
          Header
        ============================-->
        <header id="header">
            <div class="container-fluid">

                <div id="logo" class="pull-left">
                    <h1><a href="#intro" class="scrollto">KEYCALL</a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
                </div>

                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-active"><a href="#intro">Início</a></li>
                        <li><a href="#about"></a></li>
                        <li class="menu-has-children"><a href="">Opções</a>
                            <ul>
                                
                                <li><a href="ajuda.jsp">Funções</a></li>
                            </ul>
                        </li>
                                              
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </header><!-- #header -->

        <!--==========================
          Intro Section
        ============================-->
        <section id="intro">
            <div class="intro-container">
                <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">

                    <ol class="carousel-indicators"></ol>

                    <div class="carousel-inner" role="listbox">

                        <div class="carousel-item active">
                            <div class="carousel-background"><img src="img/intro-carousel/if.jpg" alt=""></div>
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>Registro de Chamadas Telefônicas</h2>
                                    <p>O KeyCall disponibiliza o registro de Chamadas Telefônicas. Com alguns cliques e
                                    o dígito de algumas informações, fica tudo arquivado pelo sistema, facilitando o trabalho
                                    da recepção e controle de chamadas.</p>
                                    <a href="#formulario" class="btn-get-started scrollto">Fazer Login</a>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="carousel-background"><img src="img/intro-carousel/if.jpg" alt=""></div>
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>Registro de Chaves</h2>
                                    <p>Assim como o Registro de Chamadas, o KeyCall, disponibiliza também,
                                    o Registro de retirada e devoluções de chaves, mantendo o controle sobre o uso
                                    de salas e setores do câmpus.</p>
                                    <a href="#formulario" class="btn-get-started scrollto">Fazer Login</a>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="carousel-background"><img src="img/intro-carousel/if.jpg" alt=""></div>
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>Reserva do Mini Auditório</h2>
                                    <p>O Mini Auditório do Câmpus é utilizado em diversos eventos, desde aulas à reuniões,
                                    por ser um epaço que abriga uma grande quantia de pessoas. Muito requisitado, o ambiente 
                                    necessita de reservas, para que não haja conflitos, e essa também é uma função do KeyCall!</p>
                                    <a href="#formulario" class="btn-get-started scrollto">Fazer Login</a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="carousel-item">
                            <div class="carousel-background"><img src="img/intro-carousel/if.jpg" alt=""></div>
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>Controle de Veículos</h2>
                                    <p>
                                        O sistema também serve para controlar o fluxo de entradas e saídas de veículos
                                        oficiais do Câmpus, com o KeyCall fica mais fácil e rápido ter esse controle.
                                    </p>
                                    <a href="#formulario" class="btn-get-started scrollto">Fazer Login</a>
                                </div>
                            </div>
                        </div>
                        
                    </div>

                    <a class="carousel-control-prev" href="#introCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon ion-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>

                    <a class="carousel-control-next" href="#introCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon ion-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </section><br><br><br><br><!-- #intro -->

        <div class="container" id="formulario">

            <div class="row">

                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="login" class="active" id="login-form-link">Login</a>
                                    <%=msg%>
                                </div>
                                
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="text" name="txtLogin" id="username" tabindex="1" class="form-control" placeholder="Nome" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="txtSenha" id="password" tabindex="2" class="form-control" placeholder="Senha">
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Iniciar Sessão">
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div><br><br><br><br>


        <!--==========================
          Footer
        ============================-->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-info">
                            <h3>KEYCALL</h3>
                            <p align="justify">Software na Plataforma JavaWeb onde visa a facilidade
                            na execução da tarefa realizada pela recepcionista do Instituto. 
                            Com isso, haverá um maior e mais eficiente controle de chamadas telefônicas, entradas e saídas de chaves e reservas do mini auditório.	</p>
                        </div>

                       
                        <div class="col-lg-3 col-md-6 footer-contact" id="contato">
                            <h4>Contato</h4>
                            <p align="justify">
                                Av. Leonel de Moura Brizola, 2501<br>
                                Bairro Pedra Branca<br>
                                Bagé - RS <br>
                                <strong>Telefone:</strong> (53) 3247-3237<br>
                                <strong>Email:</strong> bage@ifsul.edu.br<br>
                            </p>

                        </div>
                        
                     

                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong>BizPage & Douglas Ribeiro</strong>. Todos os Direitos Reservados
                </div>
                <div class="credits">
                    <!--
                      All the links in the footer should remain intact.
                      You can delete the links only if you purchased the pro version.
                      Licensing information: https://bootstrapmade.com/license/
                      Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
                    -->
                    Criado Por <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
            </div>
        </footer><!-- #footer -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/superfish/hoverIntent.js"></script>
        <script src="lib/superfish/superfish.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
        <!-- Contact Form JavaScript File -->
        <script src="contactform/contactform.js"></script>

        <!-- Template Main Javascript File -->
        <script src="js/main.js"></script>

    </body>
</html>
