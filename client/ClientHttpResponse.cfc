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
 * Represents a client-side HTTP response.
 * Obtained via an calling of the {@link ClientHttpRequest#execute()}.
 *
 * <p>A {@code ClientHttpResponse} must be {@linkplain #close() closed},
 * typically in a {@code finally} block.
 *
 * @author Arjen Poutsma
 * @since 3.0
 * @cfboom Joel Tobey
 */
interface
  extends="cfboom.http.HttpResponse"
  displayname="Interface ClientHttpResponse"
{
  /**
   * Return the HTTP status code of the response.
   * @return the HTTP status as an HttpStatus enum value
   * @throws IOException in case of I/O errors
   */
  public cfboom.http.HttpStatus function getStatusCode();

  /**
   * Return the HTTP status code of the response as integer
   * @return the HTTP status as an integer
   * @throws IOException in case of I/O errors
   */
  public numeric function getRawStatusCode();

  /**
   * Return the HTTP status text of the response.
   * @return the HTTP status text
   * @throws IOException in case of I/O errors
   */
  public string function getStatusText();

  /**
   * Close this response, freeing any resources created.
   */
  public void function close();

  /**
   * Return the body of the message as an input stream.
   * @return the input stream body (never {@code null})
   * @throws IOException in case of I/O Errors
   */
  public any function getBody();
}
