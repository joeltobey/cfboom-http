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
 * I represent an http request parameter.
 *
 * @author Joel Tobey
 */
component
  extends="cfboom.lang.Object"
  displayname="Class RequestParam"
  accessors="true"
  output="false"
{
  property name="type" type="string" validate="regex" validateparams="{pattern=header|CGI|body|XML|file|URL|formfield|cookie}";
  property name="name" type="string";
  property name="value" type="string";
  property name="file" type="string";
  property name="encoded" type="string";
  property name="mimeType" type="string";

  public cfboom.http.RequestParam function init( string name, string value, string type = "URL" ) {
    if ( structKeyExists( arguments,"name" ) && structKeyExists( arguments,"value" ) ) {
      setName( arguments.name );
      setValue( arguments.value );
      if ( structKeyExists( arguments,"type" ) ) {
        setType( arguments.type );
      }
    }
    /**
     * "encoded" is optional and is used for CGI and formfield types.
     * The default is "yes" and it doesn't get used for other types
     * so we go ahead and set the default.
     */
    setEncoded( "true" );
    return this;
  }

  public string function toString() {
    if ( getType() == "formfield" ) {
      return "RequestParam[type=" & getType() & ", name=" & getName() & ", value=" &getValue() & ", encoded=" & getEncoded() & "]";
    } else {
      return "RequestParam[type=" & getType() & ", name=" & getName() & ", value=" &getValue() & "]";
    }
  }
}
