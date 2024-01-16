xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns3="http://xmlns.bancocajasocial.com/co/canales/schema/ebs/servicios/ConsultarEstadoClienteBancaEmpresas/v1.0";
(:: import schema at "../../../EstadosClientesBancaEmpresasEBSV1.0/Resources/Schemas/ConsultarEstadoClienteBancaEmpresas.xsd" ::)
declare namespace ns2="http://xmlns.bancocajasocial.com/co/canales/schemas/abc/detalleCDT/v1.0";
(:: import schema at "../../../ConsultaDetalleABCV2.1/Resources/Schemas/consultarDetalleCDT.xsd" ::)
declare namespace ns1="http://xmlns.bancocajasocial.com/co/canales/schemas/ebs/ConsultarDetalleCDT/v1.0";
(:: import schema at "../Schemas/ConsultarDetalleCDT.xsd" ::)

declare namespace v1. = "http://xmlns.bancocajasocial.com/co/canales/schemas/entidades/Cabeceras/v1.0";
declare namespace v1.1 = "http://xmlns.bancocajasocial.com/co/canales/schemas/entidades/Cabeceras/v1.0";

declare variable $consultarDetalleCDTRequest as element() (:: schema-element(ns1:ConsultarDetalleCDTRequest) ::) external;
declare variable $detalleCDTResponse as element() (:: schema-element(ns2:detalleCDTResponse) ::) external;

declare function local:func($consultarDetalleCDTRequest as element() (:: schema-element(ns1:ConsultarDetalleCDTRequest) ::), 
                            $detalleCDTResponse as element() (:: schema-element(ns2:detalleCDTResponse) ::)) 
                            as element() (:: schema-element(ns3:ConsultarEstadoClienteBancaEmpresasRequest) ::) {
    <ns3:ConsultarEstadoClienteBancaEmpresasRequest>
        <ns3:cabeceraEntrada>
            <v1.:seguridad>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:seguridad/v1.1:usuario)
                    then <v1.:usuario>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:seguridad/v1.1:usuario)}</v1.:usuario>
                    else ()
                }
            </v1.:seguridad>
            <v1.:invocador>
                <v1.:canalOrigen>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:canalOrigen)}</v1.:canalOrigen>
                <v1.:codigoATM>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:codigoATM)}</v1.:codigoATM>
                <v1.:codigoOficina>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:codigoOficina)}</v1.:codigoOficina>
                <v1.:codigoTerminal>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:codigoTerminal)}</v1.:codigoTerminal>
                <v1.:componente></v1.:componente>
                <v1.:direccionIpCliente>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:direccionIpCliente)}</v1.:direccionIpCliente>
                <v1.:direccionIpServidor>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:direccionIpServidor)}</v1.:direccionIpServidor>
                <v1.:direccionMacCliente>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:direccionMacCliente)}</v1.:direccionMacCliente>
                <v1.:direccionMacServidor>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:direccionMacServidor)}</v1.:direccionMacServidor>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:fechaProceso)
                    then <v1.:fechaProceso>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:fechaProceso)}</v1.:fechaProceso>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:identificadorTx)
                    then <v1.:identificadorTx>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:identificadorTx)}</v1.:identificadorTx>
                    else ()
                }
                <v1.:llaveSesion>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:llaveSesion)}</v1.:llaveSesion>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:origen)
                    then <v1.:origen>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:origen)}</v1.:origen>
                    else ()
                }
                <v1.:pais>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:pais)}</v1.:pais>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:procesoBpmId)
                    then <v1.:procesoBpmId>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:procesoBpmId)}</v1.:procesoBpmId>
                    else ()
                }
                <v1.:procesoId>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:procesoId)}</v1.:procesoId>
                <v1.:red>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:red)}</v1.:red>
                <v1.:subcanal>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:subcanal)}</v1.:subcanal>
                <v1.:usuario>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:usuario)}</v1.:usuario>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:accion)
                    then <v1.:accion>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:accion)}</v1.:accion>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:destino)
                    then <v1.:destino>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:destino)}</v1.:destino>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:usuarioModificacion)
                    then <v1.:usuarioModificacion>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:usuarioModificacion)}</v1.:usuarioModificacion>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:numeroReferencia)
                    then <v1.:numeroReferencia>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:numeroReferencia)}</v1.:numeroReferencia>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:numeroSolicitud)
                    then <v1.:numeroSolicitud>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:numeroSolicitud)}</v1.:numeroSolicitud>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:codigoCliente)
                    then <v1.:codigoCliente>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.1:invocador/v1.1:codigoCliente)}</v1.:codigoCliente>
                    else ()
                }
            </v1.:invocador>
        </ns3:cabeceraEntrada>
        <ns3:ledger>{fn:data($detalleCDTResponse/ns2:infoProducto/ns2:ledger)}</ns3:ledger>
        <ns3:subLedger>{fn:data($detalleCDTResponse/ns2:infoProducto/ns2:subLedger)}</ns3:subLedger>
        <ns3:grupo>{fn:data($detalleCDTResponse/ns2:infoProducto/ns2:grupo)}</ns3:grupo>
        <ns3:tipoEstado></ns3:tipoEstado>
        <ns3:CodeSubtype>{fn:data($detalleCDTResponse/ns2:infoProducto/ns2:estadoBMcodigo)}</ns3:CodeSubtype>
        <ns3:numeroProducto>{fn:data($consultarDetalleCDTRequest/ns1:identificadorProductoBanco)}</ns3:numeroProducto>
    </ns3:ConsultarEstadoClienteBancaEmpresasRequest>
};

local:func($consultarDetalleCDTRequest, $detalleCDTResponse)