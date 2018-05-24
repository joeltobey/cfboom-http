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
 * Default implementation of {@link UriBuilderFactory} using
 * {@link UriComponentsBuilder} for building, encoding, and expanding URI
 * templates.
 *
 * <p>Exposes configuration properties that customize the creation of all URIs
 * built through this factory instance including a base URI, default URI
 * variables, and an encoding mode.
 *
 * @author Rossen Stoyanchev
 * @since 5.0
 */
component
  extends="cfboom.lang.Object"
  implements="cfboom.http.web.util.UriTemplateHandler"
  displayname="Class DefaultUriBuilderFactory"
  output="false"
{
  public cfboom.http.web.util.DefaultUriBuilderFactory function init() {
    return this;
  }

  public any function expand( required string uriTemplate, struct uriVariables = {} ) {
    local['divider'] = "?";
    if ( find("?", arguments.uriTemplate) )
      local['divider'] = "&";
    for ( var key in arguments.uriVariables ) {
      arguments.uriTemplate &= local.divider & key & "=" & arguments.uriVariables[key];
      local['divider'] = "&";
    }
    return arguments.uriTemplate;
  }
}
