<div class="tituloTree">Precios de ${item.nombre}</div>

<div style="height: 35px; width: 100%;">
    <div class="btn-group pull-left">
        <g:if test="${precios.size() == 0}">
            <a href="#" class="btn btn-ajax" id="btnNew">
                <i class="icon-money"></i>
                Nuevo Precio
            </a>
        </g:if>
        <g:else>
            <a href="#" class="btn btn-success btn-ajax" id="btnSave">
                <i class="icon-save"></i>
                Guardar
            </a>
        </g:else>
    </div>
</div>

<g:if test="${precios.size() > 0}">
    <div class="alert">
        Haga doble click en el precio para modificarlo, y click en el botón "Guardar" para guardar su cambio.
    </div>
</g:if>

<div id="divTabla" style="height: 630px; width: 100%; overflow-x: hidden; overflow-y: auto;">
    <table class="table table-striped table-bordered table-hover table-condensed" id="tablaPrecios">
        <thead>
            <tr>
                <th>Fecha</th>
                <th class="precio">Precio</th>
                <th class="delete"></th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${precios}" var="precio" status="i">
                <tr>
                    <td>
                        <g:formatDate date="${precio.fecha}" format="dd-MM-yyyy"/>
                    </td>
                    <td class="precio textRight editable ${i == 0 ? 'selected' : ''}" data-original="${precio.precio}" id="${precio.id}">
                        <g:formatNumber number="${precio.precio}" maxFractionDigits="5" minFractionDigits="5" format="##,#####0" locale='ec'/>
                    </td>
                    <td class="delete">
                        %{--<g:if test="${precio.fechaIngreso == new java.util.Date().clearTime()}">--}%
                        <a href="#" class="btn btn-danger btn-small btnDelete" rel="tooltip" title="Eliminar" id="${precio.id}">
                            <i class="icon-trash icon-large"></i>
                        </a>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>

<div class="modal hide fade" id="modal_lugar">
    <div class="modal-header_lugar">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3 id="modalTitle_lugar"></h3>
    </div>

    <div class="modal-body" id="modalBody_lugar">
    </div>

    <div class="modal-footer" id="modalFooter_lugar">
    </div>
</div>

<div class="modal hide fade" id="modal-tree1">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3 id="modalTitle-tree1"></h3>
    </div>

    <div class="modal-body" id="modalBody-tree1">
    </div>

    <div class="modal-footer" id="modalFooter-tree1">
    </div>
</div>

<script type="text/javascript">
    $('[rel=tooltip]').tooltip();

    $("#btnNew").click(function () {
        $.ajax({
            type    : "POST",
            url     : "${createLink(action:'formPrecio_ajax')}",
            data    : {
                item : "${item.id}"
            },
            success : function (msg) {
                var btnOk = $('<a href="#" data-dismiss="modal" class="btn">Cancelar</a>');
                var btnSave = $('<a href="#"  class="btn btn-success"><i class="icon-ok"></i> Guardar</a>');

                btnSave.click(function () {
                    if ($("#frmSave").valid()) {
                        btnSave.replaceWith(spinner);

                        $.ajax({
                            type    : "POST",
                            url     : $("#frmSave").attr("action"),
                            data    : $("#frmSave").serialize(),
                            success : function (msg) {
                                if (msg == "OK") {
                                    $("#modal-tree").modal("hide");
                                    var loading = $("<div></div>");
                                    loading.css({
                                        textAlign : "center",
                                        width     : "100%"
                                    });
                                    loading.append("Cargando....Por favor espere...<br/>").append(spinnerBg);
                                    $("#info").html(loading);
                                    $.ajax({
                                        type    : "POST",
                                        url     : "${createLink(action:'showLg_ajax')}",
                                        data    : {
                                            id : "${params.id}"
                                        },
                                        success : function (msg) {
                                            $("#info").html(msg);
                                        }
                                    });
                                } else {
                                    var btnClose = $('<a href="#" data-dismiss="modal" class="btn">Cerrar</a>');
                                    $("#modalTitle").html("Error");
                                    $("#modalBody").html("Ha ocurrido un error al guardar");
                                    $("#modalFooter").html("").append(btnClose);
                                }
                            }
                        });
                    }
                    return false;
                });

                $("#modalTitle").html("Crear Precio");
                $("#modalBody").html(msg);
                $("#modalFooter").html("").append(btnOk).append(btnSave);
                $("#modal-tree").modal("show");
            }
        });
        return false;
    });

    $("#btnSave").click(function () {
        $("#dlgLoad").dialog("open");
        var data = "";
        $(".editable").each(function () {
            if ($(this).find(".editando").length > 0) {
                var value = $(".editando").val();
                if (value) {
                    $(".selected").html(number_format(value, 5, ".", "")).data("valor", value);
                }
            }
            var id = $(this).attr("id");
            var valor = $(this).data("valor");

            if (parseFloat(valor) > 0 && parseFloat($(this).data("original")) != parseFloat(valor)) {
                if (data != "") {
                    data += "&";
                }
                data += "item=" + id + "_" + valor;
            }
        });
        $.ajax({
            type    : "POST",
            url     : "${createLink(action: 'actualizarPrecios_ajax')}",
            data    : data,
            success : function (msg) {
                $("#dlgLoad").dialog("close");
                var parts = msg.split("_");
                var ok = parts[0];
                var no = parts[1];
                doHighlight({elem : $(ok), clase : "ok"});
                doHighlight({elem : $(no), clase : "no"});
            }
        });
        return false;
    }); //btnSave

    $(".btnDelete").click(function () {
        var btnOk = $('<a href="#" data-dismiss="modal" class="btn">Cancelar</a>');
        var btnSave = $('<a href="#"  class="btn btn-danger"><i class="icon-trash"></i> Eliminar</a>');

        var id = $(this).attr("id");
        btnSave.click(function () {
            btnSave.replaceWith(spinner);
            $.ajax({
                type    : "POST",
                url     : "${createLink(action: 'deletePrecio_ajax')}",
                data    : {
                    id : id
                },
                success : function (msg) {
                    if (msg == "OK") {
                        $("#modal-tree1").modal("hide");
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(action:'showLg_ajax')}",
                            data    : {
                                id       : "${params.id}",
                                all      : "${params.all}",
                                ignore   : "${params.ignore}",
                                fecha    : "${params.fecha}",
                                operador : "${params.operador}"
                            },
                            success : function (msg) {
                                $("#info").html(msg);
                            }
                        });
                    }
                }
            });
            return false;
        });

        $("#modalTitle-tree1").html("Confirmación");
        $("#modalBody-tree1").html("Está seguro de querer eliminar este precio?");
        $("#modalFooter-tree1").html("").append(btnOk).append(btnSave);
        $("#modal-tree1").modal("show");
        return false;
    });

</script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'tableHandler.js')}"></script>