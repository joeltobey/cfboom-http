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
  extends="cfboom.http.client.AbstractBufferingClientHttpRequest"
  implements="cfboom.http.client.ClientHttpRequest"
  displayname="Class SimpleBufferingClientHttpRequest"
  output="false"
{
  property name="HttpMethod" inject="HttpMethod@cfboom-http";

  /**
   * @connection.hint java.net.HttpURLConnection
   */
  public cfboom.http.client.SimpleBufferingClientHttpRequest function init( required any connection, boolean outputStreaming = false ) {
    _instance['connection'] = arguments.connection;
    _instance['outputStreaming'] = arguments.outputStreaming;
    return this;
  }

  public string function getMethodValue() {
    return _instance.connection.getRequestMethod();
  }

  public any function getMethod() {
    return HttpMethod.resolve(getMethodValue());
  }

  public any function getURI() {
    try {
      return _instance.connection.getURL().toURI();
    }
    catch ( java.net.URISyntaxException ex ) {
      throw( object = createObject( "java", "java.lang.IllegalStateException" ).init( "Could not get HttpURLConnection URI: " & ex.getMessage(), ex ) );
    }
  }

  public cfboom.http.client.ClientHttpResponse function doExecuteInternal( cfboom.http.HttpHeaders headers, any bufferedOutput ) {
    addHeaders( _instance.connection, arguments.headers );
    // JDK <1.8 doesn't support getOutputStream with HTTP DELETE
    if ( HttpMethod.DELETE.matches( getMethod().value() ) && arguments.bufferedOutput.length == 0 ) {
      _instance.connection.setDoOutput( false );
    }
    if ( _instance.connection.getDoOutput() && _instance.outputStreaming ) {
      _instance.connection.setFixedLengthStreamingMode( arguments.bufferedOutput.length );
    }
    _instance.connection.connect();
    if ( _instance.connection.getDoOutput() ) {
      FileCopyUtils.copy( arguments.bufferedOutput, _instance.connection.getOutputStream() );
    }
    else {
      // Immediately trigger the request in a no-output scenario as well
      _instance.connection.getResponseCode();
    }
    return new cfboom.http.client.SimpleClientHttpResponse( _instance.connection );
  }

  /**
   * Add the given headers to the given HTTP connection.
   * @param connection the connection to add the headers to
   * @param headers the headers to add
   */
  public void function addHeaders( required any connection, cfboom.http.HttpHeaders headers ) {
/*
    for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
      local['headerName'] = entry.getKey();
      if (HttpHeaders.COOKIE.equalsIgnoreCase(headerName)) {  // RFC 6265
        local['headerValue'] = StringUtils.collectionToDelimitedString(entry.getValue(), "; ");
        connection.setRequestProperty(headerName, headerValue);
      }
      else {
        for (String headerValue : entry.getValue()) {
          String actualHeaderValue = headerValue != null ? headerValue : "";
          connection.addRequestProperty(headerName, actualHeaderValue);
        }
      }
    }
*/
  }

}
