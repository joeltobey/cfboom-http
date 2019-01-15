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
 * {@link ClientHttpRequestFactory} implementation that uses standard JDK facilities.
 *
 * @author Arjen Poutsma
 * @author Juergen Hoeller
 * @since 3.0
 * @see java.net.HttpURLConnection
 * @see HttpComponentsClientHttpRequestFactory
 */
component singleton
  extends="cfboom.lang.Object"
  implements="cfboom.http.client.ClientHttpRequestFactory"
  displayname="Class SimpleClientHttpRequestFactory"
  output="false"
{
  property name="wirebox" inject="wirebox";
  property name="HttpMethod" inject="HttpMethod@cfboom-http";

  variables.DEFAULT_CHUNK_SIZE = javaCast( "int", 4096 );

  _instance['standardRequestBody'] = true;

  _instance['bufferRequestBody'] = true;

  _instance['chunkSize'] = DEFAULT_CHUNK_SIZE;

  _instance['connectTimeout'] = javaCast( "int", -1 );

  _instance['readTimeout'] = javaCast( "int", -1 );

  _instance['outputStreaming'] = true;

  public cfboom.http.client.SimpleClientHttpRequestFactory function init() {
    return this;
  }

  /**
   * Indicate whether this request factory should use ColdFusion HTTP.
   */
  public void function setStandardRequestBody( required boolean standardRequestBody ) {
    _instance['standardRequestBody'] = arguments.standardRequestBody;
    /*
     * If we are using standard ColdFusion HTTP, need to set bufferRequestBody
     * to {@code true}.
     */
    if ( arguments.standardRequestBody )
      _instance['bufferRequestBody'] = true;
  }

  /**
   * Indicate whether this request factory should buffer the
   * {@linkplain ClientHttpRequest#getBody() request body} internally.
   * <p>Default is {@code true}. When sending large amounts of data via POST or PUT,
   * it is recommended to change this property to {@code false}, so as not to run
   * out of memory. This will result in a {@link ClientHttpRequest} that either
   * streams directly to the underlying {@link HttpURLConnection} (if the
   * {@link org.springframework.http.HttpHeaders#getContentLength() Content-Length}
   * is known in advance), or that will use "Chunked transfer encoding"
   * (if the {@code Content-Length} is not known in advance).
   * @see #setChunkSize(int)
   * @see HttpURLConnection#setFixedLengthStreamingMode(int)
   */
  public void function setBufferRequestBody( required boolean bufferRequestBody ) {
    _instance['bufferRequestBody'] = arguments.bufferRequestBody;
  }

  /**
   * Set the number of bytes to write in each chunk when not buffering request
   * bodies locally.
   * <p>Note that this parameter is only used when
   * {@link #setBufferRequestBody(boolean) bufferRequestBody} is set to {@code false},
   * and the {@link org.springframework.http.HttpHeaders#getContentLength() Content-Length}
   * is not known in advance.
   * @see #setBufferRequestBody(boolean)
   */
  public void function setChunkSize( required numeric chunkSize ) {
    _instance['chunkSize'] =javaCast( "int",  arguments.chunkSize );
  }

  /**
   * Set the underlying URLConnection's connect timeout (in milliseconds).
   * A timeout value of 0 specifies an infinite timeout.
   * <p>Default is the system's default timeout.
   * @see URLConnection#setConnectTimeout(int)
   */
  public void function setConnectTimeout( required numeric connectTimeout ) {
    _instance['connectTimeout'] =javaCast( "int",  arguments.connectTimeout );
  }

  /**
   * Set the underlying URLConnection's read timeout (in milliseconds).
   * A timeout value of 0 specifies an infinite timeout.
   * <p>Default is the system's default timeout.
   * @see URLConnection#setReadTimeout(int)
   */
  public void function setReadTimeout( required numeric readTimeout ) {
    _instance['readTimeout'] =javaCast( "int",  arguments.readTimeout );
  }

  /**
   * Set if the underlying URLConnection can be set to 'output streaming' mode.
   * Default is {@code true}.
   * <p>When output streaming is enabled, authentication and redirection cannot be handled automatically.
   * If output streaming is disabled, the {@link HttpURLConnection#setFixedLengthStreamingMode} and
   * {@link HttpURLConnection#setChunkedStreamingMode} methods of the underlying connection will never
   * be called.
   * @param outputStreaming if output streaming is enabled
   */
  public void function setOutputStreaming( required boolean outputStreaming ) {
    _instance['outputStreaming'] = arguments.outputStreaming;
  }

  public cfboom.http.client.ClientHttpRequest function createRequest( required any uri, cfboom.http.HttpMethod httpMethod ) {
    // Default to GET if HttpMethod is not provided.
    if ( !structKeyExists( arguments, "httpMethod" ) )
      arguments['httpMethod'] = HttpMethod.GET;

    // Make sure we have an URI
    if ( !isInstanceOf( arguments.uri, "java.net.URI" ) )
      arguments['uri'] = createObject( "java", "java.net.URI" ).init( arguments.uri );

    if ( _instance.standardRequestBody ) {
      return wirebox.getInstance( name="SimpleClientHttpRequest@cfboom-http", initArguments={ method= arguments.httpMethod, uri = arguments.uri } );
    } else {
      local['connection'] = openConnection( arguments.uri.toURL() );
      prepareConnection( local.connection, arguments.httpMethod.value() );

      if ( _instance.bufferRequestBody ) {
        return wirebox.getInstance( name="SimpleBufferingClientHttpRequest@cfboom-http", initArguments={ connection= local.connection, outputStreaming = _instance.outputStreaming } );
      }
      else {
        return new SimpleStreamingClientHttpRequest(connection, this.chunkSize, this._instance );
      }
    }
  }

  /**
   * Opens and returns a connection to the given URL.
   * <p>The default implementation uses the given {@linkplain #setProxy(java.net.Proxy) proxy} -
   * if any - to open a connection.
   * @param url the URL to open a connection to
   * @param proxy the proxy to use, may be {@code null}
   * @return the opened connection
   * @throws IOException in case of I/O errors
   */
  public any function openConnection( required any theUrl ) {
    local['urlConnection'] = arguments.theUrl.openConnection();
    if ( !isInstanceOf( local.urlConnection, "java.net.HttpURLConnection" ) ) {
      throw( object = createObject( "java", "java.lang.IllegalStateException" ).init( "HttpURLConnection required for [" & arguments.theUrl & "] but got: " & local.urlConnection ) );
    }
    return local.urlConnection;
  }

  /**
   * Template method for preparing the given {@link HttpURLConnection}.
   * <p>The default implementation prepares the connection for input and output, and sets the HTTP method.
   * @param connection the connection to prepare
   * @param httpMethod the HTTP request method ({@code GET}, {@code POST}, etc.)
   * @throws IOException in case of I/O errors
   */
  public void function prepareConnection( required any connection, required string httpMethod ) {
    if ( _instance.connectTimeout >= 0 ) {
      arguments.connection.setConnectTimeout( _instance.connectTimeout );
    }
    if ( _instance.readTimeout >= 0 ) {
      arguments.connection.setReadTimeout( _instance.readTimeout );
    }

    arguments.connection.setDoInput( true );

    if ( arguments.httpMethod == "GET" ) {
      arguments.connection.setInstanceFollowRedirects( true );
    }
    else {
      arguments.connection.setInstanceFollowRedirects( false );
    }

    if ( arguments.httpMethod == "POST" || arguments.httpMethod == "PUT" ||
        arguments.httpMethod == "PATCH" || arguments.httpMethod == "DELETE" ) {
      arguments.connection.setDoOutput( true );
    }
    else {
      arguments.connection.setDoOutput( false );
    }

    arguments.connection.setRequestMethod( arguments.httpMethod );
  }

}
