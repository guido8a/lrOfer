<%@ page import="janus.Grupo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>
        Rubros
    </title>
    <script src="${resource(dir: 'js/jquery/plugins/jquery-validation-1.9.0', file: 'jquery.validate.min.js')}"></script>
    <script src="${resource(dir: 'js/jquery/plugins/jquery-validation-1.9.0', file: 'messages_es.js')}"></script>
    <script src="${resource(dir: 'js/jquery/plugins/', file: 'jquery.livequery.js')}"></script>
    <script src="${resource(dir: 'js/jquery/plugins/box/js', file: 'jquery.luz.box.js')}"></script>
    <link href="${resource(dir: 'js/jquery/plugins/box/css', file: 'jquery.luz.box.css')}" rel="stylesheet">
</head>

<body>

<div class="span12">
    <g:if test="${flash.message}">
        <div class="alert ${flash.clase ?: 'alert-info'}" role="status">
            <a class="close" data-dismiss="alert" href="#">×</a>
            ${flash.message}
        </div>
    </g:if>
</div>

<div class="span12 btn-group" role="navigation">
    <a href="#" class="btn  " id="btn_lista">
        <i class="icon-list-ul"></i>
        Lista
    </a>
    <a href="${g.createLink(action: 'rubroPrincipal')}" class="btn btn-ajax btn-new">
        <i class="icon-remove"></i>
        Cancelar
    </a>
<g:if test="${rubro}">
    <a href="#" class="btn btn-ajax btn-new" id="calcular" title="Calcular precios">
        <i class="icon-table"></i>
        Calcular
    </a>
    <a href="#" class="btn btn-ajax btn-new" id="imprimir" title="Imprimir">
        <i class="icon-print"></i>
        Imprimir
    </a>
    <a href="#" class="btn btn-ajax btn-new" id="vae" title="Imprimir Vae">
        <i class="icon-print"></i>
        Imprimir Vae
    </a>
    <a href="#" class="btn btn-ajax btn-new" id="excel" title="Imprimir">
        <i class="icon-print"></i>
        Excel
    </a>
    <a href="#" class="btn btn-ajax btn-new" id="excelVae" title="Imprimir Excel Vae">
        <i class="icon-print"></i>
        Excel Vae
    </a>
    </g:if>
%{--
    <g:if test="${rubro}">
        <a href="#" id="detalle" class="btn btn-ajax btn-new" >
            <i class="icon-list"></i>
            Especificaciones
        </a>

    </g:if>
    <g:if test="${rubro}">
        <a href="#" id="foto" class="btn btn-ajax btn-new" >
            <i class="icon-picture"></i>
            Ilustración
        </a>

    </g:if>
--}%
</div>


<div id="list-grupo" class="span12" role="main" style="margin-top: 10px;margin-left: -10px">

<div style="border-bottom: 1px solid black;padding-left: 50px;position: relative;">
    <g:form class="frmRubro" action="save">
        <input type="hidden" id="rubro__id" name="rubro.id" value="${rubro?.id}">

        <p class="css-vertical-text">Rubro</p>

        <div class="linea" style="height: 60px;"></div>

        <div class="row-fluid">
            <div class="span2">
                Código
                <input type="text" name="rubro.codigo" class="span24" value="${rubro?.codigo}" id="input_codigo" readonly="">
            </div>

            <div class="span7" style="width: 120px;">
                Especificación
                %{--<input type="text" name="rubro.nombre" class="span72" value="${rubro?.nombre}" id="input_descripcion"readonly="">--}%
                %{--<input type="text" name="rubro.nombre" class="span72" value="${rubro?.nombre}" id="input_descripcion"readonly="">--}%
                <input type="text" name="rubro.codigoEspecificacion" class="span1" value="${rubro?.codigoEspecificacion}" id="input_codigo_es" readonly style="width:120px">
            </div>
            <div class="span7">
                Descripción
                <input type="text" name="rubro.nombre" class="span72" value="${rubro?.nombre}" id="input_descripcion"readonly="">
            </div>
            <div class="span2" style="width: 60px;">
                Unidad
                <input type="text" name="unidad.id" class="span2" value="${rubro?.unidad?.descripcion}" readonly="" style="width:100px;">
            </div>
        </div>
        <div class="row-fluid">

        </div>
    </g:form>
</div>

<div style="border-bottom: 1px solid black;padding-left: 50px;margin-top: 10px;position: relative;">
    <p class="css-vertical-text">Items</p>

    <div class="linea" style="height: 100px;"></div>

    <div class="row-fluid">
        <div class="span12" style="color: #008">
            Porcentaje de costos indirectos
            <input type="text" style="width: 40px; color: #008; text-align: right" id="costo_indi" value="${(obra)?obra.totales:'20'}">
        </div>
    </div>

    <div class="row-fluid" style="margin-bottom: 5px">
        <div class="span2" style="margin-right: 0px">
            Código
            <input type="text" name="item.codigo" id="cdgo_buscar" style="width: 105px;" readonly="">
            <input type="hidden" id="item_id">
            <input type="hidden" id="item_tipoLista">
        </div>

        <div class="span5" style="margin-left: -30px; width: 470px" >
            Descripción
            <input type="text" name="item.descripcion" id="item_desc" style="width: 450px" readonly="">
        </div>

        <div class="span1" style="margin-left: 5px" >
            Unidad
            <input type="text" name="item.unidad" id="item_unidad" class="span8" readonly="">
        </div>
        <div class="span2" style="margin-left: -12px; width: 130px">
            Precio incluye transp.
            <input type="text" name="item.precio" class="span12" id="item_precio" value="1" style="text-align: right; width: 120px;">
        </div>

        <div class="span1" style="margin-left: 5px">
            Cantidad
            <input type="text" name="item.cantidad" class="span12" id="item_cantidad" value="1" style="text-align: right">
        </div>

        <div class="span2" style="margin-left: 10px; width: 100px">
            Rendimiento
            <input type="text" name="item.rendimiento" class="span12" id="item_rendimiento" value="1" style="text-align: right;width: 100px;" >
        </div>
        <div class="span2" style="margin-left: 10px; width: 60px">
            VAE (%)
            <input type="text" name="item.vae" class="span12" id="item_vae" value="100" style="text-align: right;width: 60px;" >
        </div>

        <div class="span1" style="border: 0px solid black;height: 45px;padding-top: 22px;margin-left: 15px; width: 35px">
            <a class="btn btn-small btn-primary btn-ajax" href="#" rel="tooltip" title="Agregar" id="btn_agregarItem">
                <i class="icon-plus"></i>
            </a>
        </div>

    </div>
</div>

