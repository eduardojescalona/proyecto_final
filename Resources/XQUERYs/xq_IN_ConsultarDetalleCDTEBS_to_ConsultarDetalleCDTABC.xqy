xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://xmlns.bancocajasocial.com/co/canales/schemas/abc/detalleCDT/v1.0";
(:: import schema at "../../../ConsultaDetalleABCV2.1/Resources/Schemas/consultarDetalleCDT.xsd" ::)
declare namespace ns1="http://xmlns.bancocajasocial.com/co/canales/schemas/ebs/ConsultarDetalleCDT/v1.0";
(:: import schema at "../Schemas/ConsultarDetalleCDT.xsd" ::)

declare namespace v1. = "http://xmlns.bancocajasocial.com/co/canales/schemas/entidades/Cabeceras/v1.0";

declare variable $consultarDetalleCDTRequest as element() (:: schema-element(ns1:ConsultarDetalleCDTRequest) ::) external;

declare function local:func($consultarDetalleCDTRequest as element() (:: schema-element(ns1:ConsultarDetalleCDTRequest) ::)) as element() (:: schema-element(ns2:detalleCDTRequest) ::) {
    <ns2:detalleCDTRequest>
       <ns2:cabeceraEntrada>
            <v1.:seguridad>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:seguridad/v1.:usuario)
                    then <v1.:usuario>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:seguridad/v1.:usuario)}</v1.:usuario>
                    else ()
                }
            </v1.:seguridad>
            <v1.:invocador>
                <v1.:canalOrigen>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:canalOrigen)}</v1.:canalOrigen>
                <v1.:codigoATM>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:codigoATM)}</v1.:codigoATM>
                <v1.:codigoOficina>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:codigoOficina)}</v1.:codigoOficina>
                <v1.:codigoTerminal>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:codigoTerminal)}</v1.:codigoTerminal>
                <v1.:componente></v1.:componente>
                <v1.:direccionIpCliente>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:direccionIpCliente)}</v1.:direccionIpCliente>
                <v1.:direccionIpServidor>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:direccionIpServidor)}</v1.:direccionIpServidor>
                <v1.:direccionMacCliente>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:direccionMacCliente)}</v1.:direccionMacCliente>
                <v1.:direccionMacServidor>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:direccionMacServidor)}</v1.:direccionMacServidor>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:fechaProceso)
                    then <v1.:fechaProceso>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:fechaProceso)}</v1.:fechaProceso>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:identificadorTx)
                    then <v1.:identificadorTx>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:identificadorTx)}</v1.:identificadorTx>
                    else ()
                }
                <v1.:llaveSesion>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:llaveSesion)}</v1.:llaveSesion>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:origen)
                    then <v1.:origen>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:origen)}</v1.:origen>
                    else ()
                }
                <v1.:pais>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:pais)}</v1.:pais>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:procesoBpmId)
                    then <v1.:procesoBpmId>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:procesoBpmId)}</v1.:procesoBpmId>
                    else ()
                }
                <v1.:procesoId>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:procesoId)}</v1.:procesoId>
                <v1.:red>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:red)}</v1.:red>
                <v1.:subcanal>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:subcanal)}</v1.:subcanal>
                <v1.:usuario>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:usuario)}</v1.:usuario>
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:accion)
                    then <v1.:accion>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:accion)}</v1.:accion>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:destino)
                    then <v1.:destino>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:destino)}</v1.:destino>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:usuarioModificacion)
                    then <v1.:usuarioModificacion>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:usuarioModificacion)}</v1.:usuarioModificacion>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:numeroReferencia)
                    then <v1.:numeroReferencia>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:numeroReferencia)}</v1.:numeroReferencia>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:numeroSolicitud)
                    then <v1.:numeroSolicitud>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:numeroSolicitud)}</v1.:numeroSolicitud>
                    else ()
                }
                {
                    if ($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:codigoCliente)
                    then <v1.:codigoCliente>{fn:data($consultarDetalleCDTRequest/ns1:cabeceraEntrada/v1.:invocador/v1.:codigoCliente)}</v1.:codigoCliente>
                    else ()
                }
            </v1.:invocador>
        </ns2:cabeceraEntrada>
        <ns2:numeroProducto>{fn:data($consultarDetalleCDTRequest/ns1:identificadorProductoBanco)}</ns2:numeroProducto>
    </ns2:detalleCDTRequest>
};

local:func($consultarDetalleCDTRequest)