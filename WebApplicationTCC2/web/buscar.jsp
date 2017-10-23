<%-- 
    Document   : login
    Created on : Dec 19, 2016, 3:31:57 PM
    Author     : tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search project</title>
        <script src="Chart.js"></script>
        <script type="text/javascript" language="javascript" src="TableFilter/tablefilter.js"></script>  
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container text-center">
        <h1>Github Data</h1>
        <form action="BuscarServlet" method="POST">
            <h1>Search</h1>
            <input type="text" value="" name="namerepo" placeholder="Usuario" id="namerepo" required/>
            <input type="text" name="idrepo" value="" placeholder="Nome do projeto" id="idrepo" required/>
            <input type="submit" value="Buscar" name="op"/>
        </form>
        
        <hr>
        <!-- 
        <canvas id="myChart" width="400" height="400"></canvas>
        -->
        <div class="col-md-12">
            <label for="inputdefault">Projeto:</label>
             <select id="projeto">
                <option value="HearthSim-Hearthstone-Deck-Tracker">HearthSim-Hearthstone-Deck-Tracker</option>
                <option value="Una-CSSgram">Una-CSSgram</option>
              </select> 
        </div>
        
        <div class="col-md-4">
            <label for="inputdefault">Data Inicial:</label>
            <input type="text" class="form-control" id="dateStart" placeholder="Data inicial" aria-describedby="basic-addon1">
        </div>
        
        <div class="col-md-4">
            <label for="inputdefault">Data final:</label>
            <input type="text" class="form-control" id="dateEnd" placeholder="Data final" aria-describedby="basic-addon1">
        </div>
        
        <div class="col-md-4">
                <button type="button" class="btn btn-default" onclick="gerarVisualizacao2()">Calcular</button>
        </div>

        <div class="col-md-12">
            <div id="chart_div" style="height: 500px;"></div>
        </div>
        
        <div class="col-md-12">
            <div id="curve_chart" style="height: 500px"></div>
        </div>
        
        <!--<div class="input-group col-md-3">
            <span class="input-group-addon" id="basic-addon4">Total de Commits</span>
            <input type="text" class="form-control" id="numCommit" placeholder="commit" aria-describedby="basic-addon1">
        </div>-->
        
        <div class="col-md-12">
            <!-- Exemplo de texto dinamico html: http://www.hardware.com.br/comunidade/texto-muda/1378036/-->
            <p>O numero total de commits no período é <span id="numbercommit"></span>. Número total de Pull Requests aberto no peŕiodo é <span id="pullrequest"></span></p>
        </div>
        
        <div class="col-md-12">
            <input type="text"class="form-control" id="myInput" onkeyup="myFilter()" placeholder="Search for names..">
        </div>
        
        <div class="col-md-12" style="height:120px; overflow:auto;">
         <table id="teste2" class="table table-striped">
            <tr>
              <th>Arquivo</th>
              <th>Entropia</th>
              <th>Linhas adicionadas</th>
              <th>Linhas removidas</th>
              <th>Linhas Modificadas</th>
              <th>Defeitos</th>
            </tr>
         </table>
        </div>
        
        
        <!-- Treemap 2 -->
        
        <div class="col-md-12">
            <label for="inputdefault">Projeto:</label>
             <select id="projeto2">
                <option value="HearthSim-Hearthstone-Deck-Tracker">HearthSim-Hearthstone-Deck-Tracker</option>
                <option value="Una-CSSgram">Una-CSSgram</option>
              </select> 
        </div>
        
        <div class="col-md-4">
            <label for="inputdefault">Data Inicial:</label>
            <input type="text" class="form-control" id="dateStart2" placeholder="Data inicial" aria-describedby="basic-addon1">
        </div>
        
        <div class="col-md-4">
            <label for="inputdefault">Data final:</label>
            <input type="text" class="form-control" id="dateEnd2" placeholder="Data final" aria-describedby="basic-addon1">
        </div>
        
        <div class="col-md-4">
                <button type="button" class="btn btn-default" onclick="gerarVisualizacao3()">Calcular</button>
        </div>
        
        <div class="col-md-12">
            <div id="chart_div2" style="height: 500px;"></div>
        </div>
        
        <div class="col-md-12">
            <div id="curve_chart2" style="height: 500px"></div>
        </div>
        
        <!--
        <div class="input-group col-md-3">
            <span class="input-group-addon" id="basic-addon7">Total de Commits</span>
            <input type="text" class="form-control" id="numCommit2" placeholder="commit" aria-describedby="basic-addon1">
        </div>
        -->
        
        <div class="col-md-12">
            <!-- Exemplo de texto dinamico html: http://www.hardware.com.br/comunidade/texto-muda/1378036/-->
            <p>O numero total de commits no período é <span id="numbercommit2"></span>. Número total de Pull Requests aberto no peŕiodo é <span id="pullrequest2"></span></p>
        </div>
        
        <div class="col-md-12">
            <input type="text" class="form-control" id="myInput2" onkeyup="myFilter2()" placeholder="Search for names..">
        </div>
        
        <div class="col-md-12" style="height:120px; overflow:auto;">
         <table id="table2" cellspacing="0" class="table table-striped">
            <tr>
              <th>Arquivo</th>
              <th>Entropia</th>
              <th>Linhas adicionadas</th>
              <th>Linhas removidas</th>
              <th>Linhas Modificadas</th>
              <th>Defeitos</th>
            </tr>
         </table>
        </div>
        
        
        <div class="col-md-12">
        <div id="myDiv" style="width: 900px; height: 500px;"></div>
        </div>
        
        <div class="col-md-12">
        <div id="myDiv2" style="width: 900px; height: 500px;"></div>
        </div>
        
        
        <!-- Fecha container -->
        </div>
     
        
        <script>
            function myFilter() {
              // Declare variables
              var input, filter, table, tr, td, i;
              input = document.getElementById("myInput");
              filter = input.value.toUpperCase();
              table = document.getElementById("teste2");
              tr = table.getElementsByTagName("tr");

              // Loop through all table rows, and hide those who don't match the search query
              for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                  } else {
                    tr[i].style.display = "none";
                  }
                }
              }
            }
        </script>
        
         <script>
            function myFilter2() {
              // Declare variables
              var input, filter, table, tr, td, i;
              input = document.getElementById("myInput2");
              filter = input.value.toUpperCase();
              table = document.getElementById("table2");
              tr = table.getElementsByTagName("tr");

              // Loop through all table rows, and hide those who don't match the search query
              for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                  } else {
                    tr[i].style.display = "none";
                  }
                }
              }
            }
        </script>
        
        <script type="text/javascript">
        
        function gerarVisualizacao2(){    
            var returnedJson;
            var countCommit;
            var returnedJsonPull;
            var listcommit;
            //2016-10-14 2016-10-26
            var date1 = document.getElementById('dateStart').value;
            var date2 = document.getElementById('dateEnd').value;;
            var yourSelect = document.getElementById("projeto");
            var projeto = yourSelect.options[ yourSelect.selectedIndex ].value;
            
            //var tf1 = setFilterGrid("teste2");
            
            var urlcommitcount = 'http://localhost:9090/WebService/webresources/webservicegit/project/getcountcommitbydate/' + date1 + '/'+ date2 +'/' + projeto;
            var urlfiles = 'http://localhost:9090/WebService/webresources/webservicegit/project/getfilesbydate/'+ date1 + '/' + date2 +'/' + projeto;
            var urlpullrequest = 'http://localhost:9090/WebService/webresources/webservicegit/project/getPullRequestbydate/'+ date1 + '/' + date2 +'/'+ projeto;
            var urllistcommits = 'http://localhost:9090/WebService/webresources/webservicegit/project/getcommitsbydate/'+ date1 + '/' + date2 + '/' + projeto;
            
            $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urlfiles,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    returnedJson = data;
                    alert("Sucesso: ");
                    //chamar uma funcao aqui passando como parametro o data
                    //criar a função abaixo do data
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
            $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urlcommitcount,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    countCommit = data;
                    //chamar uma funcao aqui passando como parametro o data
                    //criar a função abaixo do data
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
           $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urlpullrequest,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    returnedJsonPull = data;
                    alert("Sucesso: ");
                    
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
           $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urllistcommits,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    listcommit = data;
                    
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
           //setar valores no texto 1
           //document.getElementById('numCommit').value = countCommit[0].numbercommit;
           var countCommitText = document.getElementById('numbercommit'); 
           countCommitText.innerHTML = countCommit[0].numbercommit;
           
           var pulltext = document.getElementById('pullrequest');
           pulltext.innerHTML = returnedJsonPull.length;
           
           //cabecalho treemap array
           var treeMapArray = [
                        ['Location', 'Parent', 'Market trade volume (size)', 'Market increase/decrease (color)'],
                        ['Project',    '',                 0,                               0]
                      ];
            
            var mapFiles = {};//numero de vezes que o arquivo foi commitado
            var mapFilesAdded = {}//numero de linhas adicionadas no total
            var mapFilesRemoved = {} // numero de linhas removidas
            var mapFilesChanged = {} //numero de linhas modificadas
            
            //arquivos (files)
            //Contagem de linhas modificadas e quantas vezes o arquivo foi comitado
            for (i = 0; i < returnedJson.length; i++) { 
                if(returnedJson[i].nameFile in mapFiles){
                    mapFiles[returnedJson[i].nameFile] = mapFiles[returnedJson[i].nameFile] + 1;
                    mapFilesAdded[returnedJson[i].nameFile] = mapFilesAdded[returnedJson[i].nameFile] + returnedJson[i].lineAdd;
                    mapFilesRemoved[returnedJson[i].nameFile] = mapFilesRemoved[returnedJson[i].nameFile] + returnedJson[i].lineDeleted;
                    mapFilesChanged[returnedJson[i].nameFile] = mapFilesChanged[returnedJson[i].nameFile] + returnedJson[i].lineChanged;       
                }else{
                    mapFiles[returnedJson[i].nameFile] = 1;
                    mapFilesAdded[returnedJson[i].nameFile] = returnedJson[i].lineAdd;
                    mapFilesRemoved[returnedJson[i].nameFile] = returnedJson[i].lineDeleted;
                    mapFilesChanged[returnedJson[i].nameFile] = returnedJson[i].lineChanged;
                }
            }
            
            //contar numero de defeitos considerando as palavras bug, fix, postfix, prefix
            var mapFileBug = {};//armazenar quantidade de defeitos em cada arquivo
            for (i = 0; i < listcommit.length; i++) {
                var message = listcommit[i].messageCommit;
                
                //se encontrou as palavras adicionar a lista
                if(message.indexOf("bug") !== -1 
                    || message.indexOf("fix") !== -1
                    || message.indexOf("postfix") !== -1
                    || message.indexOf("prefix") !== -1
                    ){
                    
                    var shacommit = listcommit[i].sha;
                    console.log(listcommit[i].sha);
                    for (j = 0; j < returnedJson.length; j++) {
                        //ver quais arquivos tem o mesmo sha e incrementar no map
                        if(shacommit === returnedJson[j].shaFile){
                            if(returnedJson[j].nameFile in mapFileBug){
                                mapFileBug[returnedJson[j].nameFile] = mapFileBug[returnedJson[j].nameFile] + 1;
                            }else{
                                mapFileBug[returnedJson[j].nameFile] = 1;
                            }
                        }
                    }
                }
            }
            //verificar quais arquivos nao tiveram defeitos e inserir na lista com valor 0
            for (i = 0; i < returnedJson.length; i++) { 
                if(!(returnedJson[i].nameFile in mapFileBug)){
                    mapFileBug[returnedJson[i].nameFile] = 0;
                }
            }
            
            //Inserindo os arquivos no array que ira gerar o treemap
            for (var name in mapFiles) {
                //treeMapArray.push([name, 'Project',mapFiles[name],mapFiles[name]]);
                
                var table = document.getElementById("teste2");
                var row = table.insertRow(table.rows.length);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                var cell6 = row.insertCell(5);
                cell1.innerHTML = name;
                cell2.innerHTML = mapFiles[name];
                cell3.innerHTML = mapFilesAdded[name];
                cell4.innerHTML = mapFilesRemoved[name];
                cell5.innerHTML = mapFilesChanged[name];
                cell6.innerHTML = mapFileBug[name];
                //var tf1 = setFilterGrid("teste2");
            }
            
            //for para dividir em pastas, pacotes
            var mapAllPath = {};//guardar todos os caminhos e subcaminhos da pasta para nao inserir um subcaminho igual
            for (var name in mapFiles) {
                var path = name.split("/");
                var pathaux = ""; //variavel para ir concatenando e verificando se ocaminho ja existe
                var pathparent = "";
                
                if(path.length > 1){
                    for(i = 0; i < path.length; i++){

                        pathparent = pathaux;

                        if(i != 0){
                            pathaux = pathaux + "/" +path[i];
                        }else{
                            pathaux = path[i];
                        }

                        if(pathaux in mapAllPath){
                            mapAllPath[pathaux] = mapAllPath[pathaux] + 1;
                        }else{
                            mapAllPath[pathaux] = 1;


                            if (i == 0){
                                treeMapArray.push([pathaux, "Project", 0, 0]);
                            }else if(i == path.length - 1){
                                treeMapArray.push([name, pathparent, mapFiles[name], mapFiles[name]]);
                            }else{
                                treeMapArray.push([pathaux, pathparent, 0, 0]);
                            }
                        }

                    }
                } else {
                    treeMapArray.push([name, 'Project',mapFiles[name],mapFiles[name]]);
                }
            }
            

            google.charts.load('current', {'packages':['treemap']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
              var data = google.visualization.arrayToDataTable(treeMapArray);

              tree = new google.visualization.TreeMap(document.getElementById('chart_div'));

              tree.draw(data, {
                minColor: '#f00',
                midColor: '#ddd',
                maxColor: '#0d0',
                headerHeight: 15,
                fontColor: 'black',
                showScale: true
              });

            }
            //fim treemap
            
            //timeline grafico
            //array para guardar os dados que serão plotados (quatidade de arquivos modificados por tempo)
            var arrayLine = [
                        ['Periodo', 'Quantidade de Arquivos','Quantidade de commits']
                        
                      ];
                      
            var numPeriodo = 0;
            var dInicio = new Date(date1);
            var dPeriodo = new Date(date1);
            var dFinal = new Date(date2);
            
            //setar o primeiro periodo
            dPeriodo.setDate(dPeriodo.getDate() + 15);
            console.log("date: " + dInicio);
            console.log("date: " + dPeriodo);
            console.log("date: " + dFinal);
            //https://www.w3schools.com/js/js_date_methods.asp
            
            while(dPeriodo <= dFinal){
                numPeriodo = numPeriodo + 1;
                var contaArquivo = 0;
                var contaCommit = 0;
                
                for (i = 0; i < listcommit.length; i++) {
                    var dateString = listcommit[i].dateCreate;
                    var date = new Date(dateString);
                    
                    if(date < dPeriodo && date >= dInicio){
                        contaCommit = contaCommit + 1;
                        var shaCommit = listcommit[i].sha;
                        for (j = 0; j < returnedJson.length; j++) {
                        //ver quais arquivos tem o mesmo sha e incrementar no map
                            if(shaCommit === returnedJson[j].shaFile){
                                 contaArquivo = contaArquivo + 1;
                            }
                        }
                        
                    }
                }
                
                arrayLine.push([numPeriodo.toString(), contaArquivo, contaCommit]);
                //Avançar 15 dias no periodo
                dInicio.setDate(dInicio.getDate() + 15);
                dPeriodo.setDate(dPeriodo.getDate() + 15);
                console.log("date dentro da funcao: " + dInicio);
                console.log("date dentro da funcao: " + dPeriodo);
                
            }
            
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart2);

            function drawChart2() {
              var data = google.visualization.arrayToDataTable(arrayLine);

              var options = {
                title: 'Quantidade de arquivos alterados',
                curveType: 'function',
                legend: { position: 'bottom' }
              };

              var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

              chart.draw(data, options);
            }
            //fim timeline grafico
            

        }
    
        </script>
    
    <script type="text/javascript">
       function gerarVisualizacao3(){    
            var returnedJson;
            var countCommit;
            var listcommit;
            var returnedJsonPull;
            //2016-10-14 2016-10-26
            var date1 = document.getElementById('dateStart2').value;
            var date2 = document.getElementById('dateEnd2').value;;
            var yourSelect = document.getElementById("projeto2");
            var projeto = yourSelect.options[ yourSelect.selectedIndex ].value;
            
            var urlcommit = 'http://localhost:9090/WebService/webresources/webservicegit/project/getcountcommitbydate/' + date1 + '/'+ date2 +'/' + projeto;
            var urlfiles = 'http://localhost:9090/WebService/webresources/webservicegit/project/getfilesbydate/'+ date1 + '/' + date2 +'/' + projeto;
            var urlpullrequest = 'http://localhost:9090/WebService/webresources/webservicegit/project/getPullRequestbydate/'+ date1 + '/' + date2 +'/'+ projeto;
            var urllistcommits = 'http://localhost:9090/WebService/webresources/webservicegit/project/getcommitsbydate/'+ date1 + '/' + date2 + '/' + projeto;
            
            $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urlfiles,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    returnedJson = data;
                    alert("Sucesso: ");
                    //chamar uma funcao aqui passando como parametro o data
                    //criar a função abaixo do data
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
            $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urlcommit,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    countCommit = data;
                    //chamar uma funcao aqui passando como parametro o data
                    //criar a função abaixo do data
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
           $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urlpullrequest,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    returnedJsonPull = data;
                    alert("Sucesso: ");
                    //chamar uma funcao aqui passando como parametro o data
                    //criar a função abaixo do data
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
           $.ajax({
               // GET is the default type, no need to specify it
               type: 'GET',
               url: urllistcommits,
               contentType: "application/json",
               dataType : 'json',
               crossDomain:true,
               async: false,
               success: function(data) {
                    //data is the object that youre after, handle it here

                    listcommit = data;
                    
               },
               error: function(e){
                    alert('Could not able to find location!' + e);
               }
           });
           
           //document.getElementById('numCommit2').value = countCommit[0].numbercommit;
           var countCommitText2 = document.getElementById('numbercommit2'); 
           countCommitText2.innerHTML = countCommit[0].numbercommit;
           
           var pulltext2 = document.getElementById('pullrequest2');
           pulltext2.innerHTML = returnedJsonPull.length;
           
           var treeMapArray = [
                        ['Location', 'Parent', 'Market trade volume (size)', 'Market increase/decrease (color)'],
                        ['Project',    '',                 0,                               0]
                      ];
            
            var mapFiles = {};     
            var mapFilesAdded = {};//numero de linhas adicionadas no total
            var mapFilesRemoved = {}; // numero de linhas removidas
            var mapFilesChanged = {}; //numero de linhas modificadas
            //data.length
            for (i = 0; i < returnedJson.length; i++) { 
                //treeMapArray.push([returnedJson[i].nameFile, 'Project',returnedJson[i].lineChanged,returnedJson[i].lineChanged]);
                if(returnedJson[i].nameFile in mapFiles){
                    mapFiles[returnedJson[i].nameFile] = mapFiles[returnedJson[i].nameFile] + 1;
                    mapFilesAdded[returnedJson[i].nameFile] = mapFilesAdded[returnedJson[i].nameFile] + returnedJson[i].lineAdd;
                    mapFilesRemoved[returnedJson[i].nameFile] = mapFilesRemoved[returnedJson[i].nameFile] + returnedJson[i].lineDeleted;
                    mapFilesChanged[returnedJson[i].nameFile] = mapFilesChanged[returnedJson[i].nameFile] + returnedJson[i].lineChanged;
                }else{
                    mapFiles[returnedJson[i].nameFile] = 1;
                    mapFilesAdded[returnedJson[i].nameFile] = returnedJson[i].lineAdd;
                    mapFilesRemoved[returnedJson[i].nameFile] = returnedJson[i].lineDeleted;
                    mapFilesChanged[returnedJson[i].nameFile] = returnedJson[i].lineChanged;
                }
            }
            
            //contar numero de defeitos considerando as palavras bug, fix, postfix, prefix
            var mapFileBug = {};//armazenar quantidade de defeitos em cada arquivo
            for (i = 0; i < listcommit.length; i++) {
                var message = listcommit[i].messageCommit;
                
                //se encontrou as palavras adicionar a lista
                if(message.indexOf("bug") !== -1 
                    || message.indexOf("fix") !== -1
                    || message.indexOf("postfix") !== -1
                    || message.indexOf("prefix") !== -1
                    ){
                    
                    var shacommit = listcommit[i].sha;
                    console.log(listcommit[i].sha);
                    for (j = 0; j < returnedJson.length; j++) {
                        //ver quais arquivos tem o mesmo sha e incrementar no map
                        if(shacommit === returnedJson[j].shaFile){
                            if(returnedJson[j].nameFile in mapFileBug){
                                mapFileBug[returnedJson[j].nameFile] = mapFileBug[returnedJson[j].nameFile] + 1;
                            }else{
                                mapFileBug[returnedJson[j].nameFile] = 1;
                            }
                        }
                    }
                }
            }
            
            //verificar quais arquivos nao tem defeitos e inserir na lsita com 0 no valor
            for (i = 0; i < returnedJson.length; i++) { 
                if(!(returnedJson[i].nameFile in mapFileBug)){
                    mapFileBug[returnedJson[i].nameFile] = 0;
                }
            }
            
            
            for (var name in mapFiles) {
                //treeMapArray.push([name, 'Project',mapFiles[name],mapFiles[name]]);
                
                var table = document.getElementById("table2");
                var row = table.insertRow(table.rows.length);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                var cell6 = row.insertCell(5);
                cell1.innerHTML = name;
                cell2.innerHTML = mapFiles[name];
                cell3.innerHTML = mapFilesAdded[name];
                cell4.innerHTML = mapFilesRemoved[name];
                cell5.innerHTML = mapFilesChanged[name];
                cell6.innerHTML = mapFileBug[name];
            }
            
            //for para dividir em pastas, pacotes
            var mapAllPath = {};//guardar todos os caminhos e subcaminhos da pasta para nao inserir um subcaminho igual
            for (var name in mapFiles) {
                var path = name.split("/");
                var pathaux = ""; //variavel para ir concatenando e verificando se ocaminho ja existe
                var pathparent = "";
                
                if(path.length > 1){
                    for(i = 0; i < path.length; i++){

                        pathparent = pathaux;

                        if(i != 0){
                            pathaux = pathaux + "/" +path[i];
                        }else{
                            pathaux = path[i];
                        }

                        if(pathaux in mapAllPath){
                            mapAllPath[pathaux] = mapAllPath[pathaux] + 1;
                        }else{
                            mapAllPath[pathaux] = 1;


                            if (i == 0){
                                treeMapArray.push([pathaux, "Project", 0, 0]);
                            }else if(i == path.length - 1){
                                treeMapArray.push([name, pathparent, mapFiles[name], mapFiles[name]]);
                            }else{
                                treeMapArray.push([pathaux, pathparent, 0, 0]);
                            }
                        }

                    }
                } else {
                    treeMapArray.push([name, 'Project',mapFiles[name],mapFiles[name]]);
                }
            }

            google.charts.load('current', {'packages':['treemap']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
              var data = google.visualization.arrayToDataTable(treeMapArray);

              tree = new google.visualization.TreeMap(document.getElementById('chart_div2'));

              tree.draw(data, {
                minColor: '#f00',
                midColor: '#ddd',
                maxColor: '#0d0',
                headerHeight: 15,
                fontColor: 'black',
                showScale: true
              });

            }
            //Fim treemap
            
            //timeline grafico
            //array para guardar os dados que serão plotados (quatidade de arquivos modificados por tempo)
            var arrayLine = [
                        ['Periodo', 'Quantidade de Arquivos','Quantidade de commits']
                        
                      ];
                      
            var numPeriodo = 0;
            var dInicio = new Date(date1);
            var dPeriodo = new Date(date1);
            var dFinal = new Date(date2);
            
            //setar o primeiro periodo
            dPeriodo.setDate(dPeriodo.getDate() + 15);
            console.log("date: " + dInicio);
            console.log("date: " + dPeriodo);
            console.log("date: " + dFinal);
            //https://www.w3schools.com/js/js_date_methods.asp
            
            while(dPeriodo <= dFinal){
                numPeriodo = numPeriodo + 1;
                var contaArquivo = 0;
                var contaCommit = 0;
                
                for (i = 0; i < listcommit.length; i++) {
                    var dateString = listcommit[i].dateCreate;
                    var date = new Date(dateString);
                    
                    if(date < dPeriodo && date >= dInicio){
                        contaCommit = contaCommit + 1;
                        var shaCommit = listcommit[i].sha;
                        for (j = 0; j < returnedJson.length; j++) {
                        //ver quais arquivos tem o mesmo sha e incrementar no map
                            if(shaCommit === returnedJson[j].shaFile){
                                 contaArquivo = contaArquivo + 1;
                            }
                        }
                        
                    }
                }
                
                arrayLine.push([numPeriodo.toString(), contaArquivo, contaCommit]);
                //Avançar 15 dias no periodo
                dInicio.setDate(dInicio.getDate() + 15);
                dPeriodo.setDate(dPeriodo.getDate() + 15);
                console.log("date dentro da funcao: " + dInicio);
                console.log("date dentro da funcao: " + dPeriodo);
                
            }
            
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart2);

            function drawChart2() {
              var data = google.visualization.arrayToDataTable(arrayLine);

              var options = {
                title: 'Quantidade de arquivos alterados',
                curveType: 'function',
                legend: { position: 'bottom' }
              };

              var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

              chart.draw(data, options);
            }
            //fim timeline grafico
           
        }
    </script>
    
    <script type="text/javascript">
      function myFunction() {
        var table = document.getElementById("teste2");
        var row = table.insertRow(0);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        cell1.innerHTML = "NEW CELL1";
        cell2.innerHTML = "NEW CELL2";
        cell3.innerHTML = 80;
        }
      
      var data = [
      {
        z: [[1, 20, 30, 50, 1], [20, 1, 60, 80, 30], [30, 60, 1, -10, 20]],
        x: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
        y: ['Morning', 'Afternoon', 'Evening'],
        type: 'heatmap'
      }
    ];

    Plotly.newPlot('myDiv', data);
    </script>
    
    <script type="text/javascript">
      var data = [
      {
        z: [[1, 20, 30, 50, 1], [20, 1, 60, 80, 30], [30, 60, 1, -10, 20]],
        x: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
        y: ['Morning', 'Afternoon', 'Evening'],
        type: 'heatmap'
      }
    ];

    Plotly.newPlot('myDiv2', data);
    </script>
    <!-- Tabela que lista arquivos e mostra as metricas desses arquivos: entropia, numero de defeitos etc (tcc)
        Um texto com numero de commits no periodo, valor da entropia media, valor de defeito médio, defeito maximo, numero de author
        Visualização treemap: escolher uma metrica para pintar treemap. colocar valores na legenda, dividindo em 5 partes iguais
    
        Colocar code churn, line added, line removed na tabela
    
        contar defeitos, analisar qualquer commit
    
        
    -->
    </body>
</html>
