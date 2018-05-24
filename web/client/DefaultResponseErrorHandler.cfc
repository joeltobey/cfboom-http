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
 * Spring's default implementation of the {@link ResponseErrorHandler} interface.
 *
 * <p>This error handler checks for the status code on the {@link ClientHttpResponse}:
 * Any code with series {@link org.springframework.http.HttpStatus.Series#CLIENT_ERROR} or
 * {@link org.springframework.http.HttpStatus.Series#SERVER_ERROR} is considered to be an
 * error. This behavior can be changed by overriding the {@link #hasError(HttpStatus)} method.
 *
 * @author Arjen Poutsma
 * @author Rossen Stoyanchev
 * @since 3.0
 * @see RestTemplate#setErrorHandler
 */
component
  extends="cfboom.lang.Object"
  implements="cfboom.http.web.client.ResponseErrorHandler"
  displayname="Class DefaultResponseErrorHandler"
  output="false"
{
  public cfboom.http.web.client.DefaultResponseErrorHandler function init() {
    return this;
  }

  /**
   * Delegates to {@link #hasError(HttpStatus)} with the response status code.
   */
  public boolean function hasError( required cfboom.http.client.ClientHttpResponse response ) {
    return hasErrorFromStatusCode( getHttpStatusCode( arguments.response ) );
  }

  /**
   * This default implementation throws a {@link HttpClientErrorException} if the response status code
   * is {@link org.springframework.http.HttpStatus.Series#CLIENT_ERROR}, a {@link HttpServerErrorException}
   * if it is {@link org.springframework.http.HttpStatus.Series#SERVER_ERROR},
   * and a {@link RestClientException} in other cases.
   */
  public void function handleError( any url, cfboom.http.HttpMethod method, cfboom.http.client.ClientHttpResponse response ) {
    local['statusCode'] = getHttpStatusCode( arguments.response );
    local['errorCode'] = local.statusCode.value();
    local['extendedInfo'] = {};
    if ( arguments.response.hasPrefix() )
      local.extendedInfo['prefix'] = arguments.response.getPrefix();

    if ( local.statusCode.is4xxClientError() ) {
      local['message'] = local.statusCode.value() & " " & arguments.response.getStatusText();
      local['type'] = "cfboom.http.web.client.HttpClientErrorException";
      local['detail'] = "Http Client Error";

    } else if ( local.statusCode.is5xxServerError() ) {
      local['message'] = local.statusCode.value() & " " & arguments.response.getStatusText();
      local['type'] = "cfboom.http.web.client.HttpServerErrorException";
      local['detail'] = "Http Server Error";

    } else {
      local['message'] = "Unknown status code [" & local.statusCode.value() & "]";
      local['type'] = "cfboom.http.web.client.RestClientException";
      local['detail'] = "Http Unknown Error";
    }

    if ( arguments.response.hasRequest() ) {
      local.detail &= " on " & arguments.response.getRequest().getMethod() & " " & arguments.response.getRequest().getURI().toURL().toString();
      local.extendedInfo['request'] = deserializeJson( arguments.response.getRequest().toJson() );
    }

    throw( local.message, local.type, local.detail, local.errorCode, serializeJson( local.extendedInfo ) );
  }

  /**
   * Determine the HTTP status of the given response.
   * @param response the response to inspect
   * @return the associated HTTP status
   * @throws IOException in case of I/O errors
   * @throws UnknownHttpStatusCodeException in case of an unknown status code
   * that cannot be represented with the {@link HttpStatus} enum
   * @since 4.3.8
   */
  public cfboom.http.HttpStatus function getHttpStatusCode( required cfboom.http.client.ClientHttpResponse response ) {
    try {
      return arguments.response.getStatusCode();
    }
    catch ( java.lang.IllegalArgumentException ex ) {
      throw( "Unknown status code [" & toString( arguments.response.getRawStatusCode() ) & "]" & " " & arguments.response.getStatusText(), "UnknownHttpStatusCodeException" );
    }
  }

  /**
   * Template method called from {@link #hasError(ClientHttpResponse)}.
   * <p>The default implementation checks if the given status code is
   * {@link org.springframework.http.HttpStatus.Series#CLIENT_ERROR CLIENT_ERROR}
   * or {@link org.springframework.http.HttpStatus.Series#SERVER_ERROR SERVER_ERROR}.
   * Can be overridden in subclasses.
   * @param statusCode the HTTP status code
   * @return {@code true} if the response has an error; {@code false} otherwise
   * @see #getHttpStatusCode(ClientHttpResponse)
   */
  public boolean function hasErrorFromStatusCode( required cfboom.http.HttpStatus statusCode ) {
    return ( arguments.statusCode.is4xxClientError() || arguments.statusCode.is5xxServerError() );
  }

  /**
   * Determine the charset of the response (for inclusion in a status exception).
   * @param response the response to inspect
   * @return the associated charset, or {@code null} if none
   * @since 4.3.8
   */
  public any function getCharset( required cfboom.http.client.ClientHttpResponse response ) {
    local['headers'] = arguments.response.getHeaders();
    local['contentType'] = local.headers.getContentType();
    if ( structKeyExists( local, "contentType" ) )
      return local.contentType.getCharset();
  }

  /**
   * Read the body of the given response (for inclusion in a status exception).
   * @param response the response to inspect
   * @return the response body as a byte array,
   * or an empty byte array if the body could not be read
   * @since 4.3.8
   */
  public any function getResponseBody( required cfboom.http.client.ClientHttpResponse response ) {
    try {
      return arguments.response.getBody();
    }
    catch ( java.io.IOException ex ) {
      // ignore
    }
    return "";
  }

}