<input type="hidden" id="actual_row">
<div style="border-bottom: 1px solid black;padding-left: 50px;position: relative;float: left;width: 95%" id="tablas">
    <p class="css-vertical-text">Composición</p>

    <div class="linea" style="height: 98%;"></div>
    <table class="table table-bordered table-striped table-condensed table-hover" style="margin-top: 10px;">
        <thead>
        <tr>
            <th style="width: 80px;">
                Código
            </th>
            <th style="width: 600px;">
                Descripción Equipo
            </th>
            <th style="width: 80px;">
                Cantidad
            </th>
            <th class="col_tarifa" style="display: none;">Tarifa <br>($/hora)</th>
            <th class="col_hora" style="display: none;">Costo($)</th>
            <th class="col_rend" style="width: 50px">Rendimiento</th>
            <th class="col_total" style="display: none;">C.Total($)<br>($/hora)</th>
            <th style="width: 40px" class="col_delete"></th>
        </tr>
        </thead>
        <tbody id="tabla_equipo">
        <g:each in="${items}" var="rub" status="i">
            <g:if test="${rub.item.departamento.subgrupo.grupo.id == 3}">
                <tr class="item_row" id="${rub.id}" tipo="${rub.item.departamento.subgrupo.grupo.id}">
                    <td class="cdgo">${rub.item.codigo}</td>
                    <td>${rub.item.nombre}</td>
                    <td style="text-align: right" class="cant">
                        <g:formatNumber number="${rub.cantidad}" format="##,#####0" minFractionDigits="5" maxFractionDigits="7"  locale="ec"  />
                    </td>

                    <td class="col_tarifa" style="display: none;text-align: right" id="i_${rub.item.id}"></td>
                    <td class="col_hora" style="display: none;text-align: right"></td>
                    <td class="col_rend rend" style="width: 50px;text-align: right"  valor="${rub.rendimiento}">
                        <g:formatNumber number="${rub.rendimiento}" format="##,#####0" minFractionDigits="5" maxFractionDigits="7" locale="ec" />
                    </td>
                    <td class="col_total" style="display: none;text-align: right"></td>
                    <td style="width: 40px;text-align: center" class="col_delete">
                        <a class="btn btn-small btn-danger borrarItem" href="#" rel="tooltip" title="Eliminar" iden="${rub.id}">
                            <i class="icon-trash"></i></a>
                    </td>
                </tr>
            </g:if>
        </g:each>
        </tbody>
    </table>
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 80px;">
                Código
            </th>
            <th style="width: 600px;">
                Descripción Mano de obra
            </th>
            <th style="width: 80px">
                Cantidad
            </th>

            <th class="col_jornal" style="display: none;"  >Jornal<br>($/hora)</th>
            <th class="col_hora" style="display: none;">Costo($)</th>
            <th class="col_rend" style="width: 50px;">Rendimiento</th>
            <th class="col_total" style="display: none;">C.Total($)</th>
            <th style="width: 40px" class="col_delete"></th>
        </tr>
        </thead>
        <tbody id="tabla_mano">
        <g:each in="${items}" var="rub" status="i">
            <g:if test="${rub.item.departamento.subgrupo.grupo.id == 2}">
                <tr class="item_row" id="${rub.id}" tipo="${rub.item.departamento.subgrupo.grupo.id}">
                    <td class="cdgo">${rub.item.codigo}</td>
                    <td>${rub.item.nombre}</td>
                    <td style="text-align: right" class="cant">
                        <g:formatNumber number="${rub.cantidad}" format="##,#####0" minFractionDigits="5" maxFractionDigits="7" locale="ec"  />
                    </td>

                    <td class="col_jornal" style="display: none;text-align: right" id="i_${rub.item.id}"></td>
                    <td class="col_hora" style="display: none;text-align: right"></td>
                    <td class="col_rend rend" style="width: 50px;text-align: right"  valor="${rub.rendimiento}">
                        <g:formatNumber number="${rub.rendimiento}" format="##,#####0" minFractionDigits="5" maxFractionDigits="7" locale="ec"  />
                    </td>
                    <td class="col_total" style="display: none;text-align: right"></td>
                    <td style="width: 40px;text-align: center" class="col_delete">
                        <a class="btn btn-small btn-danger borrarItem" href="#" rel="tooltip" title="Eliminar" iden="${rub.id}">
                            <i class="icon-trash"></i></a>
                    </td>
                </tr>
            </g:if>
        </g:each>
        </tbody>
    </table>
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 80px;">
                Código
            </th>
            <th style="width: 600px;">
                Descripción Material
            </th>
            <th style="width: 60px" class="col_unidad">
                Unidad
            </th>
            <th style="width: 80px">
                Cantidad
            </th>
            <th style="width: 40px" class="col_delete"></th>
            <th class="col_precioUnit" style="display: none;">Unitario</th>
            <th class="col_vacio" style="width: 55px;display: none"></th>
            <th class="col_vacio" style="width: 55px;display: none"></th>
            <th class="col_total" style="display: none;">C.Total($)</th>
        </tr>
        </thead>
        <tbody id="tabla_material">
        <g:each in="${items}" var="rub" status="i">
            <g:if test="${rub.item.departamento.subgrupo.grupo.id == 1}">
                <tr class="item_row" id="${rub.id}" tipo="${rub.item.departamento.subgrupo.grupo.id}">
                    <td class="cdgo">${rub.item.codigo}</td>
                    <td>${rub.item.nombre}</td>
                    <td style="width: 60px !important;text-align: center" class="col_unidad">${rub.item.unidad.codigo}</td>
                    <td style="text-align: right" class="cant">
                        <g:formatNumber number="${rub.cantidad}" format="##,#####0" minFractionDigits="5" maxFractionDigits="7"  locale="ec"  />
                    </td>
                    <td class="col_precioUnit" style="display: none;text-align: right" id="i_${rub.item.id}"></td>
                    <td class="col_vacio" style="width: 50px;display: none;"></td>
                    <td class="col_vacio" style="width: 50px;display: none"></td>
                    <td class="col_total" style="display: none;text-align: right"></td>
                    <td style="width: 40px;text-align: center" class="col_delete">
                        <a class="btn btn-small btn-danger borrarItem" href="#" rel="tooltip" title="Eliminar" iden="${rub.id}">
                            <i class="icon-trash"></i></a>
                    </td>
                </tr>
            </g:if>
        </g:each>
        </tbody>
    </table>
    <div id="tabla_transporte"></div>
    <div id="tabla_indi"></div>
    <div id="tabla_costos" style="height: 120px;display: none;float: right;width: 100%;margin-bottom: 10px;"></div>
</div>

</div>

<div class="modal grande hide fade " id="modal-rubro" style=";overflow: hidden;">
    <div class="modal-header btn-info">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3 id="modalTitle"></h3>
    </div>

    <div class="modal-body" id="modalBody">
        <bsc:buscador name="rubro.buscador.id" value="" accion="buscaRubro" controlador="rubro" campos="${campos}" label="Rubro" tipo="lista"/>
    </div>

    <div class="modal-footer" id="modalFooter">
    </div>
</div>
<div class="modal large hide fade " id="modal-detalle" style=";overflow: hidden;">
    <div class="modal-header btn-info">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3 id="modalTitle-detalle">Especificaciones</h3>
    </div>

    <div class="modal-body" id="modalBody-detalle">
        Especificaciones:<br>
        <textarea id="especificaciones" style="width: 700px;height: 150px;resize: none;margin-top: 10px">
            ${rubro?.especificaciones}
        </textarea>
    </div>

    <div class="modal-footer" id="modalFooter-detalle">
        <a href="#"id="save-espc" class="btn btn-info">Guardar</a>
    </div>
</div>

