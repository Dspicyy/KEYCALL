
<%@include file="cabecalho.jsp"%>
    
       
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-10">
                    <h1>Ramais</h1>
                </div>
                <div class="col-lg-2">
                    <button style="float: right" class="btn btn-primary" onclick="imprimir()"><i class="fa fa-print"></i></button>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-dismissable alert-warning">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        Seja Bem-vindo!
                        <br />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-tablet"></i> Ramais Disponíveis no IFSul Campus Bagé - RS</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-grid1"></div>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
    </div>
    <!-- /#wrapper -->
    <script type="text/javascript">
        jQuery(function ($) {
            var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                visits = [123, 323, 443, 32],
                traffic = [
                {
                    Ramal: 200, Lugar: "RECEPÇÃO", Nome: "Maria Inês"
                },
                {
                    Ramal: 203, Lugar: "Supervisão Pedagógica", Nome: "Alissandra / Alexandre / Alexsandra"
                },
                {
                    Ramal: 204, Lugar: "DEPEX", Change: 67, Nome: "Anelise"
                },
                {
                    Ramal: 206, Lugar: "GABINETE DA DIREÇÃO-GERAL", Nome: "Jozeline"
                },
                {
                    Ramal: 207, Lugar: "Sala de Reuniões", Nome: "----------"
                },
                {
                    Ramal: 210, Lugar: "DIREÇÃO GERAL", Nome: "Giulia"
                },
                {
                    Ramal: 211, Lugar: "Sala de Atendimento", Nome: "----------"
                },
                {
                    Ramal: 213, Lugar: "COTIC", Change: 23, Nome: "Rodrigo / Andressa"
                },
                {
                    Ramal: 216, Lugar: "Coordenadores de Curso", Nome: "----------"
                },
                {
                    Ramal: 218, Lugar: "DEAP", Change: 23, Nome: "Manoel"
                },
                {
                    Ramal: 219, Lugar: "COMAG", Change: 23, Nome: "Israel / Célio/ Maria Eduarda/ Bruna"
                },
                {
                    Ramal: 222, Lugar: "COAP", Change: 23, Nome: "Rita / Suziane / Roberta"
                },
                {
                    Ramal: 223, Lugar: "GABINETE DA DIREÇÃO-GERAL", Nome: "Jozeline"
                },
                {
                    Ramal: 226, Lugar: "Sala dos Professores - Bloco Administrativo", Nome: "----------"
                },
                {
                    Ramal: 229, Lugar: "Cozinha", Change: 23, Percent: 56, Nome: "----------"
                },
                {
                    Ramal: 231, Lugar: "COCAF", Change: 23, Percent: 56, Nome: "Saionara / Nelson / Alessandro / Ester"
                },
                {
                    Ramal: 233, Lugar: "COGEA", Change: 23, Percent: 56, Nome: "Renato / Emilena / Juliana"
                },
                {
                    Ramal: 234, Lugar: "COEX / COPESQ", Change: 23, Percent: 56, Nome: "Ânderson Ritta / Aline Leal"
                },
                {
                    Ramal: 237, Lugar: "Assistência Estudantil", Nome: "Fabiane"
                },{
                    Ramal: 238, Lugar: "COEFE", Change: 23, Nome: "Max"
                },{
                    Ramal: 240, Lugar: "Guarita", Change: 23, Nome: "Vigilantes"
                },
                {
                    Ramal: 244, Lugar: "Médico Veterinário - Bloco Agropecuária", Nome: "Samuel"
                },
                {
                    Ramal: 247, Lugar: "Sala dos Professores - Bloco Agropecuária", Nome: "----------"
                },
                {
                    Ramal: 248, Lugar: "Agroindústria", Change: 23, Nome: "Márcia"
                },
                {
                    Ramal: 249, Lugar: "Agropecuária", Change: 23, Nome: "Ivone"
                },
                {
                    Ramal: 253, Lugar: "Sala dos Professores Informática", Nome: "----------"
                },
                {
                    Ramal: 254, Lugar: "COLIC", Change: 23, Nome: "Daniel / Cintia / Anderson / Ester"
                },
                {
                    Ramal: 255, Lugar: "Assistente de Alunos", Nome: "Luciano / Remídio Alex / Roseli / Vilton"
                },{
                    Ramal: 267, Lugar: "Garagem", Nome: "Motoristas / Manutenção e Eletricista"
                },
                {
                    Ramal: 268, Lugar: "CORAC", Change: 23, Nome: "Ariela / Daren / Augusto"
                },
                             
                {
                    Ramal: 269, Lugar: "Biblioteca",Nome: "Daniel Cunha / Daniela / Alessandro / Viviane"
                }];


            $("#shieldui-chart1").shieldChart({
                theme: "dark",

                primaryHeader: {
                    text: "Visitors"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "area",
                    collectionAlias: "Q Data",
                    data: performance
                }]
            });

            $("#shieldui-chart2").shieldChart({
                theme: "dark",
                primaryHeader: {
                    text: "Traffic Per week"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "pie",
                    collectionAlias: "traffic",
                    data: visits
                }]
            });

            $("#shieldui-grid1").shieldGrid({
                dataSource: {
                    data: traffic
                },
                sorting: {
                    multiple: true
                },
                rowHover: false,
                paging: false,
                columns: [
                { field: "Ramal", width: "170px", title: "Ramal" },
                { field: "Lugar", title: "Lugar" },                
                { field: "Nome", title: "Nome" }
                ]
            });            
        });        
function imprimir() {
  window.print();
}
    </script>
</body>
</html>
