xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://xmlns.bancocajasocial.com/co/canales/schema/ebs/servicios/ConsultarEstadoClienteBancaEmpresas/v1.0";
(:: import schema at "../../../EstadosClientesBancaEmpresasEBSV1.0/Resources/Schemas/ConsultarEstadoClienteBancaEmpresas.xsd" ::)
declare namespace ns1="http://xmlns.bancocajasocial.com/co/canales/schemas/abc/detalleCDT/v1.0";
(:: import schema at "../../../ConsultaDetalleABCV2.1/Resources/Schemas/consultarDetalleCDT.xsd" ::)
declare namespace ns3="http://xmlns.bancocajasocial.com/co/canales/schemas/ebs/ConsultarDetalleCDT/v1.0";
(:: import schema at "../Schemas/ConsultarDetalleCDT.xsd" ::)

declare namespace v1. = "http://xmlns.bancocajasocial.com/co/canales/schema/servicios/CabeceraBanca/v1.0";

declare namespace v1.1 = "http://xmlns.bancocajasocial.com/co/canales/schemas/entidades/Cabeceras/v1.0";

declare variable $detalleCDTResponse as element() (:: schema-element(ns1:detalleCDTResponse) ::) external;
declare variable $consultarEstadoClientesBancaEmpresasResponse as element() (:: schema-element(ns2:ConsultarEstadoClienteBancaEmpresasResponse) ::) external;
declare variable $consultarDetalleCDTRequest as element() (:: schema-element(ns3:ConsultarDetalleCDTRequest) ::) external;

declare function local:func($detalleCDTResponse as element() (:: schema-element(ns1:detalleCDTResponse) ::), 
                            $consultarEstadoClientesBancaEmpresasResponse as element() (:: schema-element(ns2:ConsultarEstadoClienteBancaEmpresasResponse) ::),
                            $consultarDetalleCDTRequest as element() (:: schema-element(ns3:ConsultarDetalleCDTRequest) ::)) 
                            as element() (:: schema-element(ns3:ConsultarDetalleCDTResponse) ::) {
    <ns3:ConsultarDetalleCDTResponse>
        <ns3:cabeceraSalida>
            <v1.1:tipoRespuesta>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.1:tipoRespuesta)}</v1.1:tipoRespuesta>
            <v1.1:respuestaError>
                <v1.1:codigoError></v1.1:codigoError>
                <v1.1:descripcionError></v1.1:descripcionError>
                <v1.1:tipoError></v1.1:tipoError>
            </v1.1:respuestaError>
        </ns3:cabeceraSalida>
        <ns3:tipoCDT>{dvmtr:lookup('CDTBancaEmpresasEBS/Resources/DVMs/DVM_TIPO_PRODUCTO_CDT', 'KEY', fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:listaParametros/ns2:parametros[1]/ns2:ledger), 'VALUE', '')}</ns3:tipoCDT>
        <ns3:numeroCDT>{fn:data($consultarDetalleCDTRequest/ns3:identificadorProductoBanco)}</ns3:numeroCDT>
        {
          if(xs:integer($detalleCDTResponse/ns1:infoDetalle/ns1:fechaProxVencimiento)!=0) then
            <ns3:fechaProximoVencimiento>{fn-bea:date-from-string-with-format("yyyyMMdd", fn:data($detalleCDTResponse/ns1:infoDetalle/ns1:fechaProxVencimiento))}</ns3:fechaProximoVencimiento>
          else
            <ns3:fechaProximoVencimiento>{fn:data($detalleCDTResponse/ns1:infoDetalle/ns1:fechaProxVencimiento)}</ns3:fechaProximoVencimiento>
        }
        {
          if(xs:integer($detalleCDTResponse/ns1:infoDetalle/ns1:fechaUltimoVencimiento)!=0) then
            <ns3:ultimoVencimiento>{fn-bea:date-from-string-with-format("yyyyMMdd", fn:data($detalleCDTResponse/ns1:infoDetalle/ns1:fechaUltimoVencimiento))}</ns3:ultimoVencimiento>
          else
            <ns3:ultimoVencimiento>{fn:data($detalleCDTResponse/ns1:infoDetalle/ns1:fechaUltimoVencimiento)}</ns3:ultimoVencimiento>
        }
        <ns3:montoOriginal>{fn-bea:format-number(xs:decimal(fn:concat(fn:substring($detalleCDTResponse/ns1:infoProducto/ns1:valorApertura,1,14),'.',fn:substring($detalleCDTResponse/ns1:infoProducto/ns1:valorApertura,15,2))),"###########0.00")}</ns3:montoOriginal>
        <ns3:tasa>{fn-bea:format-number(xs:decimal($detalleCDTResponse/ns1:infoDetalle/ns1:tasaEfectivaAnual),"###########0.00")}</ns3:tasa>
        <ns3:titular>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:titular)}</ns3:titular>
        <ns3:tipoDocumento>{dvmtr:lookup('ComponentesComunesBancaEmpresa/Resources/DVMs/CATALOGOS/DVM_CATALOGO_TIPOS_DOCUMENTO', 'VALOR', fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:tipoDocumento), 'ICBANKING_ID', '')}</ns3:tipoDocumento>
        <ns3:numeroDocumento>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:numeroDocumento)}</ns3:numeroDocumento>
        <ns3:estadoCDT>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:listaParametros/ns2:parametros[1]/ns2:estadoMostrarIcb)}</ns3:estadoCDT>
        <ns3:saldoTotal>{fn-bea:format-number(xs:decimal(fn:concat(fn:substring($detalleCDTResponse/ns1:infoProducto/ns1:saldoTotal,1,14),'.',fn:substring($detalleCDTResponse/ns1:infoProducto/ns1:saldoTotal,15,2))),"###########0.00")}</ns3:saldoTotal>
        {
            for $cuentasAsociadas in $detalleCDTResponse/ns1:infoProducto/ns1:cuentasAsociadas
            return 
            <ns3:cuentasAsociadas>
                <ns3:numeroCuentaAsociada>{fn:data($cuentasAsociadas/ns1:numCuentaAsociada)}</ns3:numeroCuentaAsociada></ns3:cuentasAsociadas>
        }
    </ns3:ConsultarDetalleCDTResponse>
};

local:func($detalleCDTResponse, $consultarEstadoClientesBancaEmpresasResponse, $consultarDetalleCDTRequest )