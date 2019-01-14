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
  displayname="Class HttpHeadersTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    variables['HttpStatus'] = getInstance("HttpStatus@cfboomHttp");
    variables['HttpHeaders'] = getInstance("HttpHeadersSingleton@cfboomHttp");
  }

  function setup(){
    variables['headers'] = new cfboom.http.HttpHeaders();
  }

  function teardown(){
    structDelete(variables, "headers");
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete(variables, "HttpStatus");
    structDelete(variables, "HttpHeaders");
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testSize() {
    assertEquals(0, headers.size());
  }

  /**
   * @Test
   */
  public void function getFirst() {
    headers.add( HttpHeaders.CACHE_CONTROL, "max-age=1000, public" );
    headers.add( HttpHeaders.CACHE_CONTROL, "s-maxage=1000" );
    assertEqualsCase("max-age=1000, public", headers.getFirst( HttpHeaders.CACHE_CONTROL ) );
  }

  /**
   * @Test
   */
  public void function accept() {
    local['mediaTypes'] = [];
    arrayAppend( local.mediaTypes, "text/html" );
    arrayAppend( local.mediaTypes, "text/plain" );
    headers.setAccept( local.mediaTypes );
    assertEquals( local.mediaTypes, headers.getAccept(), "Invalid Accept header");
    assertEqualsCase( "text/html, text/plain", headers.getFirst( HttpHeaders.ACCEPT ), "Invalid Accept header" );
  }

  /**
   * @Test
   * // SPR-9655
   */
  public void function acceptWithMultipleHeaderValues() {
    headers.add( HttpHeaders.ACCEPT, "text/html" );
    headers.add( HttpHeaders.ACCEPT, "text/plain" );
    local['expected'] = [];
    arrayAppend( local.expected, "text/html" );
    arrayAppend( local.expected, "text/plain" );

  }

  /**
   * @Test
   * // SPR-14506
   */
  public void function acceptWithMultipleCommaSeparatedHeaderValues() {
    headers.add( HttpHeaders.ACCEPT, "text/html,text/pdf" );
    headers.add( HttpHeaders.ACCEPT, "text/plain,text/csv" );
    local['expected'] = [];
    arrayAppend( local.expected, "text/html" );
    arrayAppend( local.expected, "text/pdf" );
    arrayAppend( local.expected, "text/plain" );
    arrayAppend( local.expected, "text/csv" );
    assertEquals( local.expected, headers.getAccept(), "Invalid Accept header" );
  }

  /**
   * @Test
   */
  public void function acceptCharsets() {
    headers.setAcceptCharset( [ "UTF-8", "ISO-8859-1" ] );
    assertEquals( 2, arrayLen( headers.getAcceptCharset() ) );
    assertEqualsCase( "UTF-8", headers.getAcceptCharset()[1].toString(), "Invalid Accept header" );
    assertEqualsCase( "ISO-8859-1", headers.getAcceptCharset()[2].toString(), "Invalid Accept header" );
    assertEqualsCase( "utf-8,iso-8859-1", headers.getFirst( HttpHeaders.ACCEPT_CHARSET ), "Invalid Accept header");
  }

  /**
   * @Test
   */
  public void function acceptCharsetWildcard() {
    headers.set("Accept-Charset", "utf-8;q=0.7,*;q=0.7,ISO-8859-1");
    local['charsets'] = headers.getAcceptCharset();
    assertEqualsCase( "ISO-8859-1", local.charsets[1].toString(), "Invalid Accept header" );
    assertEqualsCase( "UTF-8", local.charsets[2].toString(), "Invalid Accept header" );
  }

  /**
   * @Test
   */
  public void function allow() {
    //EnumSet<HttpMethod> methods = EnumSet.of(HttpMethod.GET, HttpMethod.POST);
    local['methods'] = [ "GET", "POST" ];
    headers.setAllow( local.methods );
    assertEqualsCase( "GET", headers.getAllow()[1].name(), "Invalid Allow header" );
    assertEqualsCase( "POST", headers.getAllow()[2].name(), "Invalid Allow header" );
    assertEqualsCase( "GET,POST", headers.getFirst( "Allow" ), "Invalid Allow header" );
  }

  /**
   * @Test
   */
  public void function contentLength() {
    local['length'] = 42;
    headers.setContentLength( local.length );
    assertEquals( local.length, headers.getContentLength(), "Invalid Content-Length header" );
    assertEquals( "42", headers.getFirst("Content-Length"), "Invalid Content-Length header" );
  }

  /**
   * @Test
   */
  public void function contentType() {
    local['contentType'] = new MediaType("text", "html", StandardCharsets.UTF_8);
    headers.setContentType(contentType);
    assertEquals( contentType, headers.getContentType(), "Invalid Content-Type header" );
    assertEquals( "text/html;charset=UTF-8", headers.getFirst("Content-Type"), "Invalid Content-Type header" );
  }

/**
   * @Test
   * /
  public void function location() throws URISyntaxException {
URI location = new URI("http://www.example.com/hotels");
headers.setLocation(location);
assertEquals("Invalid Location header", location, headers.getLocation());
assertEquals("Invalid Location header", "http://www.example.com/hotels", headers.getFirst("Location"));
}
*/
/**
   * @Test
   * /
  public void function eTag() {
String eTag = "\"v2.6\"";
headers.setETag(eTag);
assertEquals("Invalid ETag header", eTag, headers.getETag());
assertEquals("Invalid ETag header", "\"v2.6\"", headers.getFirst("ETag"));
}
*/
/**
   * @Test
   * /
public void function host() {
InetSocketAddress host = InetSocketAddress.createUnresolved("localhost", 8080);
headers.setHost(host);
assertEquals("Invalid Host header", host, headers.getHost());
assertEquals("Invalid Host header", "localhost:8080", headers.getFirst("Host"));
}
*/
/**
   * @Test
   * /
public void function hostNoPort() {
InetSocketAddress host = InetSocketAddress.createUnresolved("localhost", 0);
headers.setHost(host);
assertEquals("Invalid Host header", host, headers.getHost());
assertEquals("Invalid Host header", "localhost", headers.getFirst("Host"));
}
*/
/*
@Test(expected = IllegalArgumentException.class)
public void function illegalETag() {
String eTag = "v2.6";
headers.setETag(eTag);
assertEquals("Invalid ETag header", eTag, headers.getETag());
assertEquals("Invalid ETag header", "\"v2.6\"", headers.getFirst("ETag"));
}
*/
/**
   * @Test
   * /
public void function ifMatch() {
String ifMatch = "\"v2.6\"";
headers.setIfMatch(ifMatch);
assertEquals("Invalid If-Match header", ifMatch, headers.getIfMatch().get(0));
assertEquals("Invalid If-Match header", "\"v2.6\"", headers.getFirst("If-Match"));
}
*/
/*
@Test(expected = IllegalArgumentException.class)
public void function ifMatchIllegalHeader() {
headers.setIfMatch("Illegal");
headers.getIfMatch();
}
*/
/**
   * @Test
   * /
public void function ifMatchMultipleHeaders() {
headers.add(HttpHeaders.IF_MATCH, "\"v2,0\"");
headers.add(HttpHeaders.IF_MATCH, "W/\"v2,1\", \"v2,2\"");
assertEquals("Invalid If-Match header", "\"v2,0\"", headers.get(HttpHeaders.IF_MATCH).get(0));
assertEquals("Invalid If-Match header", "W/\"v2,1\", \"v2,2\"", headers.get(HttpHeaders.IF_MATCH).get(1));
assertThat(headers.getIfMatch(), Matchers.contains("\"v2,0\"", "W/\"v2,1\"", "\"v2,2\""));
}
*/
/**
   * @Test
   * /
public void function ifNoneMatch() {
String ifNoneMatch = "\"v2.6\"";
headers.setIfNoneMatch(ifNoneMatch);
assertEquals("Invalid If-None-Match header", ifNoneMatch, headers.getIfNoneMatch().get(0));
assertEquals("Invalid If-None-Match header", "\"v2.6\"", headers.getFirst("If-None-Match"));
}
*/
/**
   * @Test
   * /
public void function ifNoneMatchWildCard() {
String ifNoneMatch = "*";
headers.setIfNoneMatch(ifNoneMatch);
assertEquals("Invalid If-None-Match header", ifNoneMatch, headers.getIfNoneMatch().get(0));
assertEquals("Invalid If-None-Match header", "*", headers.getFirst("If-None-Match"));
}
*/
/**
   * @Test
   * /
public void function ifNoneMatchList() {
String ifNoneMatch1 = "\"v2.6\"";
String ifNoneMatch2 = "\"v2.7\", \"v2.8\"";
List<String> ifNoneMatchList = new ArrayList<>(2);
ifNoneMatchList.add(ifNoneMatch1);
ifNoneMatchList.add(ifNoneMatch2);
headers.setIfNoneMatch(ifNoneMatchList);
assertThat(headers.getIfNoneMatch(), Matchers.contains("\"v2.6\"", "\"v2.7\"", "\"v2.8\""));
assertEquals("Invalid If-None-Match header", "\"v2.6\", \"v2.7\", \"v2.8\"", headers.getFirst("If-None-Match"));
}
*/
/**
   * @Test
   * /
public void function date() {
Calendar calendar = new GregorianCalendar(2008, 11, 18, 11, 20);
calendar.setTimeZone(TimeZone.getTimeZone("CET"));
long date = calendar.getTimeInMillis();
headers.setDate(date);
assertEquals("Invalid Date header", date, headers.getDate());
assertEquals("Invalid Date header", "Thu, 18 Dec 2008 10:20:00 GMT", headers.getFirst("date"));

// RFC 850
headers.set("Date", "Thu, 18 Dec 2008 10:20:00 GMT");
assertEquals("Invalid Date header", date, headers.getDate());
}
*/
/*
@Test(expected = IllegalArgumentException.class)
public void function dateInvalid() {
headers.set("Date", "Foo Bar Baz");
headers.getDate();
}
*/
/**
   * @Test
   * /
public void function dateOtherLocale() {
Locale defaultLocale = Locale.getDefault();
try {
Locale.setDefault(new Locale("nl", "nl"));
Calendar calendar = new GregorianCalendar(2008, 11, 18, 11, 20);
calendar.setTimeZone(TimeZone.getTimeZone("CET"));
long date = calendar.getTimeInMillis();
headers.setDate(date);
assertEquals("Invalid Date header", "Thu, 18 Dec 2008 10:20:00 GMT", headers.getFirst("date"));
assertEquals("Invalid Date header", date, headers.getDate());
}
finally {
Locale.setDefault(defaultLocale);
}
}
*/
/**
   * @Test
   * /
public void function lastModified() {
Calendar calendar = new GregorianCalendar(2008, 11, 18, 11, 20);
calendar.setTimeZone(TimeZone.getTimeZone("CET"));
long date = calendar.getTimeInMillis();
headers.setLastModified(date);
assertEquals("Invalid Last-Modified header", date, headers.getLastModified());
assertEquals("Invalid Last-Modified header", "Thu, 18 Dec 2008 10:20:00 GMT",
headers.getFirst("last-modified"));
}
*/
/**
   * @Test
   * /
public void function expires() {
Calendar calendar = new GregorianCalendar(2008, 11, 18, 11, 20);
calendar.setTimeZone(TimeZone.getTimeZone("CET"));
long date = calendar.getTimeInMillis();
headers.setExpires(date);
assertEquals("Invalid Expires header", date, headers.getExpires());
assertEquals("Invalid Expires header", "Thu, 18 Dec 2008 10:20:00 GMT", headers.getFirst("expires"));
}
*/
/**
   * @Test
   * /  // SPR-10648 (example is from INT-3063)
public void function expiresInvalidDate() {
headers.set("Expires", "-1");
assertEquals(-1, headers.getExpires());
}
*/
/**
   * @Test
   * /
public void function ifModifiedSince() {
Calendar calendar = new GregorianCalendar(2008, 11, 18, 11, 20);
calendar.setTimeZone(TimeZone.getTimeZone("CET"));
long date = calendar.getTimeInMillis();
headers.setIfModifiedSince(date);
assertEquals("Invalid If-Modified-Since header", date, headers.getIfModifiedSince());
assertEquals("Invalid If-Modified-Since header", "Thu, 18 Dec 2008 10:20:00 GMT",
headers.getFirst("if-modified-since"));
}
*/
/**
   * @Test
   * /  // SPR-14144
public void function invalidIfModifiedSinceHeader() {
headers.set(HttpHeaders.IF_MODIFIED_SINCE, "0");
assertEquals(-1, headers.getIfModifiedSince());

headers.set(HttpHeaders.IF_MODIFIED_SINCE, "-1");
assertEquals(-1, headers.getIfModifiedSince());

headers.set(HttpHeaders.IF_MODIFIED_SINCE, "XXX");
assertEquals(-1, headers.getIfModifiedSince());
}
*/
/**
   * @Test
   * /
public void function pragma() {
String pragma = "no-cache";
headers.setPragma(pragma);
assertEquals("Invalid Pragma header", pragma, headers.getPragma());
assertEquals("Invalid Pragma header", "no-cache", headers.getFirst("pragma"));
}
*/
/**
   * @Test
   * /
public void function cacheControl() {
String cacheControl = "no-cache";
headers.setCacheControl(cacheControl);
assertEquals("Invalid Cache-Control header", cacheControl, headers.getCacheControl());
assertEquals("Invalid Cache-Control header", "no-cache", headers.getFirst("cache-control"));
}
*/
/**
   * @Test
   * /
public void function cacheControlAllValues() {
headers.add(HttpHeaders.CACHE_CONTROL, "max-age=1000, public");
headers.add(HttpHeaders.CACHE_CONTROL, "s-maxage=1000");
assertThat(headers.getCacheControl(), is("max-age=1000, public, s-maxage=1000"));
}
*/
/**
   * @Test
   * /
public void function contentDisposition() {
ContentDisposition disposition = headers.getContentDisposition();
assertNotNull(disposition);
assertEquals("Invalid Content-Disposition header", ContentDisposition.empty(), headers.getContentDisposition());

disposition = ContentDisposition.builder("attachment").name("foo").filename("foo.txt").size(123L).build();
headers.setContentDisposition(disposition);
assertEquals("Invalid Content-Disposition header", disposition, headers.getContentDisposition());
}
*/
/**
   * @Test
   * /  // SPR-11917
public void function getAllowEmptySet() {
headers.setAllow(Collections.<HttpMethod> emptySet());
assertThat(headers.getAllow(), Matchers.emptyCollectionOf(HttpMethod.class));
}
*/
/**
   * @Test
   * /
public void function accessControlAllowCredentials() {
assertFalse(headers.getAccessControlAllowCredentials());
headers.setAccessControlAllowCredentials(false);
assertFalse(headers.getAccessControlAllowCredentials());
headers.setAccessControlAllowCredentials(true);
assertTrue(headers.getAccessControlAllowCredentials());
}
*/
/**
   * @Test
   * /
public void function accessControlAllowHeaders() {
List<String> allowedHeaders = headers.getAccessControlAllowHeaders();
assertThat(allowedHeaders, Matchers.emptyCollectionOf(String.class));
headers.setAccessControlAllowHeaders(Arrays.asList("header1", "header2"));
allowedHeaders = headers.getAccessControlAllowHeaders();
assertEquals(allowedHeaders, Arrays.asList("header1", "header2"));
}
*/
/**
   * @Test
   * /
public void function accessControlAllowHeadersMultipleValues() {
List<String> allowedHeaders = headers.getAccessControlAllowHeaders();
assertThat(allowedHeaders, Matchers.emptyCollectionOf(String.class));
headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_HEADERS, "header1, header2");
headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_HEADERS, "header3");
allowedHeaders = headers.getAccessControlAllowHeaders();
assertEquals(Arrays.asList("header1", "header2", "header3"), allowedHeaders);
}
*/
/**
   * @Test
   * /
public void function accessControlAllowMethods() {
List<HttpMethod> allowedMethods = headers.getAccessControlAllowMethods();
assertThat(allowedMethods, Matchers.emptyCollectionOf(HttpMethod.class));
headers.setAccessControlAllowMethods(Arrays.asList(HttpMethod.GET, HttpMethod.POST));
allowedMethods = headers.getAccessControlAllowMethods();
assertEquals(allowedMethods, Arrays.asList(HttpMethod.GET, HttpMethod.POST));
}
*/
/**
   * @Test
   * /
public void function accessControlAllowOrigin() {
assertNull(headers.getAccessControlAllowOrigin());
headers.setAccessControlAllowOrigin("*");
assertEquals("*", headers.getAccessControlAllowOrigin());
}
*/
/**
   * @Test
   * /
public void function accessControlExposeHeaders() {
List<String> exposedHeaders = headers.getAccessControlExposeHeaders();
assertThat(exposedHeaders, Matchers.emptyCollectionOf(String.class));
headers.setAccessControlExposeHeaders(Arrays.asList("header1", "header2"));
exposedHeaders = headers.getAccessControlExposeHeaders();
assertEquals(exposedHeaders, Arrays.asList("header1", "header2"));
}
*/
/**
   * @Test
   * /
public void function accessControlMaxAge() {
assertEquals(-1, headers.getAccessControlMaxAge());
headers.setAccessControlMaxAge(3600);
assertEquals(3600, headers.getAccessControlMaxAge());
}
*/
/**
   * @Test
   * /
public void function accessControlRequestHeaders() {
List<String> requestHeaders = headers.getAccessControlRequestHeaders();
assertThat(requestHeaders, Matchers.emptyCollectionOf(String.class));
headers.setAccessControlRequestHeaders(Arrays.asList("header1", "header2"));
requestHeaders = headers.getAccessControlRequestHeaders();
assertEquals(requestHeaders, Arrays.asList("header1", "header2"));
}
*/
/**
   * @Test
   * /
public void function accessControlRequestMethod() {
assertNull(headers.getAccessControlRequestMethod());
headers.setAccessControlRequestMethod(HttpMethod.POST);
assertEquals(HttpMethod.POST, headers.getAccessControlRequestMethod());
}
*/
/**
   * @Test
   * /
public void function acceptLanguage() {
String headerValue = "fr-ch, fr;q=0.9, en-*;q=0.8, de;q=0.7, *;q=0.5";
headers.setAcceptLanguage(Locale.LanguageRange.parse(headerValue));
assertEquals(headerValue, headers.getFirst(HttpHeaders.ACCEPT_LANGUAGE));

List<Locale.LanguageRange> expectedRanges = Arrays.asList(
new Locale.LanguageRange("fr-ch"),
new Locale.LanguageRange("fr", 0.9),
new Locale.LanguageRange("en-*", 0.8),
new Locale.LanguageRange("de", 0.7),
new Locale.LanguageRange("*", 0.5)
);
assertEquals(expectedRanges, headers.getAcceptLanguage());
assertEquals(Locale.forLanguageTag("fr-ch"), headers.getAcceptLanguageAsLocales().get(0));

headers.setAcceptLanguageAsLocales(Collections.singletonList(Locale.FRANCE));
assertEquals(Locale.FRANCE, headers.getAcceptLanguageAsLocales().get(0));
}
*/
/**
   * @Test
   * / // SPR-15603
public void function acceptLanguageWithEmptyValue() throws Exception {
this.headers.set(HttpHeaders.ACCEPT_LANGUAGE, "");
assertEquals(Collections.emptyList(), this.headers.getAcceptLanguageAsLocales());
}
*/
/**
   * @Test
   * /
public void function contentLanguage() {
headers.setContentLanguage(Locale.FRANCE);
assertEquals(Locale.FRANCE, headers.getContentLanguage());
assertEquals("fr-FR", headers.getFirst(HttpHeaders.CONTENT_LANGUAGE));
}
*/
/**
   * @Test
   * /
public void function contentLanguageSerialized() {
headers.set(HttpHeaders.CONTENT_LANGUAGE,  "de, en_CA");
assertEquals("Expected one (first) locale", Locale.GERMAN, headers.getContentLanguage());
}
*/
/*
  public void function testSpeed() {
    var status = HttpStatus.valueOf(200);
    assertEquals(200, status.value());
    assertEquals("OK", status.name());
  }
*/
}
