/*
 * Copyright 2002-2018 the original author or authors and Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * <strong>Spring's central class for synchronous client-side HTTP access.</strong>
 * It simplifies communication with HTTP servers, and enforces RESTful principles.
 * It handles HTTP connections, leaving application code to provide URLs
 * (with possible template variables) and extract results.
 *
 * <p><strong>Note:</strong> by default the RestTemplate relies on standard JDK
 * facilities to establish HTTP connections. You can switch to use a different
 * HTTP library such as Apache HttpComponents, Netty, and OkHttp through the
 * {@link #setRequestFactory} property.
 *
 * <p>The main entry points of this template are the methods named after the six main HTTP methods:
 * <table>
 * <tr><th>HTTP method</th><th>RestTemplate methods</th></tr>
 * <tr><td>DELETE</td><td>{@link #delete}</td></tr>
 * <tr><td>GET</td><td>{@link #getForObject}</td></tr>
 * <tr><td></td><td>{@link #getForEntity}</td></tr>
 * <tr><td>HEAD</td><td>{@link #headForHeaders}</td></tr>
 * <tr><td>OPTIONS</td><td>{@link #optionsForAllow}</td></tr>
 * <tr><td>POST</td><td>{@link #postForLocation}</td></tr>
 * <tr><td></td><td>{@link #postForObject}</td></tr>
 * <tr><td>PUT</td><td>{@link #put}</td></tr>
 * <tr><td>any</td><td>{@link #exchange}</td></tr>
 * <tr><td></td><td>{@link #execute}</td></tr> </table>
 *
 * <p>In addition the {@code exchange} and {@code execute} methods are generalized versions of
 * the above methods and can be used to support additional, less frequent combinations (e.g.
 * HTTP PATCH, HTTP PUT with response body, etc.). Note however that the underlying HTTP
 * library used must also support the desired combination.
 *
 * <p>For each HTTP method there are three variants: two accept a URI template string
 * and URI variables (array or map) while a third accepts a {@link URI}.
 * Note that for URI templates it is assumed encoding is necessary, e.g.
 * {@code restTemplate.getForObject("http://example.com/hotel list")} becomes
 * {@code "http://example.com/hotel%20list"}. This also means if the URI template
 * or URI variables are already encoded, double encoding will occur, e.g.
 * {@code http://example.com/hotel%20list} becomes
 * {@code http://example.com/hotel%2520list}). To avoid that use a {@code URI} method
 * variant to provide (or re-use) a previously encoded URI. To prepare such an URI
 * with full control over encoding, consider using
 * {@link org.springframework.web.util.UriComponentsBuilder}.
 *
 * <p>Internally the template uses {@link HttpMessageConverter} instances to
 * convert HTTP messages to and from POJOs. Converters for the main mime types
 * are registered by default but you can also register additional converters
 * via {@link #setMessageConverters}.
 *
 * <p>This template uses a
 * {@link org.springframework.http.client.SimpleClientHttpRequestFactory} and a
 * {@link DefaultResponseErrorHandler} as default strategies for creating HTTP
 * connections or handling HTTP errors, respectively. These defaults can be overridden
 * through {@link #setRequestFactory} and {@link #setErrorHandler} respectively.
 *
 * @author Arjen Poutsma
 * @author Brian Clozel
 * @author Roy Clarkson
 * @author Juergen Hoeller
 * @since 3.0
 * @see HttpMessageConverter
 * @see RequestCallback
 * @see ResponseExtractor
 * @see ResponseErrorHandler
 */
