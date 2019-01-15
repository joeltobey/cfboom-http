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
 * Basic implementation of {@link HttpMessage}.
 *
 * @cfboom Joel Tobey
 */
component
  extends="cfboom.lang.Object"
  implements="cfboom.http.HttpMessage"
  displayname="Abstract Class AbstractHttpMessage"
  output="false"
{
  import cfboom.http.RequestParam;

  variables['_headers'] = {};

  public cfboom.http.message.AbstractHttpMessage function init() {
    return this;
  }

  public boolean function containsHeader(string name) {
    return structKeyExists(variables._headers, arguments.name);
  }

  public array function getHeaders(string name) {
    var arrayToReturn = [];
    if (containsHeader(arguments.name)) {
      var headerArray = variables._headers[arguments.name];
      if (isArray(headerArray)) {
        for (var header in headerArray) {
          arrayAppend(arrayToReturn, header.getValue());
        }
      } else {
        arrayAppend(arrayToReturn, headerArray.getValue());
      }
    }
    return arrayToReturn;
  }

  public string function getFirstHeader(string name) {
    if (containsHeader(arguments.name)) {
      var headerArray = variables._headers[arguments.name];
      if (isArray(headerArray)) {
        if (arrayLen(headerArray))
          return headerArray[1].getValue();
      } else {
        return headerArray.getValue();
      }
    }
  }

  public string function getLastHeader(string name) {
    if (containsHeader(arguments.name)) {
      var headerArray = variables._headers[arguments.name];
      if (isArray(headerArray)) {
        if (arrayLen(headerArray))
          return headerArray[arrayLen(headerArray)].getValue();
      } else {
        return headerArray.getValue();
      }
    }
  }

  public array function getAllHeaders() {
    var headerArray = [];
    for (var key in variables._headers) {
      for (var header in variables._headers[key]) {
        arrayAppend(headerArray, header);
      }
    }
    return headerArray;
  }

  public void function addHeader(string name, string value) {
    var headerParam = new RequestParam(arguments.name, arguments.value, "header");
    if (!structKeyExists(variables._headers, arguments.name))
      variables._headers[arguments.name] = [];
    arrayAppend(variables._headers[arguments.name], headerParam);
  }

  public void function setHeader(string name, string value) {
    var headerParam = new RequestParam(arguments.name, arguments.value, "header");
    variables._headers[arguments.name] = [ headerParam ];
  }

  public void function setHeaders(array headers) {
    structClear(variables._headers);
    for (var header in arguments.headers) {
      if (!structKeyExists(variables._headers, header.getName()))
        variables._headers[header.getName()] = [];
      arrayAppend(variables._headers[header.getName()], header);
    }
  }

  public void function removeHeaders(string name) {
    structDelete(variables._headers, arguments.name);
  }

  public numeric function getContentLength() {
    if (structKeyExists(variables, "contentLength")) {
      return javaCast("long", variables.contentLength);
    } else {
      return javaCast("long", -1);
    }
  }

  public string function getContentType() {
    if (structKeyExists(variables, "contentType"))
      return variables.contentType;
  }

  public string function getContentEncoding() {
    if (structKeyExists(variables, "contentEncoding"))
      return variables.contentEncoding;
  }
}
