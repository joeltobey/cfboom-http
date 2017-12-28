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
 * Abstract helper implementation of HttpClient
 *
 * @cfboom Joel Tobey
 */
component
  extends="cfboom.lang.Object"
  implements="cfboom.http.client.HttpClient"
  displayname="Abstract Class AbstractHttpClient"
  output="false"
{
  property name="log" inject="logbox:logger:{this}";

  public cfboom.http.client.AbstractHttpClient function init() {
    return this;
  }

  public cfboom.http.HttpResponse function execute( cfboom.http.HttpRequest req ) {
    throw(object=createObject("java", "java.lang.AbstractMethodError").init("Must override template method 'execute' in subclass."));
  }

  public void function setExecutor( cfboom.http.protocol.HttpRequestExecutor executor ) {
    var executorName = "";
    if ( isInstanceOf( arguments.executor,"cfboom.lang.Object" ) ) {
      executorName = arguments.executor.getComponentName();
    } else {
      var executorMeta = getComponentMetadata( arguments.executor );
      executorName = structKeyExists( executorMeta, "fullname" ) ? executorMeta.fullname : executorMeta.name;
    }
    if (!isNull(log))
      log.debug( getComponentName() & " setting executor with [" & executorName & "]") ;
    _instance['executor'] = arguments.executor;
  }

  public cfboom.http.HttpResponse function get( string uri ) {
    var req = new cfboom.http.message.BasicHttpRequest( "GET", arguments.uri );
    return execute( req );
  }
}
