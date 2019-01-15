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
  displayname="Class SimpleClientHttpRequestTest"
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

    var jsonExamplePath = expandPath("/tests/specs/client/jsonExample.cfm");
    var trimmedJsonExamplePath = right(jsonExamplePath, len(jsonExamplePath) - len(rootPath));
    trimmedJsonExamplePath = replace(trimmedJsonExamplePath, "\", "/", "all");
    if (left(trimmedJsonExamplePath, 1) != "/") {
      trimmedJsonExamplePath = "/" & trimmedJsonExamplePath;
    }
    variables['JSON_EXAMPLE_FILE'] = trimmedJsonExamplePath;

    var xmlExamplePath = expandPath("/tests/specs/client/xmlExample.cfm");
    var trimmedXmlExamplePath = right(xmlExamplePath, len(xmlExamplePath) - len(rootPath));
    trimmedXmlExamplePath = replace(trimmedXmlExamplePath, "\", "/", "all");
    if (left(trimmedXmlExamplePath, 1) != "/") {
      trimmedXmlExamplePath = "/" & trimmedXmlExamplePath;
    }
    variables['XML_EXAMPLE_FILE'] = trimmedXmlExamplePath;

    variables['HttpMethod'] = getInstance("HttpMethod@cfboom-http");
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete(variables, "EXAMPLE_FILE");
    structDelete(variables, "JSON_EXAMPLE_FILE");
    structDelete(variables, "XML_EXAMPLE_FILE");
    structDelete(variables, "HttpMethod");
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testDefaults() {
    var sb = createObject("java", "java.lang.StringBuilder").init("http");
    if (cgi.server_port_secure)
      sb.append("s");
    sb.append("://")
      .append(cgi.http_host)
      .append(cgi.context_path)
      .append( EXAMPLE_FILE );
    var req = getInstance( name="SimpleClientHttpRequest@cfboom-http", initArguments={ method= HttpMethod.GET, uri = sb.toString() } );
    var res = req.execute();
    assertEqualsCase("example text", res.getFileContent());
  }

  /**
   * @Test
   */
  public void function testJson() {
    var sb = createObject("java", "java.lang.StringBuilder").init("http");
    if (cgi.server_port_secure)
      sb.append("s");
    sb.append("://")
      .append(cgi.http_host)
      .append(cgi.context_path)
      .append( JSON_EXAMPLE_FILE );
    var req = getInstance( name="SimpleClientHttpRequest@cfboom-http", initArguments={ method= HttpMethod.GET, uri = sb.toString() } );
    var res = req.execute();
    assertEqualsCase('{"userId":1,"id":1,"title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}', res.getFileContent());
    var user = res.getDeserializedContent();
    assertEquals( 1, user.userId );
    assertEquals( 1, user.id );
    assertEqualsCase( "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", user.title );
    assertEqualsCase( "quia et suscipit
suscipit recusandae consequuntur expedita et cum
reprehenderit molestiae ut ut quas totam
nostrum rerum est autem sunt rem eveniet architecto", user.body );
  }

  /**
   * @Test
   */
  public void function testXml() {
    var sb = createObject("java", "java.lang.StringBuilder").init("http");
    if (cgi.server_port_secure)
      sb.append("s");
    sb.append("://")
      .append(cgi.http_host)
      .append(cgi.context_path)
      .append( XML_EXAMPLE_FILE );
    var req = getInstance( name="SimpleClientHttpRequest@cfboom-http", initArguments={ method= HttpMethod.GET, uri = sb.toString() } );
    var res = req.execute();
    assertEqualsCase('<?xml version="1.0" encoding="UTF-8"?><note><to>Tove</to><from>Jani</from><heading>Reminder</heading><body>Don''t forget me this weekend!</body></note>', res.getFileContent());
    var doc = res.getDeserializedContent();
    var note = doc.getElementsByTagName("note").item( 0 );
    assertEqualsCase( "Tove", note.getElementsByTagName("to").item( 0 ).getTextContent() );
    assertEqualsCase( "Jani", note.getElementsByTagName("from").item( 0 ).getTextContent() );
    assertEqualsCase( "Reminder", note.getElementsByTagName("heading").item( 0 ).getTextContent() );
    assertEqualsCase( "Don't forget me this weekend!", note.getElementsByTagName("body").item( 0 ).getTextContent() );
  }
}
