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
 * Factory for {@link ClientHttpRequest} objects.
 * Requests are created by the {@link #createRequest(URI, HttpMethod)} method.
 *
 * @author Arjen Poutsma
 * @since 3.0
 */
interface
  displayname="Interface ClientHttpRequestFactory"
{
  /**
   * Create a new {@link ClientHttpRequest} for the specified URI and HTTP method.
   * <p>The returned request can be written to, and then executed by calling
   * {@link ClientHttpRequest#execute()}.
   * @param uri the URI to create a request for
   * @param httpMethod the HTTP method to execute
   * @return the created request
   * @throws IOException in case of I/O errors
   */
  public cfboom.http.client.ClientHttpRequest function createRequest( required any uri, cfboom.http.HttpMethod httpMethod );
}
