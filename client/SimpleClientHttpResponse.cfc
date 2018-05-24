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
 * {@link ClientHttpResponse} implementation that uses standard JDK facilities.
 * Obtained via {@link SimpleBufferingClientHttpRequest#execute()} and
 * {@link SimpleStreamingClientHttpRequest#execute()}.
 *
 * @author Arjen Poutsma
 * @author Brian Clozel
 * @since 3.0
 */
component
  extends="cfboom.http.client.AbstractClientHttpResponse"
  displayname="Class SimpleClientHttpResponse"
  output="false"
{
  public cfboom.http.client.SimpleClientHttpResponse function init( any result ) {
    if (isInstanceOf(arguments.result, "java.net.HttpURLConnection")) {
      _instance['connection'] = arguments.result;
    } else {
      super.init( arguments.result );
    }
    return this;
  }
}
