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
 * Response extractor that returns the response.
 */
component singleton
  extends="cfboom.lang.Object"
  implements="cfboom.http.web.client.ResponseExtractor"
  displayname="Class SimpleExtractor"
  output="false"
{
  public cfboom.http.web.client.SimpleExtractor function init() {
    return this;
  }

  public any function extractData( required cfboom.http.client.ClientHttpResponse response ) {
    return arguments.response;
  }
}
