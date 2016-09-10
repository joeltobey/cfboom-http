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
 * Concrete implentation of HttpClient using BasicHttpRequestExecutor
 *
 * @cfboom Joel Tobey
 *
 * @singleton
 */
component
    extends="cfboom.http.client.AbstractHttpClient"
    displayname="Class BasicHttpClient"
    output="false"
{
    public cfboom.http.client.BasicHttpClient function init() {
        super.init();
        setExecutor( new cfboom.http.protocol.BasicHttpRequestExecutor() );
        return this;
    }

    public cfboom.http.HttpResponse function execute(cfboom.http.HttpRequest req) {
        return _instance.executor.execute( arguments.req );
    }
}