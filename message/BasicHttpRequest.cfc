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

  variables['_queryParams'] = {};
  variables['_formFields'] = {};
  variables['_params'] = {};
  variables['_executed'] = false;

  public cfboom.http.message.BasicHttpRequest function init(required string method, required string uri) {
    super.init();
    variables['_method'] = UCase(arguments.method);
    variables['_uri'] = createObject("java","java.net.URI").init(trim(arguments.uri));
    return this;
  }

  public string function getMethod() {
    return variables._method;
  }

  public any function getURI() {
    return variables._uri;
  }

  public boolean function hasExecuted() {
    return variables._executed;
  }

  public void function setExecuted(boolean executed = false) {
    variables['_executed'] = arguments.executed;
  }

  public string function getName() {
    if (structKeyExists(variables, "_name"))
      return variables._name;
  }

  public void function setName(required string name) {
    variables['_name'] = arguments.name;
  }

  public boolean function containsQueryParam(string name) {
    return structKeyExists(variables._queryParams, arguments.name);
  }

  public array function getQueryParams(string name) {
    var arrayToReturn = [];
    if (containsQueryParam(arguments.name)) {
      var queryParamsArray = variables._queryParams[arguments.name];
      for (var queryParam in queryParamsArray) {
        arrayAppend(arrayToReturn, queryParam);
      }
    }
    return arrayToReturn;
  }

  public string function getFirstQueryParam(string name) {
    if (containsQueryParam(arguments.name)) {
      var queryParamsArray = variables._queryParams[arguments.name];
      if (arrayLen(queryParamsArray))
        return queryParamsArray[1].getValue();
    }
  }

  public string function getLastQueryParam(string name) {
    if (containsQueryParam(arguments.name)) {
      var queryParamsArray = variables._queryParams[arguments.name];
      if (arrayLen(queryParamsArray))
        return queryParamsArray[arrayLen(queryParamsArray)].getValue();
    }
  }

  public array function getAllQueryParams() {
    var queryParamsArray = [];
    for (var key in variables._queryParams) {
      for (var queryParam in variables._queryParams[key]) {
        arrayAppend(queryParamsArray, queryParam);
      }
    }
    return queryParamsArray;
  }

  public void function addQueryParam(string name, string value) {
    var queryParam = new RequestParam(arguments.name, arguments.value, "URL");
    if (!structKeyExists(variables._queryParams, arguments.name))
      variables._queryParams[arguments.name] = [];
    arrayAppend(variables._queryParams[arguments.name], queryParam);
  }

  public void function setQueryParam(string name, string value) {
    var queryParam = new RequestParam(arguments.name, arguments.value, "URL");
    variables._queryParams[arguments.name] = [ queryParam ];
  }

  public void function setQueryParams(array queryParams) {
    structClear(variables._queryParams);
    for (var queryParam in arguments.queryParams) {
      if (!structKeyExists(variables._queryParams, queryParam.getName()))
        variables._queryParams[queryParam.getName()] = [];
      arrayAppend(variables._queryParams[queryParam.getName()], queryParam);
    }
  }

  public void function removeQueryParams(string name) {
    structDelete(variables._queryParams, arguments.name);
  }

  public boolean function containsFormField(string name) {
    return structKeyExists(variables._formFields, arguments.name);
  }

  public array function getFormFields(string name) {
    var arrayToReturn = [];
    if (containsFormField(arguments.name)) {
      var formFieldsArray = variables._formFields[arguments.name];
      for (var formField in formFieldsArray) {
        arrayAppend(arrayToReturn, formField);
      }
    }
    return arrayToReturn;
  }

  public string function getFirstFormField(string name) {
    if (containsFormField(arguments.name)) {
      var formFieldsArray = variables._formFields[arguments.name];
      if (arrayLen(formFieldsArray))
        return formFieldsArray[1].getValue();
    }
  }

  public string function getLastFormField(string name) {
    if (containsFormField(arguments.name)) {
      var formFieldsArray = variables._formFields[arguments.name];
      if (arrayLen(formFieldsArray))
        return formFieldsArray[arrayLen(formFieldsArray)].getValue();
    }
  }

  public array function getAllFormFields() {
    var formFieldsArray = [];
    for (var key in variables._formFields) {
      for (var formField in variables._formFields[key]) {
        arrayAppend(formFieldsArray, formField);
      }
    }
    return formFieldsArray;
  }

  public void function addFormField(string name, string value, boolean encoded = true) {
    var formField = new RequestParam(arguments.name, arguments.value, "formfield");
    formField.setEncoded(arguments.encoded ? "true" : "false");
    if (!structKeyExists(variables._formFields, arguments.name))
      variables._formFields[arguments.name] = [];
    arrayAppend(variables._formFields[arguments.name], formField);
  }

  public void function setFormField(string name, string value, boolean encoded = true) {
    var formField = new RequestParam(arguments.name, arguments.value, "formfield");
    formField.setEncoded(arguments.encoded ? "true" : "false");
    variables._formFields[arguments.name] = [ formField ];
  }

  public void function setFormFields(array formFields) {
    structClear(variables._formFields);
    for (var formField in arguments.formFields) {
      if (!structKeyExists(variables._formFields, formField.getName()))
        variables._formFields[formField.getName()] = [];
      arrayAppend(variables._formFields[formField.getName()], formField);
    }
  }

  public void function removeFormFields(string name) {
    structDelete(variables._formFields, arguments.name);
  }

  public any function getBody() {
    if (structKeyExists(variables, "_body"))
      return variables._body;
  }

  public void function setBody(cfboom.http.RequestParam body) {
    variables['_body'] = arguments.body;
  }

  public void function addBody(string value) {
    variables['_body'] = new RequestParam("body", arguments.value, "body");
  }

  public void function removeBody() {
    structDelete(variables, "_body");
  }

  public void function addParam(cfboom.http.RequestParam param) {
    if (arguments.param.getType() == "header") {
      if (!structKeyExists(variables._headers, arguments.param.getName()))
        variables._headers[arguments.param.getName()] = [];
      arrayAppend(variables._headers[arguments.param.getName()], arguments.param);
    } else if (arguments.param.getType() == "body") {
      variables['_body'] = arguments.param;
    } else if (arguments.param.getType() == "URL") {
      if (!structKeyExists(variables._queryParams, arguments.param.getName()))
        variables._queryParams[arguments.param.getName()] = [];
      arrayAppend(variables._queryParams[arguments.param.getName()], arguments.param);
    } else if (arguments.param.getType() == "formfield") {
      if (!structKeyExists(variables._formFields, arguments.param.getName()))
        variables._formFields[arguments.param.getName()] = [];
      arrayAppend(variables._formFields[arguments.param.getName()], arguments.param);
    } else {
      if (!structKeyExists(variables._params, arguments.param.getName()))
        variables._params[arguments.param.getName()] = [];
      arrayAppend(variables._params[arguments.param.getName()], arguments.param);
    }
  }

  public array function getAllOtherParams() {
    var paramArray = [];
    for (var key in variables._params) {
      for (var rp in variables._params[key]) {
        arrayAppend(paramArray, rp);
      }
    }
    return paramArray;
  }

  public string function toJson( boolean noHeaders = false ) {
    var returnJson = '{"' & listLast(getComponentName(), ".") & '":{'
      & '"method":"#getMethod()#",'
      & '"URI":"#getURI().toURL().toString()#",'
      & '"executed":#variables._executed#';

    if (!structIsEmpty(variables._headers) && !noHeaders) {
      returnJson &= ',"headers":' & paramsToJson( variables._headers );
    }

    if (!structIsEmpty(variables._queryParams)) {
      returnJson &= ',"queryParams":' & paramsToJson( variables._queryParams );
    }

    if (!structIsEmpty(variables._formFields)) {
      returnJson &= ',"formfields":' & paramsToJson( variables._formFields );
    }

    if (!isNull(getBody())) {
      returnJson &= ',"body":';
      if (isJson(getBody().getValue())) {
        returnJson &= getBody().getValue();
      } else {
        returnJson &= serializeJSON(getBody().getValue());
      }
    }

    if (!structIsEmpty(variables._params)) {
      returnJson &= ',"params":' & paramsToJson( variables._params, true );
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
    return listLast(getComponentName(), ".") & ": " & variables._method & " " & variables._uri.toURL().toString();
  }
}
