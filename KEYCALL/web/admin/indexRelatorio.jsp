<%@include file="cabecalho.jsp"%>

<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-11">
        <div class="row">
            <div class="col-md-11">
                <div>
                    <h1 style="text-align: center;">Gerar Relatório</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-4">
                <h3>Chaves</h3><br/>
                <form action="${pageContext.request.contextPath}/chaves" method="post">
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-11">
                            <button class="btn btn-primary btn-sm">Gerar</button>
                        </div>
                    </div>
                </form>
            </div> 
            <div class="col-md-4">
                <h3>Chamada Telefônica</h3><br/>
                <form action="${pageContext.request.contextPath}/chamadastel" method="post">
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-11">
                            <button class="btn btn-primary btn-sm">Gerar</button>
                        </div>
                    </div>
                </form>                
            </div> 
        </div> 

        <div class="row">
            <div class="col-md-2">
            </div> 
            <div class="col-md-4">
                <h3>Mini</h3><br/>
                <form action="${pageContext.request.contextPath}/mini" method="post">

                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-11">
                            <button class="btn btn-primary btn-sm">Gerar</button>
                        </div>
                    </div>
                </form>
            </div> 
            <div class="col-md-4">
                <h3>Veículos</h3><br/>
                <form action="${pageContext.request.contextPath}/veiculos" method="post">
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-11">
                            <button class="btn btn-primary btn-sm">Gerar</button>
                        </div>
                    </div>
                </form>
            </div> 
        </div> 

    </div>
</div>
<!-- /.panel-body -->



<%@include file="rodape.jsp"%> 