<script type="text/javascript">
    function agregar(id,tipo){
        var tipoItem=$("#item_id").attr("tipo")
        var cant = $("#item_cantidad").val()
        if (cant == "")
            cant = 0
        if (isNaN(cant))
            cant = 0
        if(tipoItem*1>1){
            if(cant>0){
                var c = Math.ceil(cant)
//                console.log(c)
                if(c>cant){
                    cant=0
                }
            }
        }
        var rend = $("#item_rendimiento").val()
        if (isNaN(rend))
            rend = 1
        var precio = $("#item_precio").val()
        if (isNaN(precio))
            precio = 0

        var vae = $("#item_vae").val()
        if (isNaN(vae))
            vae = 0

        if ($("#item_id").val() * 1 > 0) {
            if (cant > 0 && precio>0) {
                var data = "rubro=${rubro?.id}&item=" + $("#item_id").val() + "&cantidad=" + cant + "&rendimiento=" + rend+"&precio="+precio+"&vae="+vae
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'addItem')}",
                    data     : data,
                    success  : function (msg) {
                        if(tipo=="H"){
                            window.location.href="${g.createLink(action: 'rubroPrincipal')}?idRubro="+id
                        }
                        var tr = $("<tr class='item_row'>")
                        var td = $("<td>")
                        var band = true
                        var parts = msg.split(";")
                        tr.attr("id", parts[1])
                        tr.attr("tipoLista", parts[5])
                        var a
                        td.addClass("cdgo")
                        td.html($("#cdgo_buscar").val())
                        tr.append(td)
                        td = $("<td>")
                        td.html($("#item_desc").val())
                        tr.append(td)

                        if (parts[0] == "1") {
                            $("#tabla_material").children().find(".cdgo").each(function () {
//                                    ////console.log($(this))
                                if ($(this).html() == $("#cdgo_buscar").val()) {
                                    var tdCant = $(this).parent().find(".cant")
                                    var tdRend = $(this).parent().find(".rend")
                                    tdCant.html(number_format(parts[3], 5, ".", ""))
                                    tdRend.html(number_format(parts[4], 7, ".", ""))
                                    tdRend.attr("valor", parts[4]);
                                    band = false
                                }
                            });
                            if (band) {
                                td = $("<td style='text-align: center' class='col_unidad'>")
                                td.html($("#item_unidad").val())
                                tr.append(td)
                                td = $("<td style='text-align: right' class='cant'>")
                                td.html(number_format($("#item_cantidad").val(), 5, ".", ""))
                                tr.append(td)
                                td = $('<td class="col_precioUnit" style="display: none;text-align: right"></td>');
                                td.attr("id", "i_" + parts[2])
                                tr.append(td)
                                td = $('<td class="col_vacio" style="width: 40px;display: none"></td>');
                                tr.append(td)
                                td = $('<td class="col_vacio" style="width: 40px;display: none"></td>');
                                tr.append(td)
                                td = $('<td class="col_total" style="display: none;text-align: right"></td>');
                                tr.append(td)
                                td = $('<td  style="width: 40px;text-align: center" class="col_delete">')
                                a = $('<a class="btn btn-small btn-danger borrarItem" href="#" rel="tooltip" title="Eliminar" iden="' + parts[1] + '"><i class="icon-trash"></i></a>')
                                td.append(a)
                                tr.append(td)
                                $("#tabla_material").append(tr)
                            }

                        } else {
                            if (parts[0] == "2") {

                                $("#tabla_mano").children().find(".cdgo").each(function () {
//                                        ////console.log("mano de obra ",parts)
                                    if ($(this).html() == $("#cdgo_buscar").val()) {
                                        var tdCant = $(this).parent().find(".cant")
                                        var tdRend = $(this).parent().find(".rend")
                                        tdCant.html(number_format(parts[3], 5, ".", ""))
                                        tdRend.html(number_format(parts[4], 7, ".", ""))
                                        tdRend.attr("valor", parts[4]);
                                        band = false
                                    }
                                });
                                if (band) {
                                    td = $("<td style='text-align: right' class='cant'>")
                                    td.html(number_format(parts[3], 5, ".", ""))
                                    tr.append(td)
                                    td = $('<td class="col_jornal" style="display: none;text-align: right"></td>');
                                    td.attr("id", "i_" + parts[2])
                                    tr.append(td)
                                    td = $('<td class="col_hora" style="display: none;text-align: right"></td>');
                                    tr.append(td)
                                    td = $("<td style='text-align: right' class='col_rend rend'>")
                                    td.attr("valor", parts[4]);
                                    td.html(number_format(parts[4], 5, ".", ""))
                                    tr.append(td)
                                    td = $('<td class="col_total" style="display: none;text-align: right"></td>');
                                    tr.append(td)
                                    td = $('<td  style="width: 40px;text-align: center" class="col_delete">')
                                    a = $('<a class="btn btn-small btn-danger borrarItem" href="#" rel="tooltip" title="Eliminar" iden="' + parts[1] + '"><i class="icon-trash"></i></a>')
                                    td.append(a)
                                    tr.append(td)
                                    $("#tabla_mano").append(tr)
                                }

                            } else {
                                $("#tabla_equipo").children().find(".cdgo").each(function () {
                                    if ($(this).html() == $("#cdgo_buscar").val()) {

                                        var tdCant = $(this).parent().find(".cant")
                                        var tdRend = $(this).parent().find(".rend")
                                        tdCant.html(number_format(parts[3], 5, ".", ""))
                                        tdRend.html(number_format(parts[4], 7, ".", ""))
                                        tdRend.attr("valor", parts[4]);
                                        band = false
                                    }
                                });

                                if (band) {
                                    td = $("<td style='text-align: right' class='cant'>")
                                    td.html(number_format(parts[3], 5, ".", ""))
                                    tr.append(td)
                                    td = $('<td class="col_tarifa" style="display: none;text-align: right"></td>');
                                    td.attr("id", "i_" + parts[2])
                                    tr.append(td)
                                    td = $('<td class="col_hora" style="display: none;text-align: right"></td>');
                                    tr.append(td)
                                    td = $("<td style='text-align: right' class='col_rend rend'>");
                                    td.attr("valor", parts[4]);
                                    td.html(number_format(parts[4], 5, ".", ""))
                                    tr.append(td)
                                    td = $('<td class="col_total" style="display: none;text-align: right"></td>');
                                    tr.append(td)
                                    td = $('<td  style="width: 40px;text-align: center" class="col_delete">')
                                    a = $('<a class="btn btn-small btn-danger borrarItem" href="#" rel="tooltip" title="Eliminar" iden="' + parts[1] + '"><i class="icon-trash"></i></a>')
                                    td.append(a)
                                    tr.append(td)
                                    $("#tabla_equipo").append(tr)
                                }
                            }
                        }

                        tr.bind("dblclick", function () {
                            var row = $(this)
                            var hijos = row.children()
                            var desc = $(hijos[1]).html()
                            var cant
                            var codigo = $(hijos[0]).html()
                            var unidad
                            var rendimiento
                            var item
                            var tipo = row.attr("tipo")
                            for (i = 2; i < hijos.length; i++) {

                                if ($(hijos[i]).hasClass("cant"))
                                    cant = $(hijos[i]).html()
                                if ($(hijos[i]).hasClass("col_unidad"))
                                    unidad = $(hijos[i]).html()
                                if ($(hijos[i]).hasClass("col_rend"))
                                    rendimiento = $(hijos[i]).attr("valor")
                                if ($(hijos[i]).hasClass("col_tarifa"))
                                    item = $(hijos[i]).attr("id")
                                if ($(hijos[i]).hasClass("col_precioUnit"))
                                    item = $(hijos[i]).attr("id")
                                if ($(hijos[i]).hasClass("col_jornal"))
                                    item = $(hijos[i]).attr("id")

                            }
                            item = item.replace("i_", "")
                            $("#item_cantidad").val(cant.toString().trim())
                            if (rendimiento)
                                $("#item_rendimiento").val(rendimiento.toString().trim())
                            $("#item_id").val(item)
                            $("#item_id").attr("tipo",tipo)
                            $("#cdgo_buscar").val(codigo)
                            $("#item_desc").val(desc)
                            $("#item_unidad").val(unidad)
                            $("#item_vae").val(vae)
                            getPrecio();


                        })

                        if (a) {
                            a.bind("click", function () {
                                var tr = $(this).parent().parent()
                                if (confirm("Esta seguro de eliminar este registro? Esta acción es irreversible")) {
                                    $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'eliminarRubroDetalle')}",
                                        data     : "id=" + $(this).attr("iden"),
                                        success  : function (msg) {
                                            if (msg == "Registro eliminado") {
                                                tr.remove()
                                            }

                                            $.box({
                                                imageClass : "box_info",
                                                text       : msg,
                                                title      : "Alerta",
                                                iconClose  : false,
                                                dialog     : {
                                                    resizable : false,
                                                    draggable : false,
                                                    buttons   : {
                                                        "Aceptar" : function () {
                                                        }
                                                    }
                                                }
                                            });

                                        }
                                    });
                                }

                            });
                        }

                        $("#item_desc").val("")
                        $("#item_id").val("")
                        $("#item_cantidad").val("1")
                        $("#cdgo_buscar").val("")
                        $("#item_unidad").val("")
