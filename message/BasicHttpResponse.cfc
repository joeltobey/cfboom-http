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
 * Basic implementation of {@link HttpResponse}.
 *
 * @cfboom Joel Tobey
 */
component
    extends="cfboom.http.message.AbstractHttpMessage"
    implements="cfboom.http.HttpResponse"
    displayname="Class BasicHttpResponse"
    output="false"
{
    _instance['code'] = javaCast("int", 999);
    _instance['reasonPhrase'] = "Unknown";

    public cfboom.http.message.BasicHttpResponse function init(any result) {
        super.init();
        if (structKeyExists(arguments, "result")) {
            if (structKeyExists(arguments.result, "getPrefix")) {
                // cfscript http result
                _instance['source'] = arguments.result;
                processPrefix(arguments.result.getPrefix());
            } else {
                // cfhttp
                processPrefix(arguments.result);
            }
        }
        return this;
    }

    private void function processPrefix(struct prefix) {
        _instance['prefix'] = arguments.prefix;
        if (structKeyExists(_instance.prefix, "status_code"))
            _instance['code'] = javaCast("int", _instance.prefix.status_code);
        if (structKeyExists(_instance.prefix, "status_text"))
            _instance['reasonPhrase'] = _instance.prefix.status_text;
    }

    public numeric function getCode() {
        return _instance.code;
    }

    public string function getReasonPhrase() {
        return _instance.reasonPhrase;
    }

    public any function getRequest() {
        if (structKeyExists(_instance, "request"))
            return _instance.request;
    }

    public void function setRequest(cfboom.http.HttpRequest req) {
        _instance['request'] = arguments.req;
    }

    public boolean function isInformational() {
        if (left(getCode(), 1) == 1)
            return true;
        return false;
    }

    public boolean function isSuccess() {
        if (left(getCode(), 1) == 2)
            return true;
        return false;
    }

    public boolean function isRedirection() {
        if (left(getCode(), 1) == 3)
            return true;
        return false;
    }

    public boolean function isClientError() {
        if (left(getCode(), 1) == 4)
            return true;
        return false;
    }

    public boolean function isServerError() {
        if (left(getCode(), 1) == 5)
            return true;
        return false;
    }

    public any function getSource() {
        if (structKeyExists(_instance, "source"))
            return _instance.source;
    }

    public any function getResult() {
        if (structKeyExists(_instance, "source"))
            return _instance.source.getResult();
    }

    public any function getPrefix() {
        if (structKeyExists(_instance, "prefix"))
            return _instance.prefix;
    }

    public string function getFileContent() {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "filecontent"))
            return _instance.prefix.filecontent;
    }

    public any function getDeserializedContent() {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "deserializedContent"))
            return _instance.prefix.deserializedContent;
    }

    public string function getMimeType() {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "mimetype"))
            return _instance.prefix.mimetype;
    }

    public string function getErrorDetail() {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "errordetail"))
            return _instance.prefix.errordetail;
    }

    public any function getCookies() {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "cookies"))
            return _instance.prefix.cookies;
    }

    public boolean function containsHeader(string name) {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "responseheader"))
            return structKeyExists(_instance.prefix.responseheader, arguments.name);
        return false;
    }

    public array function getHeaders(string name) {
        var arrayToReturn = [];
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "responseheader")) {
            if (structKeyExists(_instance.prefix.responseheader, arguments.name)) {
                if (isArray(_instance.prefix.responseheader[arguments.name])) {
                    arrayToReturn = _instance.prefix.responseheader[arguments.name];
                } else {
                    arrayAppend(arrayToReturn, _instance.prefix.responseheader[arguments.name]);
                }
            }
        }
        return arrayToReturn;
    }

    public string function getFirstHeader(string name) {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "responseheader")) {
            if (structKeyExists(_instance.prefix.responseheader, arguments.name)) {
                if (isArray(_instance.prefix.responseheader[arguments.name])) {
                    return _instance.prefix.responseheader[arguments.name][1];
                } else {
                    return _instance.prefix.responseheader[arguments.name];
                }
            }
        }
    }

    public string function getLastHeader(string name) {
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "responseheader")) {
            if (structKeyExists(_instance.prefix.responseheader, arguments.name)) {
                if (isArray(_instance.prefix.responseheader[arguments.name])) {
                    return _instance.prefix.responseheader[arguments.name][arrayLen(_instance.prefix.responseheader[arguments.name])];
                } else {
                    return _instance.prefix.responseheader[arguments.name];
                }
            }
        }
    }

    public array function getAllHeaders() {
        var headerArray = [];
        if (structKeyExists(_instance, "prefix") && structKeyExists(_instance.prefix, "responseheader")) {
            for (var key in _instance.prefix.responseheader) {
                if (isArray(_instance.prefix.responseheader[key])) {
                    for (var value in _instance.prefix.responseheader[key]) {
                        arrayAppend(headerArray, new cfboom.http.RequestParam(key, value, "header"));
                    }
                } else {
                    arrayAppend(headerArray, new cfboom.http.RequestParam(key, _instance.prefix.responseheader[key], "header"));
                }
            }
        }
        return headerArray;
    }

    public string function toString() {
        sb = createObject("java", "java.lang.StringBuilder").init();
        sb.append(_instance.code).append(" ").append(_instance.reasonPhrase).append(" ").append(super.toString());
        return sb.toString();
    }
}