component
  extends="cfboom.lang.Object"
  implements="cfboom.http.client.ClientHttpRequest"
  displayname="Abstract Class AbstractClientHttpRequest"
  output="false"
{
  _instance['headers'] = new cfboom.http.HttpHeaders();

  _instance['executed'] = false;

  public cfboom.http.client.AbstractClientHttpRequest function init() {
    return this;
  }

  public cfboom.http.HttpHeaders function getHeaders() {
    return _instance.headers;
  }

  public any function getBody() {
    assertNotExecuted();
    return getBodyInternal( _instance.headers );
  }

  public cfboom.http.client.ClientHttpResponse function execute() {
    assertNotExecuted();
    local['result'] = executeInternal( _instance.headers );
    _instance['executed'] = true;
    return local.result;
  }

  /**
   * Assert that this request has not been {@linkplain #execute() executed} yet.
   * @throws IllegalStateException if this request has been executed
   */
  public void function assertNotExecuted() {
    if ( _instance.executed )
      throw( "ClientHttpRequest already executed" );
  }

  /**
   * Abstract template method that returns the body.
   * @param headers the HTTP headers
   * @return the body output stream
   */
  public any function getBodyInternal( required cfboom.http.HttpHeaders headers ) {
    throw(object=createObject("java", "java.lang.AbstractMethodError").init("Must override template method 'getBodyInternal' in subclass."));
  }

  /**
   * Abstract template method that writes the given headers and content to the HTTP request.
   * @param headers the HTTP headers
   * @return the response object for the executed request
   */
  public cfboom.http.client.ClientHttpResponse function executeInternal( required cfboom.http.HttpHeaders headers ) {
    throw(object=createObject("java", "java.lang.AbstractMethodError").init("Must override template method 'executeInternal' in subclass."));
  }
}