//                        $("#item_rendimiento").val("1")
                        $("#item_precio").val("1")
                        $("#item_vae").val("100")

                        $("#cdgo_buscar").focus()
//                            $("#item_rendimiento").val("1")
                    }
                });
            } else {
                var msg = "La cantidad debe ser un número positivo."
                if(tipoItem*1>1){
                    msg="Para mano de obra y equipos, la cantidad debe ser un número entero positivo."
                }
                $.box({
                    imageClass : "box_info",
                    text       : msg,
                    title      : "Alerta",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        }
                    }
                });
            }
        } else {
            $.box({
                imageClass : "box_info",
                text       : "Seleccione un item",
                title      : "Alerta",
                iconClose  : false,
                dialog     : {
                    resizable : false,
                    draggable : false,
                    buttons   : {
                        "Aceptar" : function () {
                        }
                    }
                }
            });
        }
    }
    function getPrecio(){
        $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'getPrecioOferente')}",
            data     : "id="+$("#item_id").val(),
            success  : function (msg) {
//                console.log(msg)
                $("#item_precio").val(number_format(msg.split('_')[0], 2, ".", ""))
                $("#item_vae").val(number_format(msg.split('_')[1], 2, ".", ""))
            }
        });
    }

    function enviarItem() {
        var data = "";
        $("#buscarDialog").hide();
        $("#spinner").show();
        $(".crit").each(function () {
            data += "&campos=" + $(this).attr("campo");
            data += "&operadores=" + $(this).attr("operador");
            data += "&criterios=" + $(this).attr("criterio");
        });
        if (data.length < 2) {
            data = "tc=" + $("#tipoCampo").val() + "&campos=" + $("#campo :selected").val() + "&operadores=" + $("#operador :selected").val() + "&criterios=" + $("#criterio").val()
        }
        data += "&ordenado=" + $("#campoOrdn :selected").val() + "&orden=" + $("#orden :selected").val();
        $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'buscaItem')}",
            data     : data,
            success  : function (msg) {
                $("#spinner").hide();
                $("#buscarDialog").show();
                $(".contenidoBuscador").html(msg).show("slide");
            }
        });

    }

    function enviarCopiar() {
        var data = "";
        $("#buscarDialog").hide();
        $("#spinner").show();
        $(".crit").each(function () {
            data += "&campos=" + $(this).attr("campo");
            data += "&operadores=" + $(this).attr("operador");
            data += "&criterios=" + $(this).attr("criterio");
        });
        if (data.length < 2) {
            data = "tc=" + $("#tipoCampo").val() + "&campos=" + $("#campo :selected").val() + "&operadores=" + $("#operador :selected").val() + "&criterios=" + $("#criterio").val()
        }
        data += "&ordenado=" + $("#campoOrdn :selected").val() + "&orden=" + $("#orden :selected").val();
        $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'buscaRubroComp')}",
            data     : data,
            success  : function (msg) {
                $("#spinner").hide();
                $("#buscarDialog").show();
                $(".contenidoBuscador").html(msg).show("slide");
            }
        });
    }

    %{--function transporte(){--}%
    %{--var dsp0=$("#dist_p1").val()--}%
    %{--var dsp1=$("#dist_p2").val()--}%
    %{--var dsv0=$("#dist_v1").val()--}%
    %{--var dsv1=$("#dist_v2").val()--}%
    %{--var dsv2=$("#dist_v3").val()--}%
    %{--var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()--}%
    %{--var volqueta=$("#costo_volqueta").val()--}%
    %{--var chofer=$("#costo_chofer").val()--}%

    %{--$.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'transporte')}",--}%
    %{--data     : "dsp0="+dsp0+"&dsp1="+dsp1+"&dsv0="+dsv0+"&dsv1="+dsv1+"&dsv2="+dsv2+"&prvl="+volqueta+"&prch="+chofer+"&fecha="+$("#fecha_precios").val()+"&id=${rubro?.id}&lugar="+$("#ciudad").val()+"&listas="+listas+"&chof="+$("#cmb_chof").val()+"&volq="+$("#cmb_vol").val(),--}%
    %{--success  : function (msg) {--}%
    %{--$("#tabla_transporte").html(msg)--}%
    %{--tablaIndirectos();--}%
    %{--}--}%
    %{--});--}%

    %{--}--}%

    function totalEquipos(){
        var trE=$("<tr id='total_equipo' class='total'>")
        var equipos = $("#tabla_equipo").children()
        var totalE= 0
        var td=$("<td>")
        td.html("<b>SUBTOTAL</b>")
        trE.append(td)
        for(i=0;i<5;i++){
            td=$("<td>")
            trE.append(td)
        }

        equipos.each(function(){
            totalE+=parseFloat($(this).find(".col_total").html())
        })

        td=$("<td class='valor_total'  style='text-align: right;;font-weight: bold'>")
        td.html(number_format(totalE, 5, ".", ""))
        trE.append(td)
        $("#tabla_equipo").append(trE)
        tablaIndirectos();
    }


    function calculaHerramientas(){
//        console.log("calc herramientas")
        var h2 = $("#i_820")  //herramientas al 2% no se usa
        var h3 = $("#i_818")  //herramientas al 3%
        var h5 = $("#i_819")  //herramientas al 5%
        var h
        var precio =0
        if(h2.html()){
            h=h2
            precio=0.02
        }
        if(h3.html()){
            h=h3
            precio=0.03

        }
        if(h5.html()){
            h=h5
            precio=0.05
        }

        if(h){

//            var listas =""+$("#lista_1").val()+"#"+$("#lista_2").val()+"#"+$("#lista_3").val()+"#"+$("#lista_4").val()+"#"+$("#lista_5").val()+"#"+$("#ciudad").val()

            var datos = "tipo=C"+"&ids="+ str_replace("i_","",h.attr("id"))
//            $.each(items, function () {
//                datos += $(this).attr("id") + "#"
//            });
//            var datos = "fecha=" + $("#fecha_precios").val() + "&ciudad=" + $("#ciudad").val() + "&ids="+ str_replace("i_","",h.attr("id"))
//            console.log("si h",h,h.attr("id"))
//            console.log("si h",str_replace("i_","",h.attr("id")) )
            %{--$.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'getPreciosItem')}",--}%
            %{--data     : datos,--}%
            %{--success  : function (msg) {--}%
            %{--var precios = msg.split("&")--}%
            %{--//                     console.log(msg)--}%
            %{--for(i=0;i<precios.length;i++){--}%
            %{--var parts = precios[i].split(";")--}%
            %{--//                        console.log(parts,parts.length)--}%
            %{--if(parts.length>1){--}%
            %{--precio = parseFloat(parts[1].trim())--}%

            %{--}--}%


            %{--}--}%

            var padre = h.parent()
            var rend = padre.find(".rend")
            var hora = padre.find(".col_hora")
            var total= padre.find(".col_total")
            var cant = padre.find(".cant")
            var tarifa = padre.find(".col_tarifa")
            rend.html(number_format(1, 5, ".", ""))
            cant.html(number_format($("#total_mano").find(".valor_total").html(), 5, ".", ""))
//                    console.log("cantidad",$("#total_mano").find(".valor_total").html())
//                    console.log(number_format($("#total_mano").find(".valor_total").html(), 5, ".", ""))
            tarifa.html(number_format(precio, 5, ".", ""))
            hora.html(number_format(parseFloat(cant.html())*parseFloat(tarifa.html()), 5, ".", ""))
            total.html(number_format(parseFloat(hora.html())*parseFloat(rend.html()), 5, ".", ""))
            totalEquipos()
        } else{
            totalEquipos()
        }
//            });
//
//
//        }

    }


    function calcularTotales(){
        var materiales = $("#tabla_material").children()
        var equipos = $("#tabla_equipo").children()
        var manos = $("#tabla_mano").children()
        var totalM= 0,totalE= 0,totalMa=0
        var trM=$("<tr id='total_material' class='total'>")
        var trMa=$("<tr id='total_mano' class='total'>")
        var trE=$("<tr id='total_equipo' class='total'>")

        var td=$("<td>")
        td.html("<b>SUBTOTAL</b>")
        trM.append(td)
        td=$("<td>")
        td.html("<b>SUBTOTAL</b>")
        trMa.append(td)
        td=$("<td>")
        td.html("<b>SUBTOTAL</b>")
        trE.append(td)
        for(i=0;i<5;i++){
            td=$("<td>")
            trM.append(td)
            td=$("<td>")
            trMa.append(td)
            td=$("<td>")
            trE.append(td)
        }

        td=$("<td>")
        trM.append(td)
        materiales.each(function(){
//            console.log($(this),$(this).find(".col_total").html())
            var val =$(this).find(".col_total").html()
            if(val=="")
                val=0
            if(isNaN(val))
                val=0
//            console.log(val)
            totalM+=parseFloat(val)
        })
        manos.each(function(){
            totalMa+=parseFloat($(this).find(".col_total").html())
        })
        td=$("<td class='valor_total' style='text-align: right;font-weight: bold'>")
        td.html(number_format(totalM, 5, ".", ""))
        trM.append(td)
        td=$("<td class='valor_total'  style='text-align: right;font-weight: bold'>")
        td.html(number_format(totalMa, 5, ".", ""))
        trMa.append(td)
        $("#tabla_material").append(trM)
        $("#tabla_mano").append(trMa)
//        console.log(totalMa)
        $("#totMat_h").val(totalMa)
        calculaHerramientas()
    }

    function tablaIndirectos(){
        var total=0
        $(".valor_total").each(function(){
            total+=$(this).html()*1
        })
        var indi = $("#costo_indi").val()
        if(isNaN(indi))
            indi=21
        indi=parseFloat(indi)
        var tabla = $('<table class="table table-bordered table-striped table-condensed table-hover">')
        tabla.append("<thead><tr><th colspan='3'>Costos indirectos</th></tr><tr><th style='width: 885px;'>Descripción</th><th style='text-align: right'>Porcentaje</th><th style='text-align: right'>Valor</th></tr></thead>")
        tabla.append("<tbody><tr><td>Costos indirectos</td><td style='text-align: right'>"+indi+"%</td><td style='text-align: right;font-weight: bold'>"+number_format(total*indi/100, 5, ".", "")+"</td></tr></tbody>")
        tabla.append("</table>")
        $("#tabla_indi").append(tabla)
        tabla = $('<table class="table table-bordered table-striped table-condensed table-hover" style="width: 360px;float: right;border: 1px solid #FFAC37">')
        tabla.append("<tbody>");
        tabla.append("<tr><td style='width: 300px;font-weight: bolder;'>Costo unitario directo</td><td style='text-align: right;font-weight: bold'>"+number_format(total, 5, ".", "")+"</td></tr>")
        tabla.append("<tr><td style='font-weight: bolder'>Costos indirectos</td><td style='text-align: right;font-weight: bold'>"+number_format(total*indi/100, 5, ".", "")+"</td></tr>")
        tabla.append("<tr><td style='font-weight: bolder'>Costos total del rubro</td><td style='text-align: right;font-weight: bold'>"+number_format(total*indi/100+total, 5, ".", "")+"</td></tr>")
        tabla.append("<tr><td style='font-weight: bolder'>Precio unitario ($USD)</td><td style='text-align: right;font-weight: bold'>"+number_format(total*indi/100+total, 2, ".", "")+"</td></tr>")
        tabla.append("</tbody>");
        $("#tabla_costos").append(tabla)
        $("#tabla_costos").show("slide")
    }

    $(function () {
        $("#detalle").click(function () {
            var child = window.open('${createLink(controller:"rubro",action:"showFoto",id: rubro?.id, params:[tipo:"dt"])}', 'Mies', 'width=850,height=800,toolbar=0,resizable=0,menubar=0,scrollbars=1,status=0');

            if (child.opener == null)
                child.opener = self;
            window.toolbar.visible = false;
            window.menubar.visible = false;
        });
        $("#save-espc").click(function(){
            if($("#especificaciones").val().trim().length<1024){
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'saveEspc')}",
                    data     : "id=${rubro?.id}&espc="+$("#especificaciones").val().trim(),
                    success  : function (msg) {
                        if(msg=="ok"){
                            $("#modal-detalle").modal("hide");
                        }else{
                            $.box({
                                imageClass : "box_info",
                                text       : "Error",
                                title      : "Alerta",
                                iconClose  : false,
                                dialog     : {
                                    resizable : false,
                                    draggable : false,
                                    buttons   : {
                                        "Aceptar" : function () {
                                        }
                                    },
                                    width     : 500
                                }
                            });
                        }
                    }
                });
            }else{
                $.box({
                    imageClass : "box_info",
                    text       : "Error",
                    title      : "Error: Las especificaciones deben tener un máximo de 1024 caracteres",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        },
                        width     : 500
                    }
                });
            }

        });

        $("#foto").click(function () {
            var child = window.open('${createLink(controller:"rubro",action:"showFoto",id: rubro?.id, params:[tipo:"il"])}', 'Mies', 'width=850,height=800,toolbar=0,resizable=0,menubar=0,scrollbars=1,status=0');

            if (child.opener == null)
                child.opener = self;
            window.toolbar.visible = false;
            window.menubar.visible = false;
        });

        $("#borrar").click(function(){
            <g:if test="${rubro}">
            if(confirm("Esta Seguro?")){
                $("#dlgLoad").dialog("open")
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'borrarRubro')}",
                    data     : "id=${rubro?.id}",
                    success  : function (msg) {
                        $("#dlgLoad").dialog("close")
                        if(msg=="ok"){
                            location.href="${createLink(action: 'rubroPrincipal')}"
                        }else{
//                            console.log(msg)
                            $.box({
                                imageClass : "box_info",
                                text       : "Error: el rubro seleccionado no se pudo eliminar. Esta referenciado en las siguientes obras: <br>"+msg,
                                title      : "Alerta",
                                iconClose  : false,
                                dialog     : {
                                    resizable : false,
                                    draggable : false,
                                    buttons   : {
                                        "Aceptar" : function () {
                                        }
                                    },
                                    width     : 700
                                }
                            });
                        }
                    }
                });
            }
            </g:if>
        });

        <g:if test="${!rubro?.departamento?.subgrupo?.grupo?.id}">
        $("#selClase").val("");
        </g:if>
        $("#costo_indi").blur(function(){
            var indi = $(this).val()
            if(isNaN(indi) || indi*1<0){
                $.box({
                    imageClass : "box_info",
                    text       : "El porcentaje de costos indirectos debe ser un número positvo",
                    title      : "Alerta",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        },
                        width     : 500
                    }
                });
                $("#costo_indi").val("21")
            }
        });

        $("#excel").click(function(){
            var dsp0=$("#dist_p1").val()
            var dsp1=$("#dist_p2").val()
            var dsv0=$("#dist_v1").val()
            var dsv1=$("#dist_v2").val()
            var dsv2=$("#dist_v3").val()
            var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()
            var volqueta=$("#costo_volqueta").val()
            var chofer=$("#costo_chofer").val()

            datos="id=${rubro?.id}&indi="+$("#costo_indi").val()+"&oferente=${session.usuario.id}" + "&obra=${obra?.id}"
            var url = "${g.createLink(controller: 'reportes3',action: 'imprimirRubroExcel')}?"+datos
            location.href=url
        });

        $("#imprimir").click(function(){

            var dsp0=$("#dist_p1").val()
            var dsp1=$("#dist_p2").val()
            var dsv0=$("#dist_v1").val()
            var dsv1=$("#dist_v2").val()
            var dsv2=$("#dist_v3").val()
            var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()
            var volqueta=$("#costo_volqueta").val()
            var chofer=$("#costo_chofer").val()

            datos="dsp0="+dsp0+"Wdsp1="+dsp1+"Wdsv0="+dsv0+"Wdsv1="+dsv1+"Wdsv2="+dsv2+"Wprvl="+volqueta+"Wprch="+chofer+"Woferente=${session.usuario.id}Wid=${rubro?.id}Wlugar="+$("#ciudad").val()+"Wlistas="+listas+"Wchof="+$("#cmb_chof").val()+"Wvolq="+$("#cmb_vol").val()+"Windi="+$("#costo_indi").val()+"Wobra2=${obra?.id}"
            var url = "${g.createLink(controller: 'reportes3',action: 'imprimirRubro')}?"+datos
            location.href="${g.createLink(controller: 'pdf',action: 'pdfLink')}?url="+url

        });


        $("#vae").click(function () {
            var dsp0=$("#dist_p1").val()
            var dsp1=$("#dist_p2").val()
            var dsv0=$("#dist_v1").val()
            var dsv1=$("#dist_v2").val()
            var dsv2=$("#dist_v3").val()
            var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()
            var volqueta=$("#costo_volqueta").val()
            var chofer=$("#costo_chofer").val()

            datos="dsp0="+dsp0+"Wdsp1="+dsp1+"Wdsv0="+dsv0+"Wdsv1="+dsv1+"Wdsv2="+dsv2+"Wprvl="+volqueta+"Wprch="+chofer+"Woferente=${session.usuario.id}Wid=${rubro?.id}Wlugar="+$("#ciudad").val()+"Wlistas="+listas+"Wchof="+$("#cmb_chof").val()+"Wvolq="+$("#cmb_vol").val()+"Windi="+$("#costo_indi").val()+"Wobra2=${obra?.id}"
            var url = "${g.createLink(controller: 'reportes3',action: 'imprimirRubroVae')}?"+datos
            location.href="${g.createLink(controller: 'pdf',action: 'pdfLink')}?url="+url
        });

        $("#excelVae").click(function(){
            var dsp0=$("#dist_p1").val()
            var dsp1=$("#dist_p2").val()
            var dsv0=$("#dist_v1").val()
            var dsv1=$("#dist_v2").val()
            var dsv2=$("#dist_v3").val()
            var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()
            var volqueta=$("#costo_volqueta").val()
            var chofer=$("#costo_chofer").val()

            datos="id=${rubro?.id}&indi="+$("#costo_indi").val()+"&oferente=${session.usuario.id}" + "&obra=${obra?.id}"
            var url = "${g.createLink(controller: 'reportes3',action: 'imprimirRubroExcelVae')}?"+datos
            location.href=url
        });


        $("#transporte").click(function(){
            if ($("#fecha_precios").val().length < 8) {
                $.box({
                    imageClass : "box_info",
                    text       : "Seleccione una fecha para determinar la lista de precios",
                    title      : "Alerta",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        },
                        width     : 500
                    }
                });
                $(this).removeClass("active")
            }else{
                $("#modal-transporte").modal("show");
            }
        })

        $("#cmb_vol").change(function(){
            if($("#cmb_vol").val()!="-1"){
                var datos = "fecha=" + $("#fecha_precios").val() + "&ciudad=" + $("#ciudad").val() + "&ids="+$("#cmb_vol").val()
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'getPreciosTransporte')}",
                    data     : datos,
                    success  : function (msg) {
                        var precios = msg.split("&")

                        for(i=0;i<precios.length;i++){
                            var parts = precios[i].split(";")
//                        console.log(parts,parts.length)
                            if(parts.length>1)
                                $("#costo_volqueta").val(parts[1].trim())


                        }
                    }
                });
            }else{
                $("#costo_volqueta").val("0.00")
            }

        })
