/*
 * Copyright 2012-2016 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
 * @cfboom Joel Tobey
 */
component
    extends="coldbox.system.testing.BaseTestCase"
    appMapping="/root"
    displayname="Class BasicHttpResponseTest"
    output="false"
{
    /**
     * @Test
     */
    public void function testDefaults() {
        var res = new cfboom.http.message.BasicHttpResponse();
        assertEquals(999, res.getCode());
        assertEqualsCase("Unknown", res.getReasonPhrase());
        assertEqualsCase("999 Unknown", left(res.toString(), 11));
    }

    /**
     * @Test
     */
    public void function testSunny() {
        var res = new cfboom.http.message.BasicHttpResponse({status_code:200, status_text:"OK"});
        assertEquals(200, res.getCode());
        assertEquals(200, res.getPrefix().status_code);
        assertEqualsCase("OK", res.getReasonPhrase());
        assertEqualsCase("OK", res.getPrefix().status_text);
        assertEqualsCase("200 OK", left(res.toString(), 6));
    }
}