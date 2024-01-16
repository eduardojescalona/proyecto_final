xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://xmlns.bancocajasocial.com/co/canales/schema/ebs/servicios/ConsultarEstadoClienteBancaEmpresas/v1.0";
(:: import schema at "../../../EstadosClientesBancaEmpresasEBSV1.0/Resources/Schemas/ConsultarEstadoClienteBancaEmpresas.xsd" ::)
declare namespace ns1="http://xmlns.bancocajasocial.com/co/canales/schemas/abc/detalleCDT/v1.0";
(:: import schema at "../../../ConsultaDetalleABCV2.1/Resources/Schemas/consultarDetalleCDT.xsd" ::)
declare namespace ns3="http://xmlns.bancocajasocial.com/co/canales/schemas/ebs/ConsultarDetalleCDT/v1.0";
(:: import schema at "../Schemas/ConsultarDetalleCDT.xsd" ::)

declare namespace v1. = "http://xmlns.bancocajasocial.com/co/canales/schemas/entidades/Cabeceras/v1.0";

declare variable $detalleCDTResponse as element() (:: schema-element(ns1:detalleCDTResponse) ::) external;
declare variable $consultarEstadoClientesBancaEmpresasResponse as element() (:: schema-element(ns2:ConsultarEstadoClienteBancaEmpresasResponse) ::) external;

declare function local:func($detalleCDTResponse as element() (:: schema-element(ns1:detalleCDTResponse) ::), 
                            $consultarEstadoClientesBancaEmpresasResponse as element() (:: schema-element(ns2:ConsultarEstadoClienteBancaEmpresasResponse) ::)) 
                            as element() (:: schema-element(ns3:ConsultarDetalleCDTResponse) ::) {
    <ns3:ConsultarDetalleCDTResponse>
        {
            if (fn:data($detalleCDTResponse/ns1:cabeceraSalida/v1.:tipoRespuesta)='ER') then
                <ns3:cabeceraSalida>
                    <v1.:tipoRespuesta>{fn:data($detalleCDTResponse/ns1:cabeceraSalida/v1.:tipoRespuesta)}</v1.:tipoRespuesta>
                    {
                        if ($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError)
                        then 
                            <v1.:respuestaError>
                                {
                                    if ($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError/v1.:codigoError)
                                    then <v1.:codigoError>{fn:data($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError/v1.:codigoError)}</v1.:codigoError>
                                    else ()
                                }
                                {
                                    if ($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError/v1.:descripcionError)
                                    then <v1.:descripcionError>{fn:data($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError/v1.:descripcionError)}</v1.:descripcionError>
                                    else ()
                                }
                                {
                                    if ($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError/v1.:tipoError)
                                    then <v1.:tipoError>{fn:data($detalleCDTResponse/ns1:cabeceraSalida/v1.:respuestaError/v1.:tipoError)}</v1.:tipoError>
                                    else ()
                                }
                            </v1.:respuestaError>
                        else ()
                    }
                </ns3:cabeceraSalida>
            else
                <ns3:cabeceraSalida>
                    <v1.:tipoRespuesta>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:tipoRespuesta)}</v1.:tipoRespuesta>
                    {
                        if ($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError)
                        then 
                            <v1.:respuestaError>
                                {
                                    if ($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError/v1.:codigoError)
                                    then <v1.:codigoError>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError/v1.:codigoError)}</v1.:codigoError>
                                    else ()
                                }
                                {
                                    if ($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError/v1.:descripcionError)
                                    then <v1.:descripcionError>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError/v1.:descripcionError)}</v1.:descripcionError>
                                    else ()
                                }
                                {
                                    if ($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError/v1.:tipoError)
                                    then <v1.:tipoError>{fn:data($consultarEstadoClientesBancaEmpresasResponse/ns2:cabeceraSalida/v1.:respuestaError/v1.:tipoError)}</v1.:tipoError>
                                    else ()
                                }
                            </v1.:respuestaError>
                        else ()
                    }
                </ns3:cabeceraSalida>
        }
    </ns3:ConsultarDetalleCDTResponse>
};

local:func($detalleCDTResponse, $consultarEstadoClientesBancaEmpresasResponse)