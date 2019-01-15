/*
 * Copyright 2002-2019 the original author or authors and and Joel Tobey <joeltobey@gmail.com>.
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
 * Enumeration of HTTP request methods.
 */
component
  extends="cfboom.lang.Object"
  displayname="Enum HttpMethod"
  output="false"
{
  import cfboom.http.HttpMethod;

  _instance['enums'] = {};

  public cfboom.http.HttpMethod function enum() {

    _instance.enums['GET'] = new HttpMethod("GET");
    this['GET'] = _instance.enums.GET;

    _instance.enums['HEAD'] = new HttpMethod("HEAD");
    this['HEAD'] = _instance.enums.HEAD;

    _instance.enums['POST'] = new HttpMethod("POST");
    this['POST'] = _instance.enums.POST;

    _instance.enums['PUT'] = new HttpMethod("PUT");
    this['PUT'] = _instance.enums.PUT;

    _instance.enums['PATCH'] = new HttpMethod("PATCH");
    this['PATCH'] = _instance.enums.PATCH;

    _instance.enums['DELETE'] = new HttpMethod("DELETE");
    this['DELETE'] = _instance.enums.DELETE;

    _instance.enums['OPTIONS'] = new HttpMethod("OPTIONS");
    this['OPTIONS'] = _instance.enums.OPTIONS;

    _instance.enums['TRACE'] = new HttpMethod("TRACE");
    this['TRACE'] = _instance.enums.TRACE;

    return this;
  }

  /**
   * Internally used during HttpMethod.enum().
   */
  public cfboom.http.HttpMethod function init( required string name ) {
    _instance['name'] = arguments.name;
    return this;
  }

  public string function name() {
    return _instance.name;
  }

  /**
   * Return the enum values.
   */
  public struct function enums() {
    return _instance.enums;
  }

  /**
   * Resolve the given method value to an {@code HttpMethod}.
   * @param method the method value as a String
   * @return the corresponding {@code HttpMethod}, or {@code null} if not found
   * @since 4.2.4
   */
  public any function resolve( required string method ) {
    if ( structKeyExists( _instance.enums, arguments.method ) )
      return _instance.enums[ arguments.method ];
  }

  /**
   * Determine whether this {@code HttpMethod} matches the given
   * method value.
   * @param method the method value as a String
   * @return {@code true} if it matches, {@code false} otherwise
   * @since 4.2.4
   */
  public boolean function matches( required string method ) {
    if ( !structKeyExists( _instance, "name" ) ) {
      return false;
    } else {
      return _instance.name == arguments.method;
    }
  }

  public string function toString() {
    return "HttpMethod: " & _instance.name;
  }
}
