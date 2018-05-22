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
  displayname="Class HttpStatusTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();

    variables['statusCodes'] = {};
    statusCodes.put(javaCast("int", 0), "UNAVAILABLE");

    statusCodes.put(javaCast("int", 100), "CONTINUE");
    statusCodes.put(javaCast("int", 101), "SWITCHING_PROTOCOLS");
    statusCodes.put(javaCast("int", 102), "PROCESSING");
    statusCodes.put(javaCast("int", 103), "CHECKPOINT");

    statusCodes.put(javaCast("int", 200), "OK");
    statusCodes.put(javaCast("int", 201), "CREATED");
    statusCodes.put(javaCast("int", 202), "ACCEPTED");
    statusCodes.put(javaCast("int", 203), "NON_AUTHORITATIVE_INFORMATION");
    statusCodes.put(javaCast("int", 204), "NO_CONTENT");
    statusCodes.put(javaCast("int", 205), "RESET_CONTENT");
    statusCodes.put(javaCast("int", 206), "PARTIAL_CONTENT");
    statusCodes.put(javaCast("int", 207), "MULTI_STATUS");
    statusCodes.put(javaCast("int", 208), "ALREADY_REPORTED");
    statusCodes.put(javaCast("int", 226), "IM_USED");

    statusCodes.put(javaCast("int", 300), "MULTIPLE_CHOICES");
    statusCodes.put(javaCast("int", 301), "MOVED_PERMANENTLY");
    statusCodes.put(javaCast("int", 302), "FOUND");
    statusCodes.put(javaCast("int", 303), "SEE_OTHER");
    statusCodes.put(javaCast("int", 304), "NOT_MODIFIED");
    statusCodes.put(javaCast("int", 305), "USE_PROXY");
    statusCodes.put(javaCast("int", 307), "TEMPORARY_REDIRECT");
    statusCodes.put(javaCast("int", 308), "PERMANENT_REDIRECT");

    statusCodes.put(javaCast("int", 400), "BAD_REQUEST");
    statusCodes.put(javaCast("int", 401), "UNAUTHORIZED");
    statusCodes.put(javaCast("int", 402), "PAYMENT_REQUIRED");
    statusCodes.put(javaCast("int", 403), "FORBIDDEN");
    statusCodes.put(javaCast("int", 404), "NOT_FOUND");
    statusCodes.put(javaCast("int", 405), "METHOD_NOT_ALLOWED");
    statusCodes.put(javaCast("int", 406), "NOT_ACCEPTABLE");
    statusCodes.put(javaCast("int", 407), "PROXY_AUTHENTICATION_REQUIRED");
    statusCodes.put(javaCast("int", 408), "REQUEST_TIMEOUT");
    statusCodes.put(javaCast("int", 409), "CONFLICT");
    statusCodes.put(javaCast("int", 410), "GONE");
    statusCodes.put(javaCast("int", 411), "LENGTH_REQUIRED");
    statusCodes.put(javaCast("int", 412), "PRECONDITION_FAILED");
    statusCodes.put(javaCast("int", 413), "PAYLOAD_TOO_LARGE");
    statusCodes.put(javaCast("int", 414), "URI_TOO_LONG");
    statusCodes.put(javaCast("int", 415), "UNSUPPORTED_MEDIA_TYPE");
    statusCodes.put(javaCast("int", 416), "REQUESTED_RANGE_NOT_SATISFIABLE");
    statusCodes.put(javaCast("int", 417), "EXPECTATION_FAILED");
    statusCodes.put(javaCast("int", 418), "I_AM_A_TEAPOT");
    statusCodes.put(javaCast("int", 422), "UNPROCESSABLE_ENTITY");
    statusCodes.put(javaCast("int", 423), "LOCKED");
    statusCodes.put(javaCast("int", 424), "FAILED_DEPENDENCY");
    statusCodes.put(javaCast("int", 426), "UPGRADE_REQUIRED");
    statusCodes.put(javaCast("int", 428), "PRECONDITION_REQUIRED");
    statusCodes.put(javaCast("int", 429), "TOO_MANY_REQUESTS");
    statusCodes.put(javaCast("int", 431), "REQUEST_HEADER_FIELDS_TOO_LARGE");
    statusCodes.put(javaCast("int", 451), "UNAVAILABLE_FOR_LEGAL_REASONS");

    statusCodes.put(javaCast("int", 500), "INTERNAL_SERVER_ERROR");
    statusCodes.put(javaCast("int", 501), "NOT_IMPLEMENTED");
    statusCodes.put(javaCast("int", 502), "BAD_GATEWAY");
    statusCodes.put(javaCast("int", 503), "SERVICE_UNAVAILABLE");
    statusCodes.put(javaCast("int", 504), "GATEWAY_TIMEOUT");
    statusCodes.put(javaCast("int", 505), "HTTP_VERSION_NOT_SUPPORTED");
    statusCodes.put(javaCast("int", 506), "VARIANT_ALSO_NEGOTIATES");
    statusCodes.put(javaCast("int", 507), "INSUFFICIENT_STORAGE");
    statusCodes.put(javaCast("int", 508), "LOOP_DETECTED");
    statusCodes.put(javaCast("int", 509), "BANDWIDTH_LIMIT_EXCEEDED");
    statusCodes.put(javaCast("int", 510), "NOT_EXTENDED");
    statusCodes.put(javaCast("int", 511), "NETWORK_AUTHENTICATION_REQUIRED");

    variables['HttpStatus'] = getInstance("HttpStatus@cfboomHttp");
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete(variables, "statusCodes");
    structDelete(variables, "HttpStatus");
    super.afterTests();
  }

  public void function testFromMapToEnum() {
    for (var key in statusCodes) {
      var value = key;
      var status = HttpStatus.valueOf(value);
      assertEquals(value, status.value(), "Invalid value");
      assertEquals(statusCodes[key], status.name(), "Invalid name for [" & value & "]");
    }
  }

  public void function testFromEnumToMap() {
    for (var key in HttpStatus.values()) {
      var status = HttpStatus.values()[key];
      var value = status.value();
      if (value == 302 || value == 413 || value == 414) {
        continue;
      }
      assertTrue(structKeyExists(statusCodes, value), "Map has no value for [" & value & "]");
      assertEquals(statusCodes.get(value), status.name(), "Invalid name for [" & value & "]");
    }
  }

  public void function testSpeed() {
    var status = HttpStatus.valueOf(200);
    assertEquals(200, status.value());
    assertEquals("OK", status.name());
  }
}
