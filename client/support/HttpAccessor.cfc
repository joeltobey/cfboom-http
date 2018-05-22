component
  extends="cfboom.lang.Object"
  displayname="Abstract Class HttpAccessor"
  output="false"
{
  property name="requestFactory" inject="SimpleClientHttpRequestFactory@cfboomHttp";
  property name="HttpMethod" inject="HttpMethod@cfboomHttp";
  property name="log" inject="logbox:logger:{this}";

  public cfboom.http.client.support.HttpAccessor function init() {
    return this;
  }

  /**
   * Set the request factory that this accessor uses for obtaining client request handles.
   * <p>The default is a {@link SimpleClientHttpRequestFactory} based on the JDK's own
   * HTTP libraries ({@link java.net.HttpURLConnection}).
   * <p><b>Note that the standard JDK HTTP library does not support the HTTP PATCH method.
   * Configure the Apache HttpComponents or OkHttp request factory to enable PATCH.</b>
   * @see #createRequest(URI, HttpMethod)
   * @see org.springframework.http.client.HttpComponentsAsyncClientHttpRequestFactory
   * @see org.springframework.http.client.OkHttp3ClientHttpRequestFactory
   */
  public void function setRequestFactory( required cfboom.http.client.SimpleClientHttpRequestFactory requestFactory ) {
    variables['requestFactory'] = arguments.requestFactory;
  }

  /**
   * Return the request factory that this accessor uses for obtaining client request handles.
   */
  public cfboom.http.client.SimpleClientHttpRequestFactory function getRequestFactory() {
    return variables.requestFactory;
  }

  /**
   * Create a new {@link ClientHttpRequest} via this template's {@link ClientHttpRequestFactory}.
   * @param url the URL to connect to
   * @param method the HTTP method to execute (GET, POST, etc)
   * @return the created request
   * @throws IOException in case of I/O errors
   * @see #getRequestFactory()
   * @see ClientHttpRequestFactory#createRequest(URI, HttpMethod)
   */
  public cfboom.http.client.ClientHttpRequest function createRequest( required any uri, cfboom.http.HttpMethod method ) {
    if ( !structKeyExists( arguments, "method" ) )
      arguments['method'] = HttpMethod.GET;
    local['req'] = getRequestFactory().createRequest( arguments.uri, arguments.method );
    log.debug("Created " & arguments.method.value() & " request for """ & arguments.uri & """");
    return local.req;
  }

}