component
  extends="cfboom.http.client.support.HttpAccessor"
  implements="cfboom.http.web.client.RestOperations"
  displayname="Class RestTemplate"
  output="false"
{
  property name="wirebox" inject="wirebox";
  property name="errorHandler" inject="cfboom.http.web.client.DefaultResponseErrorHandler";
  property name="responseEntityExtractor" inject="cfboom.http.web.client.SimpleExtractor";
  property name="headersExtractor" inject="cfboom.http.web.client.HeadersExtractor";
  property name="acceptHeaderRequestCallback" inject="cfboom.http.web.client.AcceptHeaderRequestCallback";
  property name="httpEntityRequestCallback" inject="cfboom.http.web.client.HttpEntityRequestCallback";
  property name="uriTemplateHandler" inject="cfboom.http.web.util.DefaultUriBuilderFactory";
  property name="HttpMethod" inject="HttpMethod@cfboomHttp";

  public cfboom.http.web.client.RestTemplate function init() {
    return this;
  }

  /**
   * Set the error handler.
   * <p>By default, RestTemplate uses a {@link DefaultResponseErrorHandler}.
   */
  public void function setErrorHandler( required cfboom.http.web.client.ResponseErrorHandler errorHandler ) {
    variables['errorHandler'] = arguments.errorHandler;
  }

  /**
   * Return the error handler.
   */
  public cfboom.http.web.client.ResponseErrorHandler function getErrorHandler() {
    return variables.errorHandler;
  }

  /**
   * Configure the {@link UriTemplateHandler} to use to expand URI templates.
   * By default the {@link DefaultUriBuilderFactory} is used which relies on
   * Spring's URI template support and exposes several useful properties that
   * customize its behavior for encoding and for prepending a common base URL.
   * An alternative implementation may be used to plug an external URI
   * template library.
   * @param handler the URI template handler to use
   */
  public void function setUriTemplateHandler(UriTemplateHandler handler) {
    variables.uriTemplateHandler = handler;
  }

  /**
   * Return the configured URI template handler.
   */
  public cfboom.http.web.util.UriTemplateHandler function getUriTemplateHandler() {
    return variables.uriTemplateHandler;
  }

  public any function getForObject( required string uri, struct uriVariables = {}, string responseType ) {
    throw(object=createObject("java", "java.lang.UnsupportedOperationException").init("Method 'getForObject' not supported."));
  }

  public any function getForEntity( required string uri, struct uriVariables = {}, string responseType ) {
    return execute( arguments.uri, HttpMethod.GET, acceptHeaderRequestCallback, responseEntityExtractor, arguments.uriVariables );
  }

  public cfboom.http.HttpHeaders function headForHeaders( required string uri, struct uriVariables = {} ) {
    return execute( arguments.uri, HttpMethod.HEAD, javaCast("null",""), headersExtractor, arguments.uriVariables );
  }

  public any function postForLocation( required string uri, any req, struct uriVariables = {} ) {
    local['headers'] = execute( arguments.uri, HttpMethod.POST, httpEntityRequestCallback, headersExtractor, arguments.uriVariables );
    local.headers.getLocation();
  }

  public any function postForObject( required string uri, any req, struct uriVariables = {}, string responseType ) {
    throw(object=createObject("java", "java.lang.UnsupportedOperationException").init("Method 'postForObject' not supported."));
  }

  public any function postForEntity( required string uri, any req, struct uriVariables = {}, string responseType ) {
    return execute( arguments.uri, HttpMethod.POST, httpEntityRequestCallback, responseEntityExtractor, arguments.uriVariables );
  }

  public void function put( required string uri, any req, struct uriVariables = {} ) {
    return execute( arguments.uri, HttpMethod.PUT, httpEntityRequestCallback, javaCast("null", ""), arguments.uriVariables );
  }

  public any function patchForObject( required string uri, any req, struct uriVariables = {}, string responseType ) {
    throw(object=createObject("java", "java.lang.UnsupportedOperationException").init("Method 'patchForObject' not supported."));
  }

  public void function delete( required string uri, struct uriVariables = {} ) {
    execute( arguments.uri, HttpMethod.DELETE, javaCast("null", ""), javaCast("null", ""), arguments.uriVariables );
  }

  public any function optionsForAllow( required string uri, struct uriVariables = {} ) {
    local['headers'] = execute( arguments.uri, HttpMethod.OPTIONS, javaCast("null", ""), headersExtractor, arguments.uriVariables );
    local.headers.getAllow();
  }

  public any function exchange( string uri, cfboom.http.HttpMethod method, any requestEntity, string responseType, struct uriVariables = {} ) {
    return execute( arguments.uri, arguments.method, httpEntityRequestCallback, responseEntityExtractor, arguments.uriVariables );
  }

  public any function execute( required string uri, cfboom.http.HttpMethod method, any requestCallback, any responseExtractor, struct uriVariables = {} ) {
    local['expanded'] = getUriTemplateHandler().expand( arguments.uri, arguments.uriVariables );
    local['args'] = {};
    local.args['uri'] = local.expanded;
    local.args['method'] = arguments.method;
    if ( structKeyExists( arguments, "requestCallback" ) )
      local.args['requestCallback'] = arguments.requestCallback;
    if ( structKeyExists( arguments, "responseExtractor" ) )
      local.args['responseExtractor'] = arguments.responseExtractor;
    return doExecute( argumentCollection = local.args );
  }

  /**
   * Execute the given method on the provided URI.
   * <p>The {@link ClientHttpRequest} is processed using the {@link RequestCallback};
   * the response with the {@link ResponseExtractor}.
   * @param url the fully-expanded URL to connect to
   * @param method the HTTP method to execute (GET, POST, etc.)
   * @param requestCallback object that prepares the request (can be {@code null})
   * @param responseExtractor object that extracts the return value from the response (can be {@code null})
   * @return an arbitrary object, as returned by the {@link ResponseExtractor}
   */
  public any function doExecute( required any uri, required cfboom.http.HttpMethod method, any requestCallback, any responseExtractor ) {
    try {
      local['req'] = createRequest( arguments.uri, arguments.method );
      if ( structKeyExists( arguments, "requestCallback" ) ) {
        requestCallback.doWithRequest( local.req );
      }
      local['response'] = local.req.execute();
      handleResponse( arguments.uri, arguments.method, local.response );
      if ( structKeyExists( arguments, "responseExtractor" ) ) {
        return arguments.responseExtractor.extractData( local.response );
      }
      else {
        return;
      }
    }
    catch ( java.io.IOException ex ) {
      local['resource'] = arguments.uri.toString();
      local['query'] = arguments.uri.getRawQuery();
      local['resource'] = ( structKeyExists( local, "query" ) ? local.resource.substring( javaCast("int", 0), local.resource.indexOf( javaCast("int", local.query ) - 1) ) : local.resource );
      throw("I/O error on " & arguments.method.value() &
        " request for """ & local.resource & """: " & ex.getMessage(), "ResourceAccessException" );
    }
    finally {
      if ( structKeyExists( local, "response" ) ) {
        local.response.close();
      }
    }
  }

  /**
   * Handle the given response, performing appropriate logging and
   * invoking the {@link ResponseErrorHandler} if necessary.
   * <p>Can be overridden in subclasses.
   * @param url the fully-expanded URL to connect to
   * @param method the HTTP method to execute (GET, POST, etc.)
   * @param response the resulting {@link ClientHttpResponse}
   * @throws IOException if propagated from {@link ResponseErrorHandler}
   * @since 4.1.6
   * @see #setErrorHandler
   */
  public void function handleResponse( required any uri, required cfboom.http.HttpMethod method, required cfboom.http.client.ClientHttpResponse response ) {
    local['errorHandler'] = getErrorHandler();
    local['hasError'] = local.errorHandler.hasError( arguments.response );
    if ( log.canDebug() ) {
      try {
        log.debug( arguments.method.name() & " request for """ & arguments.uri & """ resulted in " &
                   arguments.response.getRawStatusCode() & " (" & arguments.response.getStatusText() & ")" &
                  ( local.hasError ? "; invoking error handler" : ""));
      }
      catch ( java.io.IOException ex ) {
        // ignore
      }
    }
    if ( local.hasError ) {
      local.errorHandler.handleError( arguments.uri, arguments.method, arguments.response );
    }
  }

}
