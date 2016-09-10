/*
 * Copyright 2002-2016 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
 * A request message from a client to a server includes, within the
 * first line of that message, the method to be applied to the resource,
 * the identifier of the resource, and the protocol version in use.
 *
 * @cfboom Joel Tobey
 */
interface
    extends="cfboom.http.HttpMessage"
    displayname="Interface HttpRequest"
{
    /**
     * Returns the HTTP method this request uses, such as {@code GET},
     * {@code PUT}, {@code POST}, or other.
     */
    public string function getMethod();

    /**
     * Returns the URI this request uses, such as
     * {@code http://example.org/path/to/file}.
     * <p>
     * Note that the URI may be absolute URI (as above) or may be a relative URI.
     * </p>
     * <p>
     * Implementations are encouraged to return
     * the URI that was initially requested.
     * </p>
     * <p>
     * To find the final URI after any redirects have been processed,
     * please see the section entitled
     * <a href="http://hc.apache.org/httpcomponents-client-ga/tutorial/html/fundamentals.html#d4e205">HTTP execution context</a>
     * in the
     * <a href="http://hc.apache.org/httpcomponents-client-ga/tutorial/html">HttpClient Tutorial</a>
     * </p>
     */
    public any function getURI();

    public string function getName();
}