/*
 * Copyright 2002-2016 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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

    _instance['headers'] = {};

    public cfboom.http.message.AbstractHttpMessage function init() {
        return this;
    }

    public boolean function containsHeader(string name) {
        return structKeyExists(_instance.headers, arguments.name);
    }

    public array function getHeaders(string name) {
        var arrayToReturn = [];
        if (containsHeader(arguments.name)) {
            var headerArray = _instance.headers[arguments.name];
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
            var headerArray = _instance.headers[arguments.name];
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
            var headerArray = _instance.headers[arguments.name];
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
        for (var key in _instance.headers) {
            for (var header in _instance.headers[key]) {
                arrayAppend(headerArray, header);
            }
        }
        return headerArray;
    }

    public void function addHeader(string name, string value) {
        var headerParam = new RequestParam(arguments.name, arguments.value, "header");
        if (!structKeyExists(_instance.headers, arguments.name))
            _instance.headers[arguments.name] = [];
        arrayAppend(_instance.headers[arguments.name], headerParam);
    }

    public void function setHeader(string name, string value) {
        var headerParam = new RequestParam(arguments.name, arguments.value, "header");
        _instance.headers[arguments.name] = [ headerParam ];
    }

    public void function setHeaders(array headers) {
        structClear(_instance.headers);
        for (var header in arguments.headers) {
            if (!structKeyExists(_instance.headers, header.getName()))
                _instance.headers[header.getName()] = [];
            arrayAppend(_instance.headers[header.getName()], header);
        }
    }

    public void function removeHeaders(string name) {
        structDelete(_instance.headers, arguments.name);
    }

    public numeric function getContentLength() {
        if (structKeyExists(_instance, "contentLength")) {
            return javaCast("long", _instance.contentLength);
        } else {
            return javaCast("long", -1);
        }
    }

    public string function getContentType() {
        if (structKeyExists(_instance, "contentType"))
            return _instance.contentType;
    }

    public string function getContentEncoding() {
        if (structKeyExists(_instance, "contentEncoding"))
            return _instance.contentEncoding;
    }
}
