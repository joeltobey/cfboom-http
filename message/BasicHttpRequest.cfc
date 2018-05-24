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
 * Basic implementation of {@link HttpRequest}.
 *
 * @cfboom Joel Tobey
 */
component
  extends="cfboom.http.message.AbstractHttpMessage"
  implements="cfboom.http.HttpRequest"
  displayname="Class BasicHttpRequest"
  output="false"
{
  import cfboom.http.RequestParam;

  _instance['queryParams'] = {};
  _instance['formFields'] = {};
  _instance['params'] = {};
  _instance['executed'] = false;

  public cfboom.http.message.BasicHttpRequest function init(required string method, required string uri) {
    super.init();
    _instance['method'] = UCase(arguments.method);
    _instance['uri'] = createObject("java","java.net.URI").init(trim(arguments.uri));
    return this;
  }

  public string function getMethod() {
    return _instance.method;
  }

  public any function getURI() {
    return _instance.uri;
  }

  public boolean function hasExecuted() {
    return _instance.executed;
  }

  public void function setExecuted(boolean executed = false) {
    _instance['executed'] = arguments.executed;
  }

  public string function getName() {
    if (structKeyExists(_instance, "name"))
      return _instance.name;
  }

  public void function setName(required string name) {
    _instance['name'] = arguments.name;
  }

  public boolean function containsQueryParam(string name) {
    return structKeyExists(_instance.queryParams, arguments.name);
  }

  public array function getQueryParams(string name) {
    var arrayToReturn = [];
    if (containsQueryParam(arguments.name)) {
      var queryParamsArray = _instance.queryParams[arguments.name];
      for (var queryParam in queryParamsArray) {
        arrayAppend(arrayToReturn, queryParam);
      }
    }
    return arrayToReturn;
  }

  public string function getFirstQueryParam(string name) {
    if (containsQueryParam(arguments.name)) {
      var queryParamsArray = _instance.queryParams[arguments.name];
      if (arrayLen(queryParamsArray))
        return queryParamsArray[1].getValue();
    }
  }

  public string function getLastQueryParam(string name) {
    if (containsQueryParam(arguments.name)) {
      var queryParamsArray = _instance.queryParams[arguments.name];
      if (arrayLen(queryParamsArray))
        return queryParamsArray[arrayLen(queryParamsArray)].getValue();
    }
  }

  public array function getAllQueryParams() {
    var queryParamsArray = [];
    for (var key in _instance.queryParams) {
      for (var queryParam in _instance.queryParams[key]) {
        arrayAppend(queryParamsArray, queryParam);
      }
    }
    return queryParamsArray;
  }

  public void function addQueryParam(string name, string value) {
    var queryParam = new RequestParam(arguments.name, arguments.value, "URL");
    if (!structKeyExists(_instance.queryParams, arguments.name))
      _instance.queryParams[arguments.name] = [];
    arrayAppend(_instance.queryParams[arguments.name], queryParam);
  }

  public void function setQueryParam(string name, string value) {
    var queryParam = new RequestParam(arguments.name, arguments.value, "URL");
    _instance.queryParams[arguments.name] = [ queryParam ];
  }

  public void function setQueryParams(array queryParams) {
    structClear(_instance.queryParams);
    for (var queryParam in arguments.queryParams) {
      if (!structKeyExists(_instance.queryParams, queryParam.getName()))
        _instance.queryParams[queryParam.getName()] = [];
      arrayAppend(_instance.queryParams[queryParam.getName()], queryParam);
    }
  }

  public void function removeQueryParams(string name) {
    structDelete(_instance.queryParams, arguments.name);
  }

  public boolean function containsFormField(string name) {
    return structKeyExists(_instance.formFields, arguments.name);
  }

  public array function getFormFields(string name) {
    var arrayToReturn = [];
    if (containsFormField(arguments.name)) {
      var formFieldsArray = _instance.formFields[arguments.name];
      for (var formField in formFieldsArray) {
        arrayAppend(arrayToReturn, formField);
      }
    }
    return arrayToReturn;
  }

  public string function getFirstFormField(string name) {
    if (containsFormField(arguments.name)) {
      var formFieldsArray = _instance.formFields[arguments.name];
      if (arrayLen(formFieldsArray))
        return formFieldsArray[1].getValue();
    }
  }

  public string function getLastFormField(string name) {
    if (containsFormField(arguments.name)) {
      var formFieldsArray = _instance.formFields[arguments.name];
      if (arrayLen(formFieldsArray))
        return formFieldsArray[arrayLen(formFieldsArray)].getValue();
    }
  }

  public array function getAllFormFields() {
    var formFieldsArray = [];
    for (var key in _instance.formFields) {
      for (var formField in _instance.formFields[key]) {
        arrayAppend(formFieldsArray, formField);
      }
    }
    return formFieldsArray;
  }

  public void function addFormField(string name, string value, boolean encoded = true) {
    var formField = new RequestParam(arguments.name, arguments.value, "formfield");
    formField.setEncoded(arguments.encoded ? "true" : "false");
    if (!structKeyExists(_instance.formFields, arguments.name))
      _instance.formFields[arguments.name] = [];
    arrayAppend(_instance.formFields[arguments.name], formField);
  }

  public void function setFormField(string name, string value, boolean encoded = true) {
    var formField = new RequestParam(arguments.name, arguments.value, "formfield");
    formField.setEncoded(arguments.encoded ? "true" : "false");
    _instance.formFields[arguments.name] = [ formField ];
  }

  public void function setFormFields(array formFields) {
    structClear(_instance.formFields);
    for (var formField in arguments.formFields) {
      if (!structKeyExists(_instance.formFields, formField.getName()))
        _instance.formFields[formField.getName()] = [];
      arrayAppend(_instance.formFields[formField.getName()], formField);
    }
  }

  public void function removeFormFields(string name) {
    structDelete(_instance.formFields, arguments.name);
  }

  public any function getBody() {
    if (structKeyExists(_instance, "body"))
      return _instance.body;
  }

  public void function setBody(cfboom.http.RequestParam body) {
    _instance['body'] = arguments.body;
  }

  public void function addBody(string value) {
    _instance['body'] = new RequestParam("body", arguments.value, "body");
  }

  public void function removeBody() {
    structDelete(_instance, "body");
  }

  public void function addParam(cfboom.http.RequestParam param) {
    if (arguments.param.getType() == "header") {
      if (!structKeyExists(_instance.headers, arguments.param.getName()))
        _instance.headers[arguments.param.getName()] = [];
      arrayAppend(_instance.headers[arguments.param.getName()], arguments.param);
    } else if (arguments.param.getType() == "body") {
      _instance['body'] = arguments.param;
    } else if (arguments.param.getType() == "URL") {
      if (!structKeyExists(_instance.queryParams, arguments.param.getName()))
        _instance.queryParams[arguments.param.getName()] = [];
      arrayAppend(_instance.queryParams[arguments.param.getName()], arguments.param);
    } else if (arguments.param.getType() == "formfield") {
      if (!structKeyExists(_instance.formFields, arguments.param.getName()))
        _instance.formFields[arguments.param.getName()] = [];
      arrayAppend(_instance.formFields[arguments.param.getName()], arguments.param);
    } else {
      if (!structKeyExists(_instance.params, arguments.param.getName()))
        _instance.params[arguments.param.getName()] = [];
      arrayAppend(_instance.params[arguments.param.getName()], arguments.param);
    }
  }

  public array function getAllOtherParams() {
    var paramArray = [];
    for (var key in _instance.params) {
      for (var rp in _instance.params[key]) {
        arrayAppend(paramArray, rp);
      }
    }
    return paramArray;
  }

  public string function toJson( boolean noHeaders = false ) {
    var returnJson = '{"' & listLast(getComponentName(), ".") & '":{'
      & '"method":"#getMethod()#",'
      & '"URI":"#getURI().toURL().toString()#",'
      & '"executed":#_instance.executed#';

    if (!structIsEmpty(_instance.headers) && !noHeaders) {
      returnJson &= ',"headers":' & paramsToJson( _instance.headers );
    }

    if (!structIsEmpty(_instance.queryParams)) {
      returnJson &= ',"queryParams":' & paramsToJson( _instance.queryParams );
    }

    if (!structIsEmpty(_instance.formFields)) {
      returnJson &= ',"formfields":' & paramsToJson( _instance.formFields );
    }

    if (!isNull(getBody())) {
      returnJson &= ',"body":';
      if (isJson(getBody().getValue())) {
        returnJson &= getBody().getValue();
      } else {
        returnJson &= serializeJSON(getBody().getValue());
      }
    }

    if (!structIsEmpty(_instance.params)) {
      returnJson &= ',"params":' & paramsToJson( _instance.params, true );
    }

    returnJson &= '}}';
    return returnJson;
  }

  private string function paramsToJson(required struct params, boolean addType = false) {
    var returnJson = "[";
    var rpKeyArray = structKeyArray( arguments.params );
    arraySort( rpKeyArray, "textnocase" );
    var counter = 0;
    for (var key in rpKeyArray) {
      var rpArray = arguments.params[key];
      for (var rp in rpArray) {
        counter++;
        if (counter > 1)
          returnJson &= ',';
        if (arguments.addType) {
          returnJson &= '{"type":"#rp.getType()#","name":"#rp.getName()#","value":"#rp.getValue()#"}';
        } else {
          returnJson &= '{"#rp.getName()#":"#rp.getValue()#"}';
        }
      }
    }
    returnJson &= ']';
    return returnJson;
  }

  public string function toString() {
    return listLast(getComponentName(), ".") & ": " & _instance.method & " " & _instance.uri.toURL().toString();
  }
}
