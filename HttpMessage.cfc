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
 * HTTP messages head consisting of multiple message headers.
 *
 * @cfboom Joel Tobey
 */
interface
  displayname="Interface HttpMessage"
{
  /**
   * Checks if a certain header is present in this message. Header values are
   * ignored.
   *
   * @param name the header name to check for.
   * @return true if at least one header with this name is present.
   */
  public boolean function containsHeader(string name);

  /**
   * Returns all the headers with a specified name of this message. Header values
   * are ignored. Headers are orderd in the sequence they will be sent over a
   * connection.
   *
   * @param name the name of the headers to return.
   * @return the headers whose name property equals {@code name}.
   */
  public array function getHeaders(string name);

  /**
   * Returns the first header with a specified name of this message. Header
   * values are ignored. If there is more than one matching header in the
   * message the first element of {@link #getHeaders(String)} is returned.
   * If there is no matching header in the message {@code null} is
   * returned.
   *
   * @param name the name of the header to return.
   * @return the first header whose name property equals {@code name}
   *   or {@code null} if no such header could be found.
   */
  public string function getFirstHeader(string name);

  /**
   * Returns the last header with a specified name of this message. Header values
   * are ignored. If there is more than one matching header in the message the
   * last element of {@link #getHeaders(String)} is returned. If there is no
   * matching header in the message {@code null} is returned.
   *
   * @param name the name of the header to return.
   * @return the last header whose name property equals {@code name}.
   *   or {@code null} if no such header could be found.
   */
  public string function getLastHeader(string name);

  /**
   * Returns all the headers of this message. Headers are orderd in the sequence
   * they will be sent over a connection.
   *
   * @return all the headers of this message
   */
  public array function getAllHeaders();

  /**
   * Adds a header to this message. The header will be appended to the end of
   * the list.
   *
   * @name.hint the name of the header.
   * @value.hint the value of the header.
   */
  public void function addHeader(string name, string value);

  /**
   * Overwrites the first header with the same name. The new header will be appended to
   * the end of the list, if no header with the given name can be found.
   *
   * @name.hint the name of the header.
   * @value.hint the value of the header.
   */
  public void function setHeader(string name, string value);

  /**
   * Overwrites all the headers in the message.
   *
   * @headers.hint the array of headers to set.
   */
  public void function setHeaders(array headers);

  /**
   * Removes all headers with a certain name from this message.
   *
   * @name.hint The name of the headers to remove.
   */
  public void function removeHeaders(string name);

  /**
   * Tells the length of the content, if known.
   *
   * @return  the number of bytes of the content, or
   *          a negative number if unknown. If the content length is known
   *          but exceeds {@link java.lang.Long#MAX_VALUE Long.MAX_VALUE},
   *          a negative number is returned.
   *
   * @actualReturnType Long
   */
  public numeric function getContentLength();

  /**
   * Obtains the Content-Type header, if known.
   * This is the header that should be used when sending the entity,
   * or the one that was received with the entity. It can include a
   * charset attribute.
   *
   * @return  the Content-Type header for this entity, or
   *          {@code null} if the content type is unknown
   */
  public string function getContentType();

  /**
   * Obtains the Content-Encoding header, if known.
   * This is the header that should be used when sending the entity,
   * or the one that was received with the entity.
   * Wrapping entities that modify the content encoding should
   * adjust this header accordingly.
   *
   * @return  the Content-Encoding header for this entity, or
   *          {@code null} if the content encoding is unknown
   */
  public string function getContentEncoding();
}
