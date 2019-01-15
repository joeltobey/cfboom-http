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
 * @cfboom Joel Tobey
 */
component
  extends="coldbox.system.testing.BaseTestCase"
  appMapping="/root"
  displayname="Class BasicHttpRequestTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
  	super.beforeTests();
  	variables['TEST_SITE'] = "http://www.foo.com";
  }

  // this will run once after all tests have been run
  public void function afterTests() {
  	structDelete(variables, "TEST_SITE");
  	super.afterTests();
  }

  /**
   * @Test
   */
  public void function testBasic() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertEqualsCase("GET", req.getMethod());
    assertEqualsCase(TEST_SITE, req.getURI().toString());
    assertFalse(req.hasExecuted(), "Request says it executed before it did.");
    assertEqualsCase("BasicHttpRequest: GET http://www.foo.com", req.toString());
    assertEqualsCase('{"BasicHttpRequest":{"method":"GET","URI":"' & TEST_SITE & '","executed":false}}', req.toJson());
    req.addHeader("foo", "a");
    req.addQueryParam("bar", "b");
    req.addFormField("baz", "c");
    req.addBody("foobarbaz");
    req.setExecuted(true);
    assertTrue(req.hasExecuted(), "Request should have executed.");
    assertEqualsCase("BasicHttpRequest: GET http://www.foo.com", req.toString());
    assertEqualsCase('{"BasicHttpRequest":{"method":"GET","URI":"' & TEST_SITE & '","executed":true,"headers":[{"foo":"a"}],"queryParams":[{"bar":"b"}],"formfields":[{"baz":"c"}],"body":"foobarbaz"}}', req.toJson());
  }

  /**
   * @Test
   */
  public void function testContainsQueryParam() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertFalse(req.containsQueryParam("foo"));
    req.setQueryParam("foo", "bar");
    assertTrue(req.containsQueryParam("foo"));
  }

  /**
   * @Test
   */
  public void function testGetQueryParams() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertEquals(0, arrayLen(req.getQueryParams("foo")));
    req.addQueryParam("foo", "bar");
    assertEquals(1, arrayLen(req.getQueryParams("foo")));
    req.addQueryParam("foo", "baz");
    assertEquals(2, arrayLen(req.getQueryParams("foo")));
    req.removeQueryParams("foo");
    assertEquals(0, arrayLen(req.getQueryParams("foo")));
  }

  /**
   * @Test
   */
  public void function testQueryParams() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertEquals(0, arrayLen(req.getQueryParams("foo")));
    req.addQueryParam("foo", "1");
    assertEqualsCase("1", req.getFirstQueryParam("foo"));
    req.addQueryParam("foo", "2");
    assertEqualsCase("1", req.getFirstQueryParam("foo"));
    assertEqualsCase("2", req.getLastQueryParam("foo"));
    assertEquals(2, arrayLen(req.getQueryParams("foo")));
    req.addQueryParam("bar", "a");
    assertEquals(1, arrayLen(req.getQueryParams("bar")));
    assertEquals(2, arrayLen(req.getQueryParams("foo")));
    assertEquals(3, arrayLen(req.getAllQueryParams()));

    req.setQueryParam("foo", "1");
    assertEquals(1, arrayLen(req.getQueryParams("foo")));
    assertEquals(2, arrayLen(req.getAllQueryParams()));

    var rp1 = new cfboom.http.RequestParam("foo", "3", "URL");
    var rp2 = new cfboom.http.RequestParam("foo", "4", "URL");
    var rp3 = new cfboom.http.RequestParam("bar", "5", "URL");
    var rp4 = new cfboom.http.RequestParam("baz", "6", "URL");
    req.setQueryParams([rp1, rp2, rp3, rp4]);
    assertEquals(2, arrayLen(req.getQueryParams("foo")));
    assertEquals(1, arrayLen(req.getQueryParams("bar")));
    assertEquals(1, arrayLen(req.getQueryParams("baz")));
    assertEquals(4, arrayLen(req.getAllQueryParams()));
  }

  /**
   * @Test
   */
  public void function testContainsFormField() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertFalse(req.containsFormField("foo"));
    req.setFormField("foo", "bar");
    assertTrue(req.containsFormField("foo"));
  }

  /**
   * @Test
   */
  public void function testGetFormFields() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertEquals(0, arrayLen(req.getFormFields("foo")));
    req.addFormField("foo", "bar");
    assertEquals(1, arrayLen(req.getFormFields("foo")));
    req.addFormField("foo", "baz");
    assertEquals(2, arrayLen(req.getFormFields("foo")));
    req.removeFormFields("foo");
    assertEquals(0, arrayLen(req.getFormFields("foo")));
  }

  /**
   * @Test
   */
  public void function testFormFields() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertEquals(0, arrayLen(req.getFormFields("foo")));
    req.addFormField("foo", "1");
    assertEqualsCase("1", req.getFirstFormField("foo"));
    req.addFormField("foo", "2");
    assertEqualsCase("1", req.getFirstFormField("foo"));
    assertEqualsCase("2", req.getLastFormField("foo"));
    assertEquals(2, arrayLen(req.getFormFields("foo")));
    req.addFormField("bar", "a");
    assertEquals(1, arrayLen(req.getFormFields("bar")));
    assertEquals(2, arrayLen(req.getFormFields("foo")));
    assertEquals(3, arrayLen(req.getAllFormFields()));

    req.setFormField("foo", "1");
    assertEquals(1, arrayLen(req.getFormFields("foo")));
    assertEquals(2, arrayLen(req.getAllFormFields()));

    var rp1 = new cfboom.http.RequestParam("foo", "3", "formfield");
    var rp2 = new cfboom.http.RequestParam("foo", "4", "formfield");
    var rp3 = new cfboom.http.RequestParam("bar", "5", "formfield");
    var rp4 = new cfboom.http.RequestParam("baz", "6", "formfield");
    req.setFormFields([rp1, rp2, rp3, rp4]);
    assertEquals(2, arrayLen(req.getFormFields("foo")));
    assertEquals(1, arrayLen(req.getFormFields("bar")));
    assertEquals(1, arrayLen(req.getFormFields("baz")));
    assertEquals(4, arrayLen(req.getAllFormFields()));
  }

  /**
   * @Test
   */
  public void function testBody() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    this.$assert.null(req.getBody());
    req.addBody("foo");
    assertEqualsCase("foo", req.getBody().getValue());
    var rp1 = new cfboom.http.RequestParam("body", "foobarbaz", "body");
    req.setBody(rp1);
    assertEqualsCase("foobarbaz", req.getBody().getValue());
    this.$assert.notNull(req.getBody());
    req.removeBody();
    this.$assert.null(req.getBody());
  }

  /**
   * @Test
   */
  public void function testParam() {
    var req = new cfboom.http.message.BasicHttpRequest("get", TEST_SITE);
    assertEqualsCase("GET", req.getMethod());
    assertEqualsCase(TEST_SITE, req.getURI().toString());
    assertFalse(req.hasExecuted(), "Request says it executed before it did.");
    assertEqualsCase("BasicHttpRequest: GET http://www.foo.com", req.toString());
    assertEqualsCase('{"BasicHttpRequest":{"method":"GET","URI":"' & TEST_SITE & '","executed":false}}', req.toJson());
    req.addParam(new cfboom.http.RequestParam("foo", "a", "header"));
    req.addParam(new cfboom.http.RequestParam("bar", "b"));
    req.addParam(new cfboom.http.RequestParam("baz", "c", "formfield"));
    req.addParam(new cfboom.http.RequestParam("body", "foobarbaz", "body"));
    req.addParam(new cfboom.http.RequestParam("abc", "123", "cookie"));
    req.setExecuted(true);
    assertTrue(req.hasExecuted(), "Request should have executed.");
    assertEqualsCase("BasicHttpRequest: GET http://www.foo.com", req.toString());
    assertEqualsCase('{"BasicHttpRequest":{"method":"GET","URI":"' & TEST_SITE & '","executed":true,"headers":[{"foo":"a"}],"queryParams":[{"bar":"b"}],"formfields":[{"baz":"c"}],"body":"foobarbaz","params":[{"type":"cookie","name":"abc","value":"123"}]}}', req.toJson());
  }
}
