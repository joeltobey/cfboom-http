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
 * {@code HttpRequestExecutor} is a client side HTTP protocol handler based
 * on the blocking (classic) I/O model.
 * <p>
 * {@code HttpRequestExecutor} relies on {@link HttpProcessor} to generate
 * mandatory protocol headers for all outgoing messages and apply common,
 * cross-cutting message transformations to all incoming and outgoing messages.
 * Application specific processing can be implemented outside
 * {@code HttpRequestExecutor} once the request has been executed and
 * a response has been received.
 *
 * @cfboom Joel Tobey
 *
 * @singleton
 */
component
  extends="cfboom.lang.Object"
  implements="cfboom.http.protocol.HttpRequestExecutor"
  displayname="Class BasicHttpRequestExecutor"
  output=false
{
  property name="httpResponse" inject="coldbox:setting:httpResponse@cfboom-http";
  property name="HttpStatus" inject="HttpStatus@cfboomHttp";
  property name="wirebox" inject="wirebox";

  public cfboom.http.protocol.BasicHttpRequestExecutor function init() {
    return this;
  }

  public void function onDIComplete() {
    _instance['httpResponseClass'] = httpResponse;
  }

  public void function setHttpResponseClass( required string httpResponseClass ) {
    _instance['httpResponseClass'] = arguments.httpResponseClass;
  }

  public cfboom.http.HttpResponse function execute( cfboom.http.HttpRequest req ) {
    var httpService = new http();
    httpService.setUrl( arguments.req.getURI().toURL().toString() );
    httpService.setMethod( arguments.req.getMethod() );
    if ( !isNull( arguments.req.getName() ) )
      httpService.setName( arguments.req.getName() );
    for ( var header in arguments.req.getAllHeaders() ) {
      httpService.addParam( type="header", name="#header.getName()#", value="#header.getValue()#" );
    }
    if ( !isNull( arguments.req.getBody() ) ) {
      httpService.addParam( type="body", value="#arguments.req.getBody().getValue()#" );
    }
    for ( var queryParam in arguments.req.getAllQueryParams() ) {
      httpService.addParam( type="URL", name="#queryParam.getName()#", value="#queryParam.getValue()#" );
    }
    for ( var formField in arguments.req.getAllFormFields() ) {
      httpService.addParam( type="formfield", name="#formField.getName()#", value="#formField.getValue()#", encoded="#formField.getEncoded()#" );
    }
    for ( var rp in arguments.req.getAllOtherParams() ) {
      if ( rp.getType() == "XML" ) {
        httpService.addParam( type="XML", value="#rp.getValue()#" );
      } else if ( rp.getType() == "file" ) {
        httpService.addParam( type="file", name="#rp.getName()#", file="#rp.getFile()#", mimetype="#rp.getMimeType()#" );
      } else if ( rp.getType() == "CGI" ) {
        httpService.addParam( type="CGI", name="#rp.getName()#", value="#rp.getValue()#", encoded="#rp.getEncoded()#" );
      } else {
        // cookie is the only type left
        httpService.addParam( type="cookie", name="#rp.getName()#", value="#rp.getValue()#" );
      }
    }

    var res = wirebox.getInstance( name=_instance.httpResponseClass, initArguments={ result= httpService.send() } );
    arguments.req.setExecuted( true );
    res.setStatus( HttpStatus.valueOf( res.getCode() ) );
    res.setRequest( arguments.req );
    return res;
  }
}
