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
 * @cfboom Joel Tobey
 */
component
  extends="coldbox.system.testing.BaseTestCase"
  appMapping="/root"
  displayname="Class RestTemplateTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
  	super.beforeTests();
    variables['RestTemplate'] = getInstance( "RestTemplate@cfboomHttp" );
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete( variables, "RestTemplate" );
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testGetForEntity() {
    var httpResponse = RestTemplate.getForEntity( buildURL("/tests/resources/getForEntity.cfm") );
    assertEqualsCase( "example text", httpResponse.getBody() );
  }

  /**
   * @Test
   */
  public void function testHeadForHeaders() {
    var headers = RestTemplate.headForHeaders( buildURL("/tests/resources/headForHeaders.cfm") );
writeDump(headers);abort;
    assertEqualsCase( "example text", headers.getBody() );
  }

  private string function buildURL( required string path ) {
    var sb = createObject("java", "java.lang.StringBuilder").init("http");
    if (cgi.server_port_secure)
      sb.append("s");
    sb.append("://")
      .append(cgi.http_host)
      .append(cgi.context_path);

    var rootPath = expandPath("/");
    var examplePath = expandPath( arguments.path );
    var trimmedExamplePath = right(examplePath, len(examplePath) - len(rootPath));
    trimmedExamplePath = replace(trimmedExamplePath, "\", "/", "all");
    if (left(trimmedExamplePath, 1) != "/") {
      trimmedExamplePath = "/" & trimmedExamplePath;
    }
    sb.append( trimmedExamplePath );
    return sb.toString();
  }
}
