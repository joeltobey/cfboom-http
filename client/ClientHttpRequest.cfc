﻿/*
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
 * Represents a client-side HTTP request.
 * Created via an implementation of the {@link ClientHttpRequestFactory}.
 *
 * <p>A {@code ClientHttpRequest} can be {@linkplain #execute() executed},
 * receiving a {@link ClientHttpResponse} which can be read from.
 *
 * @author Arjen Poutsma
 * @since 3.0
 * @see ClientHttpRequestFactory#createRequest(java.net.URI, HttpMethod)
 * @cfboom Joel Tobey
 */
interface
  displayname="Interface ClientHttpRequest"
{
  /**
   * Execute this request, resulting in a {@link ClientHttpResponse} that can be read.
   * @return the response result of the execution
   * @throws IOException in case of I/O errors
   */
  public cfboom.http.client.ClientHttpResponse function execute();
}