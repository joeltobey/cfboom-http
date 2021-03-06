﻿/*
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
 * @cfboom Joel Tobey
 */
component
  extends="coldbox.system.testing.BaseTestCase"
  appMapping="/root"
  displayname="Class BasicHttpRequestExecutorTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
  	super.beforeTests();
    var rootPath = expandPath("/");
    var examplePath = expandPath("/tests/specs/protocol/example.cfm");
    var trimmedExamplePath = right(examplePath, len(examplePath) - len(rootPath));
    trimmedExamplePath = replace(trimmedExamplePath, "\", "/", "all");
    if (left(trimmedExamplePath, 1) != "/") {
    	trimmedExamplePath = "/" & trimmedExamplePath;
    }
    variables['EXAMPLE_FILE'] = trimmedExamplePath;
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete(variables, "EXAMPLE_FILE");
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testDefaults() {
    var executor = getInstance( "cfboom.http.protocol.BasicHttpRequestExecutor" );
    var sb = createObject("java", "java.lang.StringBuilder").init("http");
    if (cgi.server_port_secure)
      sb.append("s");
    sb.append("://")
      .append(cgi.http_host)
      .append(cgi.context_path)
      .append( EXAMPLE_FILE );
    var req = new cfboom.http.message.BasicHttpRequest("GET", sb.toString());
    var res = executor.execute( req );
    assertEqualsCase("example text", res.getFileContent());
  }

  /**
   * @Test
   */
  public void function testWithBody() {
    var executor = getInstance( "cfboom.http.protocol.BasicHttpRequestExecutor" );
    var sb = createObject("java", "java.lang.StringBuilder").init("http");
    if (cgi.server_port_secure)
      sb.append("s");
    sb.append("://")
      .append(cgi.http_host)
      .append(cgi.context_path)
      .append( EXAMPLE_FILE );
    var req = new cfboom.http.message.BasicHttpRequest("POST", sb.toString());
    req.addBody("foobarbaz");
    var res = executor.execute( req );
    assertEqualsCase("example text", res.getFileContent());
  }
}