//        $("#cmb_vol").change()
        $("#cmb_chof").change(function(){
            if($("#cmb_chof").val()!="-1"){
                var datos = "fecha=" + $("#fecha_precios").val() + "&ciudad=" + $("#ciudad").val()  + "&ids="+$("#cmb_chof").val()
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'getPreciosTransporte')}",
                    data     : datos,
                    success  : function (msg) {
                        var precios = msg.split("&")
                        for(i=0;i<precios.length;i++){
                            var parts = precios[i].split(";")
                            if(parts.length>1)
                                $("#costo_chofer").val(parts[1].trim())


                        }
                    }
                });
            }else{
                $("#costo_chofer").val("0.00")
            }

        })
//        $("#cmb_chof").change()

        $(".item_row").dblclick(function(){
            var hijos = $(this).children()
            var desc=$(hijos[1]).html()
            var cant
            var codigo=$(hijos[0]).html()
            var unidad
            var rendimiento
            var item
            for(i=2;i<hijos.length;i++){

                if($(hijos[i]).hasClass("cant"))
                    cant=$(hijos[i]).html()
                if($(hijos[i]).hasClass("col_unidad"))
                    unidad=$(hijos[i]).html()
                if($(hijos[i]).hasClass("col_rend"))
                    rendimiento=$(hijos[i]).attr("valor")
                if($(hijos[i]).hasClass("col_tarifa"))
                    item=$(hijos[i]).attr("id")
                if($(hijos[i]).hasClass("col_precioUnit"))
                    item=$(hijos[i]).attr("id")
                if($(hijos[i]).hasClass("col_jornal"))
                    item=$(hijos[i]).attr("id")

            }
            item=item.replace("i_","")
//            $("#item_cantidad").val(1.22852)
            $("#item_cantidad").val(cant.toString().trim())

            if(rendimiento)
                $("#item_rendimiento").val(rendimiento.toString().trim())
            $("#item_id").val(item)
            $("#item_id").attr("tipo",$(this).attr("tipo"))
            $("#cdgo_buscar").val(codigo)
            $("#item_desc").val(desc)
            $("#item_unidad").val(unidad)
            getPrecio();


        })

        $("#selClase").change(function () {
            var clase = $(this).val();
            var $subgrupo = $("<select id='selSubgrupo' class='span12'></select>");
            $("#selSubgrupo").replaceWith($subgrupo);
            $.ajax({
                type    : "POST",
                url     : "${createLink(action:'gruposPorClase')}",
                data    : {
                    id : clase
                },
                success : function (msg) {
                    $("#selGrupo").replaceWith(msg);
                }
            });
        });
        $("#selGrupo").change(function () {
            var grupo = $(this).val();
            $.ajax({
                type    : "POST",
                url     : "${createLink(action:'subgruposPorGrupo')}",
                data    : {
                    id : grupo
                },
                success : function (msg) {
                    $("#selSubgrupo").replaceWith(msg);
                }
            });
        });

        $(".tipoPrecio").click(function () {
            if (!$(this).hasClass("active")) {
                var tipo = $(this).attr("id");
                $.ajax({
                    type    : "POST",
                    url     : "${createLink(action:'ciudadesPorTipo')}",
                    data    : {
                        id : tipo
                    },
                    success : function (msg) {
                        $("#ciudad").replaceWith(msg);
                    }
                });
            }
        });

        $("#calcular").click(function () {
            if ($(this).hasClass("active")) {
                $(this).removeClass("active")
                $(".col_delete").show()
                $(".col_unidad").show()
                $(".col_tarifa").hide()
                $(".col_hora").hide()
                $(".col_total").hide()
                $(".col_jornal").hide()
                $(".col_precioUnit").hide()
                $(".col_vacio").hide()
                $(".total").remove()
                $("#tabla_indi").html("")
                $("#tabla_costos").html("")
                $("#tabla_transporte").html("")
            } else {
                $(this).addClass("active")


                var items = $(".item_row")
                if (items.size() < 1) {
                    $.box({
                        imageClass : "box_info",
                        text       : "Añada items a la composición del rubro antes de calcular los precios",
                        title      : "Alerta",
                        iconClose  : false,
                        dialog     : {
                            resizable : false,
                            draggable : false,
                            buttons   : {
                                "Aceptar" : function () {
                                }
                            },
                            width     : 500
                        }
                    });
                    $(this).removeClass("active")
                } else {
                    var tipo = "C"
                    if ($("#V").hasClass("active"))
                        tipo = "V"
                    var listas =""
                    listas+=$("#lista_1").val()+"#"+$("#lista_2").val()+"#"+$("#lista_3").val()+"#"+$("#lista_4").val()+"#"+$("#lista_5").val()+"#"+$("#ciudad").val()

                    var datos = "tipo=" + tipo+"&listas="+listas+"&ids="
                    $.each(items, function () {
                        datos += $(this).attr("id") + "#"
                    });

                    $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'getPrecios')}",
                        data     : datos,
                        success  : function (msg) {
                            var precios = msg.split("&")
                            for(i=0;i<precios.length;i++){
                                var parts = precios[i].split(";")
                                var celda =$("#i_"+parts[0])
                                celda.html(number_format(parts[1], 5, ".", ""))
                                var padre = celda.parent()
//                                    console.log(parts,padre)
                                var celdaRend = padre.find(".col_rend")
                                var celdaTotal = padre.find(".col_total")
                                var celdaCant = padre.find(".cant")
                                var celdaHora =  padre.find(".col_hora")
//                                    console.log(celdaHora)
//                                    console.log(,,"rend "+celdaRend.html(),"total "+ celdaTotal.html(),"multi "+parseFloat(celda.html())*parseFloat(celdaCant.html()))
//                                    console.log("----")
//                                    console.log("celda "+parseFloat(celda.html()))
//                                    console.log("cant sin mun "+celdaCant.html() )
//                                    console.log("cant "+parseFloat(celdaCant.html()) )
//                                    console.log(" multi "+parseFloat(celda.html())*parseFloat(celdaCant.html()))
                                var rend = 1
                                if(celdaHora.hasClass("col_hora")){
                                    celdaHora.html(number_format(parseFloat(celda.html())*parseFloat(celdaCant.html()), 5, ".", ""))
                                }
                                if (celdaRend.html()) {
                                    rend = celdaRend.attr("valor") * 1
//                                            console.log("rend ",celdaRend,rend)
                                }
                                celdaTotal.html(number_format(parseFloat(celda.html())*parseFloat(celdaCant.html())*parseFloat(rend), 5, ".", ""))

                            }
                            calcularTotales()

                        }
                    });

                    $(".col_delete").hide()
