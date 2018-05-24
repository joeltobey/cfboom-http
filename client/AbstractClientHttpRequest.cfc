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
 *
 */
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

  public void function addBody( string body ) {
    if ( structKeyExists( arguments, "body" ) )
      _instance['body'] = arguments.body;
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

  public string function toJson( boolean noHeaders = false ) {
    var returnJson = '{"' & listLast(getComponentName(), ".") & '":{'
      & '"method":"#getMethod().name()#",'
      & '"URI":"#getURI().toURL().toString()#",'
      & '"executed":#_instance.executed#';
    returnJson &= '}}';
    return returnJson;
  }

  public string function toString() {
    return listLast(getComponentName(), ".") & ": " & getMethod().name() & " " & getURI().toURL().toString();
  }
}
