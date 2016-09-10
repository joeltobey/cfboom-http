/*
 * Copyright 2012-2016 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
    displayname="Class BasicHttpClientTest"
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
        var httpClient = getInstance("BasicHttpClient@cfboomHttp");
        var sb = createObject("java", "java.lang.StringBuilder").init("http");
        if (cgi.server_port_secure)
            sb.append("s");
        sb.append("://")
            .append(cgi.http_host)
            .append(cgi.context_path)
            .append( EXAMPLE_FILE );
        var res = httpClient.get(sb.toString());
        assertEqualsCase("example text", res.getFileContent());
    }
}