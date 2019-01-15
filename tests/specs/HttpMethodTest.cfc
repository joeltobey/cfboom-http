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
  displayname="Class HttpMethodTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();

    variables['httpMethods'] = {};
    httpMethods.put("GET", "GET");
    httpMethods.put("HEAD", "HEAD");
    httpMethods.put("POST", "POST");
    httpMethods.put("PUT", "PUT");
    httpMethods.put("PATCH", "PATCH");
    httpMethods.put("DELETE", "DELETE");
    httpMethods.put("OPTIONS", "OPTIONS");
    httpMethods.put("TRACE", "TRACE");


    variables['HttpMethod'] = getInstance("HttpMethod@cfboom-http");
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete(variables, "httpMethods");
    structDelete(variables, "HttpMethod");
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testValue() {
    assertEquals( HttpMethod.GET.value(), "GET" , "Value is not GET");
    assertEquals( HttpMethod.HEAD.value(), "HEAD" , "Value is not HEAD");
    assertEquals( HttpMethod.POST.value(), "POST" , "Value is not POST");
    assertEquals( HttpMethod.PUT.value(), "PUT" , "Value is not PUT");
    assertEquals( HttpMethod.PATCH.value(), "PATCH" , "Value is not PATCH");
    assertEquals( HttpMethod.DELETE.value(), "DELETE" , "Value is not DELETE");
    assertEquals( HttpMethod.OPTIONS.value(), "OPTIONS" , "Value is not OPTIONS");
    assertEquals( HttpMethod.TRACE.value(), "TRACE" , "Value is not TRACE");
  }

  /**
   * @Test
   */
  public void function testResolve() {
    assertEquals( HttpMethod.resolve( "GET" ).value(), "GET" , "Resolved value is not GET");
    assertEquals( HttpMethod.resolve( "HEAD" ).value(), "HEAD" , "Resolved value is not HEAD");
    assertEquals( HttpMethod.resolve( "POST" ).value(), "POST" , "Resolved value is not POST");
    assertEquals( HttpMethod.resolve( "PUT" ).value(), "PUT" , "Resolved value is not PUT");
    assertEquals( HttpMethod.resolve( "PATCH" ).value(), "PATCH" , "Resolved value is not PATCH");
    assertEquals( HttpMethod.resolve( "DELETE" ).value(), "DELETE" , "Resolved value is not DELETE");
    assertEquals( HttpMethod.resolve( "OPTIONS" ).value(), "OPTIONS" , "Resolved value is not OPTIONS");
    assertEquals( HttpMethod.resolve( "TRACE" ).value(), "TRACE" , "Resolved value is not TRACE");
  }

  /**
   * @Test
   */
  public void function testMatches() {
    assertTrue( HttpMethod.GET.matches( "GET" ), "Didn't match GET");
    assertTrue( HttpMethod.HEAD.matches( "HEAD" ), "Didn't match HEAD");
    assertTrue( HttpMethod.POST.matches( "POST" ), "Didn't match POST");
    assertTrue( HttpMethod.PUT.matches( "PUT" ), "Didn't match PUT");
    assertTrue( HttpMethod.PATCH.matches( "PATCH" ), "Didn't match PATCH");
    assertTrue( HttpMethod.DELETE.matches( "DELETE" ), "Didn't match DELETE");
    assertTrue( HttpMethod.OPTIONS.matches( "OPTIONS" ), "Didn't match OPTIONS");
    assertTrue( HttpMethod.TRACE.matches( "TRACE" ), "Didn't match TRACE");
  }

  /**
   * @Test
   */
  public void function testNotMatches() {
    assertFalse( HttpMethod.GET.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.HEAD.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.POST.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.PUT.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.PATCH.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.DELETE.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.OPTIONS.matches( "FOO" ), "It matched FOO");
    assertFalse( HttpMethod.TRACE.matches( "FOO" ), "It matched FOO");
  }

}
