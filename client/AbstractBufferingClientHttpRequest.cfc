/**
 * Base implementation of {@link ClientHttpRequest} that buffers output
 * in a byte array before sending it over the wire.
 *
 * @author Arjen Poutsma
 * @since 3.0.6
 */
component
  extends="cfboom.http.client.AbstractClientHttpRequest"
  displayname="Abstract Class AbstractBufferingClientHttpRequest"
  output="false"
{
  public cfboom.http.client.AbstractBufferingClientHttpRequest function init() {
    return this;
  }

  _instance['bufferedOutput'] = createObject( "java", "java.io.ByteArrayOutputStream" ).init( javaCast( "int", 1024 ) );

  public any function getBodyInternal( required cfboom.http.HttpHeaders headers ) {
    return _instance.bufferedOutput;
  }

  public cfboom.http.client.ClientHttpResponse function executeInternal( required cfboom.http.HttpHeaders headers ) {
    local['bytes'] = _instance.bufferedOutput.toByteArray();
    if ( arguments.headers.getContentLength() < 0) {
      arguments.headers.setContentLength( arrayLen( local.bytes ) );
    }
    local['result'] = doExecuteInternal( arguments.headers, local.bytes );
    _instance['bufferedOutput'] = javaCast( "null", "" );
    return local.result;
  }

  /**
   * Abstract template method that writes the given headers and content to the HTTP request.
   * @param headers the HTTP headers
   * @param bufferedOutput the body content
   * @return the response object for the executed request
   */
  public cfboom.http.client.ClientHttpResponse function doExecuteInternal( cfboom.http.HttpHeaders headers, any bufferedOutput ) {
    throw(object=createObject("java", "java.lang.AbstractMethodError").init("Must override template method 'doExecuteInternal' in subclass."));
  }
}
