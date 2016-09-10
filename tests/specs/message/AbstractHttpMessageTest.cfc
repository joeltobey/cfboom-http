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
    displayname="Class AbstractHttpMessageTest"
    output="false"
{
    /**
     * @Test
     */
    public void function testDefaults() {
        var msg = new cfboom.http.message.AbstractHttpMessage();
        assertEquals(-1, msg.getContentLength());
        this.$assert.null(msg.getContentType());
        this.$assert.null(msg.getContentEncoding());
    }

    /**
     * @Test
     */
    public void function testContainsHeader() {
        var msg = new cfboom.http.message.AbstractHttpMessage();
        assertFalse(msg.containsHeader("foo"));
        msg.setHeader("foo", "bar");
        assertTrue(msg.containsHeader("foo"));
    }

    /**
     * @Test
     */
    public void function testGetHeaders() {
        var msg = new cfboom.http.message.AbstractHttpMessage();
        assertEquals(0, arrayLen(msg.getHeaders("foo")));
        msg.addHeader("foo", "bar");
        assertEquals(1, arrayLen(msg.getHeaders("foo")));
        msg.addHeader("foo", "baz");
        assertEquals(2, arrayLen(msg.getHeaders("foo")));
        msg.removeHeaders("foo");
        assertEquals(0, arrayLen(msg.getHeaders("foo")));
    }

    /**
     * @Test
     */
    public void function testHeaders() {
        var msg = new cfboom.http.message.AbstractHttpMessage();
        assertEquals(0, arrayLen(msg.getHeaders("foo")));
        msg.addHeader("foo", "1");
        assertEqualsCase("1", msg.getFirstHeader("foo"));
        msg.addHeader("foo", "2");
        assertEqualsCase("1", msg.getFirstHeader("foo"));
        assertEqualsCase("2", msg.getLastHeader("foo"));
        assertEquals(2, arrayLen(msg.getHeaders("foo")));
        msg.addHeader("bar", "a");
        assertEquals(1, arrayLen(msg.getHeaders("bar")));
        assertEquals(2, arrayLen(msg.getHeaders("foo")));
        assertEquals(3, arrayLen(msg.getAllHeaders()));

        msg.setHeader("foo", "1");
        assertEquals(1, arrayLen(msg.getHeaders("foo")));
        assertEquals(2, arrayLen(msg.getAllHeaders()));

        var rp1 = new cfboom.http.RequestParam("foo", "3", "header");
        var rp2 = new cfboom.http.RequestParam("foo", "4", "header");
        var rp3 = new cfboom.http.RequestParam("bar", "5", "header");
        var rp4 = new cfboom.http.RequestParam("baz", "6", "header");
        msg.setHeaders([rp1, rp2, rp3, rp4]);
        assertEquals(2, arrayLen(msg.getHeaders("foo")));
        assertEquals(1, arrayLen(msg.getHeaders("bar")));
        assertEquals(1, arrayLen(msg.getHeaders("baz")));
        assertEquals(4, arrayLen(msg.getAllHeaders()));
    }
}