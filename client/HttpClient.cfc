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
 * This interface represents only the most basic contract for HTTP request
 * execution. It imposes no restrictions or particular details on the request
 * execution process and leaves the specifics of state management,
 * authentication and redirect handling up to individual implementations.
 *
 * @cfboom Joel Tobey
 */
interface
  displayname="Interface HttpClient"
{
  /**
   * Executes HTTP request using the default context.
   *
   * @param request   the request to execute
   *
   * @return  the response to the request. This is always a final response,
   *          never an intermediate response with an 1xx status code.
   *          Whether redirects or authentication challenges will be returned
   *          or handled automatically depends on the implementation and
   *          configuration of this client.
   */
  public cfboom.http.HttpResponse function execute( cfboom.http.HttpRequest req );

  public void function setExecutor( cfboom.http.protocol.HttpRequestExecutor executor );
}
