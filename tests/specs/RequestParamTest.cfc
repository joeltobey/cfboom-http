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
    displayname="Class RequestParamTest"
    output="false"
{
    /**
     * @Test
     */
    public void function testDefaults() {
        var rp = new cfboom.http.RequestParam();
        this.$assert.null(rp.getType());
        this.$assert.null(rp.getName());
        this.$assert.null(rp.getValue());
        this.$assert.null(rp.getFile());
        assertEqualsCase("true", rp.getEncoded());
        this.$assert.null(rp.getMimeType());
    }

    /**
     * @Test
     */
    public void function testDefaultType() {
        var rp = new cfboom.http.RequestParam("foo", "bar");
        assertEqualsCase("URL", rp.getType());
        assertEqualsCase("foo", rp.getName());
        assertEqualsCase("bar", rp.getValue());
        this.$assert.null(rp.getFile());
        assertEqualsCase("true", rp.getEncoded());
        this.$assert.null(rp.getMimeType());
    }

    /**
     * @Test
     */
    public void function testHeaderType() {
        var rp = new cfboom.http.RequestParam("foo", "bar", "header");
        assertEqualsCase("header", rp.getType());
        assertEqualsCase("foo", rp.getName());
        assertEqualsCase("bar", rp.getValue());
        this.$assert.null(rp.getFile());
        assertEqualsCase("true", rp.getEncoded());
        this.$assert.null(rp.getMimeType());
    }

    /**
     * @Test
     */
    public void function testToString() {
        var rp1 = new cfboom.http.RequestParam("foo", "a");
        assertEqualsCase("RequestParam[type=URL, name=foo, value=a]", rp1.toString());
        var rp2 = new cfboom.http.RequestParam("bar", "b", "formfield");
        assertEqualsCase("RequestParam[type=formfield, name=bar, value=b, encoded=true]", rp2.toString());
        rp2.setEncoded("false");
        assertEqualsCase("RequestParam[type=formfield, name=bar, value=b, encoded=false]", rp2.toString());
    }
}