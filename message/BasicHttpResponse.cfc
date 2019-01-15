/*
 * Copyright 2016-2019 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
 * Basic implementation of {@link HttpResponse}.
 *
 * @cfboom Joel Tobey
 */
component
  extends="cfboom.http.message.AbstractHttpMessage"
  implements="cfboom.http.HttpResponse"
  displayname="Class BasicHttpResponse"
  output="false"
{
  import cfboom.http.RequestParam;

  variables['_code'] = javaCast("int", 999);
  variables['_reasonPhrase'] = "Unknown";

  public cfboom.http.message.BasicHttpResponse function init( any result ) {
    super.init();
    if ( structKeyExists( arguments, "result" ) ) {
      if ( structKeyExists( arguments.result, "getPrefix" ) ) {
        // cfscript http result
        variables['_source'] = arguments.result;
        processPrefix( arguments.result.getPrefix() );
      } else {
        // cfhttp
        processPrefix( arguments.result );
      }
    }
    return this;
  }

  private void function processPrefix( struct prefix ) {
    variables['_prefix'] = arguments.prefix;
    if ( structKeyExists( variables._prefix, "status_code" ) )
      variables['_code'] = javaCast("int", variables._prefix.status_code);
    if ( structKeyExists( variables._prefix, "status_text" ) )
      variables['_reasonPhrase'] = variables._prefix.status_text;
    if ( structKeyExists( variables._prefix, "responseheader" ) )
      variables['_headers'] = variables._prefix.responseheader;

    // Deserialize JSON if needed
    if ( findNoCase( "json", getMimeType() ) ) {
      if ( isJson( getFileContent() ) )
        variables._prefix['deserializedContent'] = deserializeJson( getFileContent() );
    }

    // Deserialize XML if needed
    if ( findNoCase( "xml", getMimeType() ) ) {
      if ( isXml( getFileContent() ) )
        variables._prefix['deserializedContent'] = xmlParse( getFileContent() );
    }
  }

  public void function setStatus( required cfboom.http.HttpStatus status ) {
    variables['_status'] = status;
  }

  public cfboom.http.HttpStatus function getStatus() {
    return variables._status;
  }

  public numeric function getCode() {
    return variables._code;
  }

  public string function getReasonPhrase() {
    return variables._reasonPhrase;
  }

  public boolean function hasRequest() {
    return structKeyExists( variables, "_request" );
  }

  public any function getRequest() {
    if ( structKeyExists( variables, "_request" ) )
      return variables._request;
  }

  public void function setRequest( cfboom.http.HttpRequest req ) {
    variables['_request'] = arguments.req;
  }

  public boolean function isInformational() {
    return variables._status.is1xxInformational();
  }

  public boolean function isSuccess() {
    return variables._status.is2xxSuccessful();
  }

  public boolean function isRedirection() {
    return variables._status.is3xxRedirection();
  }

  public boolean function isClientError() {
    return variables._status.is4xxClientError();
  }

  public boolean function isServerError() {
    return variables._status.is5xxServerError();
  }

  public any function getSource() {
    if ( structKeyExists( variables, "_source" ) )
      return variables._source;
  }

  public any function getResult() {
    if ( structKeyExists( variables, "_source" ) )
      return variables._source.getResult();
  }

  public boolean function hasPrefix() {
    return structKeyExists( variables, "_prefix" );
  }

  public any function getPrefix() {
    if ( structKeyExists( variables, "_prefix" ) )
      return variables._prefix;
  }

  public string function getFileContent() {
    if ( structKeyExists( variables, "_prefix" ) && structKeyExists( variables._prefix, "filecontent" ) )
      return variables._prefix.filecontent;
  }

  public any function getDeserializedContent() {
    if ( structKeyExists( variables, "_prefix" ) && structKeyExists( variables._prefix, "deserializedContent" ))
      return variables._prefix.deserializedContent;
  }

  public string function getMimeType() {
    if ( structKeyExists( variables, "_prefix" ) && structKeyExists( variables._prefix, "mimetype" ) )
      return variables._prefix.mimetype;
  }

  public string function getErrorDetail() {
    if ( structKeyExists( variables, "_prefix" ) && structKeyExists( variables._prefix, "errordetail" ) )
      return variables._prefix.errordetail;
  }

  public any function getCookies() {
    if ( structKeyExists( variables, "_prefix" ) && structKeyExists( variables._prefix, "cookies" ) )
      return variables._prefix.cookies;
  }

  public boolean function containsHeader( string name ) {
    return structKeyExists( variables._headers, arguments.name );
  }

  public array function getHeaders( string name ) {
    var arrayToReturn = [];
    if ( structKeyExists( variables._headers, arguments.name ) ) {
      if ( isArray( variables._headers[ arguments.name ] ) ) {
        arrayToReturn = variables._headers[ arguments.name ];
      } else {
        arrayAppend( arrayToReturn, variables._headers[ arguments.name ] );
      }
    }
    return arrayToReturn;
  }

  public string function getFirstHeader( string name ) {
    if ( structKeyExists( variables._headers, arguments.name ) ) {
      if ( isArray( variables._headers[ arguments.name ] ) ) {
        return variables._headers[ arguments.name ][ 1 ];
      } else {
        return variables._headers[ arguments.name ];
      }
    }
  }

  public string function getLastHeader( string name ) {
    if ( structKeyExists( variables._headers, arguments.name ) ) {
      if ( isArray( variables._headers[ arguments.name ] ) ) {
        return variables._headers[ arguments.name ][ arrayLen( variables._headers[ arguments.name ] ) ];
      } else {
        return variables._headers[ arguments.name ];
      }
    }
  }

  public array function getAllHeaders() {
    var headerArray = [];
    for ( var key in variables._headers ) {
      if ( isArray( variables._headers[ key ] ) ) {
        for ( var value in variables._headers[ key ] ) {
          arrayAppend( headerArray, new RequestParam( key, value, "header" ) );
        }
      } else {
        arrayAppend( headerArray, new RequestParam( key, variables._headers[ key ], "header" ) );
      }
    }
    return headerArray;
  }

  public string function toString() {
    var sb = createObject("java", "java.lang.StringBuilder").init();
    sb.append( variables._code ).append( " " ).append( variables._reasonPhrase ).append( " " ).append( super.toString() );
    return sb.toString();
  }
}
