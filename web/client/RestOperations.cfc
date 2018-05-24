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
 * Interface specifying a basic set of RESTful operations.
 * Implemented by {@link RestTemplate}. Not often used directly, but a useful
 * option to enhance testability, as it can easily be mocked or stubbed.
 *
 * @author Arjen Poutsma
 * @author Juergen Hoeller
 * @since 3.0
 * @see RestTemplate
 * @cfboom Joel Tobey
 */
interface
  displayname="Interface RestOperations"
{
// GET

  /**
   * Retrieve a representation by doing a GET on the URI template.
   * The response (if any) is converted and returned.
   * <p>URI Template variables are expanded using the given map.
   * @uri.hint the URL
   * @responseType.hint the type of the return value
   * @uriVariables.hint the map containing variables for the URI template
   * @return the converted object
   */
  public any function getForObject( required string uri, struct uriVariables = {}, string responseType );

  /**
   * Retrieve a representation by doing a GET on the URI template.
   * The response (if any) is converted and returned.
   * <p>URI Template variables are expanded using the given map.
   * @uri.hint the URL
   * @responseType.hint the type of the return value
   * @uriVariables.hint the map containing variables for the URI template
   * @return the converted object
   */
  public any function getForEntity( required string uri, struct uriVariables = {}, string responseType );


// HEAD

  /**
   * Retrieve all headers of the resource specified by the URI template.
   * <p>URI Template variables are expanded using the given map.
   * @uri.hint the URL
   * @uriVariables.hint the map containing variables for the URI template
   * @return all HTTP headers of that resource
   */
  public cfboom.http.HttpHeaders function headForHeaders( required string uri, struct uriVariables = {} );


// POST

  /**
   * Create a new resource by POSTing the given object to the URI template, and returns the value of
   * the {@code Location} header. This header typically indicates where the new resource is stored.
   * <p>URI Template variables are expanded using the given map.
   * <p>The {@code request} parameter can be a {@link HttpEntity} in order to
   * add additional HTTP headers to the request.
   * @uri.hint the URL
   * @req.hint the Object to be POSTed (may be {@code null})
   * @uriVariables.hint the variables to expand the template
   * @return the value for the {@code Location} header
   * @see HttpEntity
   */
  public any function postForLocation( required string uri, any req, struct uriVariables = {} );

  /**
   * Create a new resource by POSTing the given object to the URI template,
   * and returns the representation found in the response.
   * <p>URI Template variables are expanded using the given map.
   * <p>The {@code request} parameter can be a {@link HttpEntity} in order to
   * add additional HTTP headers to the request.
   * @uri.hint the URL
   * @req.hint the Object to be POSTed (may be {@code null})
   * @responseType.hint the type of the return value
   * @uriVariables.hint the variables to expand the template
   * @return the converted object
   * @see HttpEntity
   */
  public any function postForObject( required string uri, any req, struct uriVariables = {}, string responseType );

  /**
   * Create a new resource by POSTing the given object to the URI template,
   * and returns the response as {@link HttpEntity}.
   * <p>URI Template variables are expanded using the given map.
   * <p>The {@code request} parameter can be a {@link HttpEntity} in order to
   * add additional HTTP headers to the request.
   * @uri.hint the URL
   * @req.hint the Object to be POSTed (may be {@code null})
   * @uriVariables.hint the variables to expand the template
   * @return the converted object
   * @since 3.0.2
   * @see HttpEntity
   */
  public any function postForEntity( required string uri, any req, struct uriVariables = {}, string responseType );

// PUT

  /**
   * Creates a new resource by PUTting the given object to URI template.
   * <p>URI Template variables are expanded using the given map.
   * <p>The {@code request} parameter can be a {@link HttpEntity} in order to
   * add additional HTTP headers to the request.
   * @uri.hint the URL
   * @req.hint the Object to be PUT (may be {@code null})
   * @uriVariables.hint the variables to expand the template
   * @see HttpEntity
   */
  public void function put( required string uri, any req, struct uriVariables = {} );

// PATCH

  /**
   * Update a resource by PATCHing the given object to the URI template,
   * and return the representation found in the response.
   * <p>URI Template variables are expanded using the given map.
   * <p>The {@code request} parameter can be a {@link HttpEntity} in order to
   * add additional HTTP headers to the request.
   * <p><b>NOTE: The standard JDK HTTP library does not support HTTP PATCH.
   * You need to use the Apache HttpComponents or OkHttp request factory.</b>
   * @uri.hint the URL
   * @req.hint the object to be PATCHed (may be {@code null})
   * @responseType.hint the type of the return value
   * @uriVariables.hint the variables to expand the template
   * @return the converted object
   * @since 4.3.5
   * @see HttpEntity
   * @see RestTemplate#setRequestFactory
   * @see org.springframework.http.client.HttpComponentsAsyncClientHttpRequestFactory
   * @see org.springframework.http.client.OkHttp3ClientHttpRequestFactory
   */
  public any function patchForObject( required string uri, any req, struct uriVariables = {}, string responseType );

// DELETE

  /**
   * Delete the resources at the specified URI.
   * <p>URI Template variables are expanded using the given map.
   *
   * @uri.hint the URL
   * @uriVariables.hint the variables to expand the template
   */
  public void function delete( required string uri, struct uriVariables = {} );

// OPTIONS

  /**
   * Return the value of the Allow header for the given URI.
   * <p>URI Template variables are expanded using the given map.
   * @param url the URL
   * @param uriVariables the variables to expand in the template
   * @return the value of the allow header
   */
  public any function optionsForAllow( required string uri, struct uriVariables = {} );

// exchange

  /**
   * Execute the HTTP method to the given URI template, writing the given request entity to the request, and
   * returns the response as {@link ResponseEntity}.
   * <p>URI Template variables are expanded using the given URI variables, if any.
   * @param url the URL
   * @param method the HTTP method (GET, POST, etc)
   * @param requestEntity the entity (headers and/or body) to write to the request
   * (may be {@code null})
   * @param responseType the type of the return value
   * @param uriVariables the variables to expand in the template
   * @return the response as entity
   * @since 3.0.2
   */
  public any function exchange( string uri, cfboom.http.HttpMethod method, any requestEntity, string responseType, struct uriVariables = {} );

// general execution

  /**
   * Execute the HTTP method to the given URI template, preparing the request with the
   * {@link RequestCallback}, and reading the response with a {@link ResponseExtractor}.
   * <p>URI Template variables are expanded using the given URI variables map.
   * @uri.hint the URL
   * @method.hint the HTTP method (GET, POST, etc)
   * @requestCallback.hint object that prepares the request
   * @responseExtractor.hint object that extracts the return value from the response
   * @uriVariables.hint the variables to expand in the template
   * @return an arbitrary object, as returned by the {@link ResponseExtractor}
   */
  public any function execute( required string uri, cfboom.http.HttpMethod method, any requestCallback, any responseExtractor, struct uriVariables = {} );

}
