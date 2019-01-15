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
 * Basic implementation of {@link ClientHttpRequest}.
 *
 * @cfboom Joel Tobey
 */
component
  extends="cfboom.http.message.BasicHttpRequest"
  implements="cfboom.http.client.ClientHttpRequest"
  displayname="Class SimpleClientHttpRequest"
  output="false"
{
  property name="httpClient" inject="BasicHttpClient@cfboom-http";

  public cfboom.http.client.SimpleClientHttpRequest function init( required cfboom.http.HttpMethod method, required any uri ) {
    // Make sure we have an URI
    if ( !isInstanceOf( arguments.uri, "java.net.URI" ) )
      arguments['uri'] = createObject( "java", "java.net.URI" ).init( arguments.uri );

    super.init( arguments.method.value(), arguments.uri.toURL().toString() );
    return this;
  }

  public void function onDIComplete() {
    httpClient.setHttpResponseClass( "cfboom.http.client.SimpleClientHttpResponse" );
  }

  public cfboom.http.client.ClientHttpResponse function execute() {
    local['res'] = httpClient.execute( this );
    return local.res;
  }
}