//                        $(".col_unidad").hide()
                    $(".col_tarifa").show()
                    $(".col_hora").show()
                    $(".col_total").show()
                    $(".col_jornal").show()
                    $(".col_precioUnit").show()
                    $(".col_vacio").show()
                }

            }
        });

        $("#btn_copiarComp").click(function () {
            if ($("#rubro__id").val() * 1 > 0) {
                var btnOk = $('<a href="#" data-dismiss="modal" class="btn">Cerrar</a>');
                $("#modalTitle").html("Lista de rubros");
                $("#modalFooter").html("").append(btnOk);
                $(".contenidoBuscador").html("")
                $("#modal-rubro").modal("show");
                $("#buscarDialog").unbind("click")
                $("#buscarDialog").bind("click", enviarCopiar)
            } else {
                $.box({
                    imageClass : "box_info",
                    text       : "Primero guarde el rubro o seleccione uno para editar",
                    title      : "Alerta",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        },
                        width     : 500
                    }
                });
            }

        });

        $(".borrarItem").click(function () {
            var tr = $(this).parent().parent()
            if (confirm("Esta seguro de eliminar este registro? Esta acción es irreversible")) {
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'eliminarRubroDetalle')}",
                    data     : "id=" + $(this).attr("iden"),
                    success  : function (msg) {
                        if (msg == "Registro eliminado") {
                            tr.remove()
                        }

                        $.box({
                            imageClass : "box_info",
                            text       : msg,
                            title      : "Alerta",
                            iconClose  : false,
                            dialog     : {
                                resizable : false,
                                draggable : false,
                                buttons   : {
                                    "Aceptar" : function () {
                                    }
                                }
                            }
                        });

                    }
                });
            }

        });

        $("#cdgo_buscar").dblclick(function () {
            var btnOk = $('<a href="#" data-dismiss="modal" class="btn">Cerrar</a>');
            $("#modalTitle").html("Lista de items");
            $("#modalFooter").html("").append(btnOk);
            $(".contenidoBuscador").html("")
            $("#modal-rubro").modal("show");
            $("#buscarDialog").unbind("click")
            $("#buscarDialog").bind("click", enviarItem)
            setTimeout( function() { $( '#criterio' ).focus() }, 500 );
        });
        $("#cdgo_buscar").blur(function(){
//            console.log($("#item_id").val()=="")
            if($("#item_id").val()=="" && $("#cdgo_buscar").val()!=""){
                $.ajax({type : "POST", url : "${g.createLink(controller: 'rubro',action:'buscarRubroCodigo')}",
                    data     : "codigo=" + $("#cdgo_buscar").val(),
                    success  : function (msg) {
                        if (msg !="-1") {
//                            console.log("msg "+msg)
                            var parts = msg.split("&&")
                            $("#item_tipoLista").val(parts[1])
                            $("#item_id").val(parts[0])
                            $("#item_desc").val(parts[2])
                            $("#item_unidad").val(parts[3])
                        }else{
//                            $("#cdgo_buscar").val("")
                            $("#item_tipoLista").val("")
                            $("#item_id").val("")
                            $("#item_desc").val("")
                            $("#item_unidad").val("")
                        }
                    }
                });
            }
        });
        $("#cdgo_buscar").keydown(function(ev){

            if(ev.keyCode*1!=9 && (ev.keyCode*1<37 || ev.keyCode*1>40)){
                $("#item_tipoLista").val("")
                $("#item_id").val("")
                $("#item_desc").val("")
                $("#item_unidad").val("")
            }else{
//                console.log("no reset")
            }


        });
        $("#btn_lista").click(function () {

            var btnOk = $('<a href="#" data-dismiss="modal" class="btn">Cerrar</a>');
            $("#modalTitle").html("Lista de rubros");
//        $("#modalBody").html($("#buscador_rubro").html());
            $("#modalFooter").html("").append(btnOk);
            $(".contenidoBuscador").html("")
            $("#modal-rubro").modal("show");
            $("#buscarDialog").unbind("click")
            $("#buscarDialog").bind("click", enviar)
            setTimeout( function() { $( '#criterio' ).focus() }, 500 );

        }); //click btn new
        $("#rubro_registro").click(function () {
            if ($(this).hasClass("active")) {
                if (confirm("Esta seguro de desregistrar este rubro?")) {
                    $("#registrado").val("N")
                    $("#fechaReg").val("")
                }
            } else {
                if (confirm("Esta seguro de registrar este rubro?")) {
                    $("#registrado").val("R")
                    var fecha = new Date()
                    $("#fechaReg").val(fecha.toString("dd/mm/yyyy"))
                }
            }
        });

        $("#guardar").click(function () {

            var cod = $("#input_codigo").val()
            var desc = $("#input_descripcion").val()
            var subGr = $("#selSubgrupo").val()
            var msg =""
//            console.log(desc,desc.trim(),desc.trim().length)
            if(cod.trim().length>20 || cod.trim().length<1){
                msg="<br>Error: La propiedad código debe tener entre 1 y 20 caracteres."
            }

            if(desc.trim().length>160 || desc.trim().length<1){
                if(msg=="")
                    msg="<br>Error: La propiedad descripción debe tener entre 1 y 160 caracteres."
                else
                    msg+="<br>La propiedad descripción debe tener entre 1 y 160 caracteres."
            }

            /*
             if(isNaN(subGr) || subGr*1<1){
             if(msg=="")
             msg="<br>Error: Seleccione un subgrupo usando las listas de Clase, Grupo y Subgrupo"
             else
             msg+="<br>Seleccione un subgrupo usando las listas de Clase, Grupo y Subgrupo"
             }
             */
            if(msg==""){
                $(".frmRubro").submit()
            }else{
                $.box({
                    imageClass : "box_info",
                    text       : msg,
                    title      : "Errores de validación",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        width      :600,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        }
                    }
                });
            }
        });

        <g:if test="${rubro}">
        $("#btn_agregarItem").click(function () {
            if ($("#calcular").hasClass("active")){
                $.box({
                    imageClass : "box_info",
                    text       : "Antes de agregar items, por favor desactive la opción calcular precios en el menú superior.",
                    title      : "Alerta",
                    iconClose  : false,
                    dialog     : {
                        resizable : false,
                        draggable : false,
                        buttons   : {
                            "Aceptar" : function () {
                            }
                        }
                    }
                });
                return false
            }

            agregar(${rubro?.id},"");

        });
        </g:if>
        <g:else>
        $("#btn_agregarItem").click(function () {
            $.box({
                imageClass : "box_info",
                text       : "Primero guarde el rubro o seleccione uno para editar",
                title      : "Alerta",
                iconClose  : false,
                dialog     : {
                    resizable : false,
                    draggable : false,
                    buttons   : {
                        "Aceptar" : function () {
                        }
                    },
                    width     : 500
                }
            });

        });
        </g:else>

        $("#imprimirTransporteDialog").dialog({

            autoOpen: false,
            resizable: false,
            modal: true,
            dragable: false,
            width: 350,
            height: 220,
            position: 'center',
            title: 'Imprimir con o sin transporte',
            buttons: {
                "Si" : function () {
                    var dsp0=$("#dist_p1").val()
                    var dsp1=$("#dist_p2").val()
                    var dsv0=$("#dist_v1").val()
                    var dsv1=$("#dist_v2").val()
                    var dsv2=$("#dist_v3").val()
                    var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()
                    var volqueta=$("#costo_volqueta").val()
                    var chofer=$("#costo_chofer").val()

                    datos="dsp0="+dsp0+"Wdsp1="+dsp1+"Wdsv0="+dsv0+"Wdsv1="+dsv1+"Wdsv2="+dsv2+"Wprvl="+volqueta+"Wprch="+chofer+"Woferente=${session.usuario.id}Wid=${rubro?.id}Wlugar="+$("#ciudad").val()+"Wlistas="+listas+"Wchof="+$("#cmb_chof").val()+"Wvolq="+$("#cmb_vol").val()+"Windi="+$("#costo_indi").val()
                    var url = "${g.createLink(controller: 'reportes3',action: 'imprimirRubro')}?"+datos
                    location.href="${g.createLink(controller: 'pdf',action: 'pdfLink')}?url="+url
                    $("#imprimirTransporteDialog").dialog("close");
                },
                "No" : function () {
                    var dsp0=$("#dist_p1").val()
                    var dsp1=$("#dist_p2").val()
                    var dsv0=$("#dist_v1").val()
                    var dsv1=$("#dist_v2").val()
                    var dsv2=$("#dist_v3").val()
                    var listas = $("#lista_1").val()+","+$("#lista_2").val()+","+$("#lista_3").val()+","+$("#lista_4").val()+","+$("#lista_5").val()+","+$("#ciudad").val()
                    var volqueta=$("#costo_volqueta").val()
                    var chofer=$("#costo_chofer").val()

                    datos="dsp0="+dsp0+"Wdsp1="+dsp1+"Wdsv0="+dsv0+"Wdsv1="+dsv1+"Wdsv2="+dsv2+"Wprvl="+volqueta+"Wprch="+chofer+"Wfecha="+$("#fecha_precios").val()+"Wid=${rubro?.id}Wlugar="+$("#ciudad").val()+"Wlistas="+listas+"Wchof="+$("#cmb_chof").val()+"Wvolq="+$("#cmb_vol").val()+"Windi="+$("#costo_indi").val()+"Wtrans=no"
                    var url = "${g.createLink(controller: 'reportes3',action: 'imprimirRubro')}?"+datos
                    location.href="${g.createLink(controller: 'pdf',action: 'pdfLink')}?url="+url
                    $("#imprimirTransporteDialog").dialog("close");
                }



            }



        });


    });
</script>

</body>
</html>
