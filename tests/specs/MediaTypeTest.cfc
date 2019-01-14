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
 * @cfboom Joel Tobey
 */
component
  extends="coldbox.system.testing.BaseTestCase"
  appMapping="/root"
  displayname="Class MediaTypeTest"
  output="false"
{
  import cfboom.http.MediaType;

  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    variables['MediaType'] = getInstance("MediaType@cfboomHttp");
  }

  function setup(){}

  function teardown(){}

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete(variables, "MediaType");
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testToString() {
    local['mediaType'] = new MediaType("text", "plain", 0.7);
    local['result'] = local.mediaType.toString();
    assertEqualsCase("text/plain;q=0.7", local.result);
  }

  /**
   * @Test
   * (expected = IllegalArgumentException.class)
   */
  public void function slashInType() {
    try {
      new MediaType("text/plain");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = IllegalArgumentException.class)
   */
  public void function slashInSubtype() {
    try {
      new MediaType("text", "/");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   */
  public void function getDefaultQualityValue() {
    local['mediaType'] = new MediaType("text", "plain");
    assertEquals( 1, mediaType.getQualityValue(), "Invalid quality value");
  }

  /**
   * @Test
   */
  public void function parseMediaType() {
    local['s'] = "audio/*; q=0.2";
    local['mediaType'] = MediaType.parseMediaType(local.s);
    assertEquals("audio", local.mediaType.getType(), "Invalid type");
    assertEquals( "*", local.mediaType.getSubtype(), "Invalid subtype");
    assertEquals( javaCast("double",0.2), local.mediaType.getQualityValue(), "Invalid quality factor");
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeNoSubtype() {
    try {
      MediaType.parseMediaType("audio");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeNoSubtypeSlash() {
    try {
      MediaType.parseMediaType("audio/");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeTypeRange() {
    try {
      MediaType.parseMediaType("* /json");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeIllegalType() {
    try {
      MediaType.parseMediaType("audio(/basic");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeIllegalSubtype() {
    try {
      MediaType.parseMediaType("audio/basic)");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeEmptyParameterAttribute() {
    try {
      MediaType.parseMediaType("audio/*;=value");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeEmptyParameterValue() {
    try {
      MediaType.parseMediaType("audio/*;attr=");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeIllegalParameterAttribute() {
    try {
      MediaType.parseMediaType("audio/*;attr<=value");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeIllegalParameterValue() {
    try {
      MediaType.parseMediaType("audio/*;attr=v>alue");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeIllegalQualityFactor() {
    try {
      MediaType.parseMediaType("audio/basic;q=1.1");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   * (expected = InvalidMediaTypeException.class)
   */
  public void function parseMediaTypeIllegalCharset() {
    try {
      MediaType.parseMediaType("text/html; charset=foo-bar");
      fail("Should have thrown an exception");
    } catch ( java.lang.IllegalArgumentException ex ) {
      // Expected exception
    }
  }

  /**
   * @Test
   */
  public void function parseURLConnectionMediaType() {
    local['s'] = "*; q=.2";
    local['mediaType'] = MediaType.parseMediaType(local.s);
    assertEquals( "*", local.mediaType.getType(), "Invalid type" );
    assertEquals( "*", local.mediaType.getSubtype(), "Invalid subtype" );
    assertEquals( javaCast("double",0.2), local.mediaType.getQualityValue(), "Invalid quality factor");
  }

  /**
   * @Test
   */
  public void function parseMediaTypes() {
    local['s'] = "text/plain; q=0.5, text/html, text/x-dvi; q=0.8, text/x-c";
    local['mediaTypes'] = MediaType.parseMediaTypes(local.s);
    assertTrue( structKeyExists(local,"mediaTypes"), "No media types returned" );
    assertEquals( 4, arrayLen(local.mediaTypes), "Invalid amount of media types");

    local['mediaTypes'] = MediaType.parseMediaTypes("");
    assertTrue( structKeyExists(local,"mediaTypes"), "No media types returned" );
    assertEquals( 0, arrayLen(local.mediaTypes), "Invalid amount of media types");
  }

/*
@Test
public void function compareTo() {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audio = new MediaType("audio");
MediaType audioWave = new MediaType("audio", "wave");
MediaType audioBasicLevel = new MediaType("audio", "basic", Collections.singletonMap("level", "1"));
MediaType audioBasic07 = new MediaType("audio", "basic", 0.7);

// equal
assertEquals("Invalid comparison result", 0, audioBasic.compareTo(audioBasic));
assertEquals("Invalid comparison result", 0, audio.compareTo(audio));
assertEquals("Invalid comparison result", 0, audioBasicLevel.compareTo(audioBasicLevel));

assertTrue("Invalid comparison result", audioBasicLevel.compareTo(audio) > 0);

List<MediaType> expected = new ArrayList<>();
expected.add(audio);
expected.add(audioBasic);
expected.add(audioBasicLevel);
expected.add(audioBasic07);
expected.add(audioWave);

List<MediaType> result = new ArrayList<>(expected);
Random rnd = new Random();
// shuffle & sort 10 times
for (int i = 0; i < 10; i++) {
Collections.shuffle(result, rnd);
Collections.sort(result);

for (int j = 0; j < result.size(); j++) {
assertSame("Invalid media type at " + j + ", run " + i, expected.get(j), result.get(j));
}
}
}
*/
/*
@Test
public void function compareToConsistentWithEquals() {
MediaType m1 = MediaType.parseMediaType("text/html; q=0.7; charset=iso-8859-1");
MediaType m2 = MediaType.parseMediaType("text/html; charset=iso-8859-1; q=0.7");

assertEquals("Media types not equal", m1, m2);
assertEquals("compareTo() not consistent with equals", 0, m1.compareTo(m2));
assertEquals("compareTo() not consistent with equals", 0, m2.compareTo(m1));

m1 = MediaType.parseMediaType("text/html; q=0.7; charset=iso-8859-1");
m2 = MediaType.parseMediaType("text/html; Q=0.7; charset=iso-8859-1");
assertEquals("Media types not equal", m1, m2);
assertEquals("compareTo() not consistent with equals", 0, m1.compareTo(m2));
assertEquals("compareTo() not consistent with equals", 0, m2.compareTo(m1));
}
*/
/*
@Test
public void function compareToCaseSensitivity() {
MediaType m1 = new MediaType("audio", "basic");
MediaType m2 = new MediaType("Audio", "Basic");
assertEquals("Invalid comparison result", 0, m1.compareTo(m2));
assertEquals("Invalid comparison result", 0, m2.compareTo(m1));

m1 = new MediaType("audio", "basic", Collections.singletonMap("foo", "bar"));
m2 = new MediaType("audio", "basic", Collections.singletonMap("Foo", "bar"));
assertEquals("Invalid comparison result", 0, m1.compareTo(m2));
assertEquals("Invalid comparison result", 0, m2.compareTo(m1));

m1 = new MediaType("audio", "basic", Collections.singletonMap("foo", "bar"));
m2 = new MediaType("audio", "basic", Collections.singletonMap("foo", "Bar"));
assertTrue("Invalid comparison result", m1.compareTo(m2) != 0);
assertTrue("Invalid comparison result", m2.compareTo(m1) != 0);


}
*/
/*
@Test
public void function specificityComparator() throws Exception {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audioWave = new MediaType("audio", "wave");
MediaType audio = new MediaType("audio");
MediaType audio03 = new MediaType("audio", "*", 0.3);
MediaType audio07 = new MediaType("audio", "*", 0.7);
MediaType audioBasicLevel = new MediaType("audio", "basic", Collections.singletonMap("level", "1"));
MediaType textHtml = new MediaType("text", "html");
MediaType allXml = new MediaType("application", "*+xml");
MediaType all = MediaType.ALL;

Comparator<MediaType> comp = MediaType.SPECIFICITY_COMPARATOR;

// equal
assertEquals("Invalid comparison result", 0, comp.compare(audioBasic,audioBasic));
assertEquals("Invalid comparison result", 0, comp.compare(audio, audio));
assertEquals("Invalid comparison result", 0, comp.compare(audio07, audio07));
assertEquals("Invalid comparison result", 0, comp.compare(audio03, audio03));
assertEquals("Invalid comparison result", 0, comp.compare(audioBasicLevel, audioBasicLevel));

// specific to unspecific
assertTrue("Invalid comparison result", comp.compare(audioBasic, audio) < 0);
assertTrue("Invalid comparison result", comp.compare(audioBasic, all) < 0);
assertTrue("Invalid comparison result", comp.compare(audio, all) < 0);
assertTrue("Invalid comparison result", comp.compare(MediaType.APPLICATION_XHTML_XML, allXml) < 0);

// unspecific to specific
assertTrue("Invalid comparison result", comp.compare(audio, audioBasic) > 0);
assertTrue("Invalid comparison result", comp.compare(allXml, MediaType.APPLICATION_XHTML_XML) > 0);
assertTrue("Invalid comparison result", comp.compare(all, audioBasic) > 0);
assertTrue("Invalid comparison result", comp.compare(all, audio) > 0);

// qualifiers
assertTrue("Invalid comparison result", comp.compare(audio, audio07) < 0);
assertTrue("Invalid comparison result", comp.compare(audio07, audio) > 0);
assertTrue("Invalid comparison result", comp.compare(audio07, audio03) < 0);
assertTrue("Invalid comparison result", comp.compare(audio03, audio07) > 0);
assertTrue("Invalid comparison result", comp.compare(audio03, all) < 0);
assertTrue("Invalid comparison result", comp.compare(all, audio03) > 0);

// other parameters
assertTrue("Invalid comparison result", comp.compare(audioBasic, audioBasicLevel) > 0);
assertTrue("Invalid comparison result", comp.compare(audioBasicLevel, audioBasic) < 0);

// different types
assertEquals("Invalid comparison result", 0, comp.compare(audioBasic, textHtml));
assertEquals("Invalid comparison result", 0, comp.compare(textHtml, audioBasic));

// different subtypes
assertEquals("Invalid comparison result", 0, comp.compare(audioBasic, audioWave));
assertEquals("Invalid comparison result", 0, comp.compare(audioWave, audioBasic));
}
*/
/*
@Test
public void function sortBySpecificityRelated() {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audio = new MediaType("audio");
MediaType audio03 = new MediaType("audio", "*", 0.3);
MediaType audio07 = new MediaType("audio", "*", 0.7);
MediaType audioBasicLevel = new MediaType("audio", "basic", Collections.singletonMap("level", "1"));
MediaType all = MediaType.ALL;

List<MediaType> expected = new ArrayList<>();
expected.add(audioBasicLevel);
expected.add(audioBasic);
expected.add(audio);
expected.add(audio07);
expected.add(audio03);
expected.add(all);

List<MediaType> result = new ArrayList<>(expected);
Random rnd = new Random();
// shuffle & sort 10 times
for (int i = 0; i < 10; i++) {
Collections.shuffle(result, rnd);
MediaType.sortBySpecificity(result);

for (int j = 0; j < result.size(); j++) {
assertSame("Invalid media type at " + j, expected.get(j), result.get(j));
}
}
}
*/
/*
@Test
public void function sortBySpecificityUnrelated() {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audioWave = new MediaType("audio", "wave");
MediaType textHtml = new MediaType("text", "html");

List<MediaType> expected = new ArrayList<>();
expected.add(textHtml);
expected.add(audioBasic);
expected.add(audioWave);

List<MediaType> result = new ArrayList<>(expected);
MediaType.sortBySpecificity(result);

for (int i = 0; i < result.size(); i++) {
assertSame("Invalid media type at " + i, expected.get(i), result.get(i));
}

}
*/
/*
@Test
public void function qualityComparator() throws Exception {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audioWave = new MediaType("audio", "wave");
MediaType audio = new MediaType("audio");
MediaType audio03 = new MediaType("audio", "*", 0.3);
MediaType audio07 = new MediaType("audio", "*", 0.7);
MediaType audioBasicLevel = new MediaType("audio", "basic", Collections.singletonMap("level", "1"));
MediaType textHtml = new MediaType("text", "html");
MediaType allXml = new MediaType("application", "*+xml");
MediaType all = MediaType.ALL;

Comparator<MediaType> comp = MediaType.QUALITY_VALUE_COMPARATOR;

// equal
assertEquals("Invalid comparison result", 0, comp.compare(audioBasic,audioBasic));
assertEquals("Invalid comparison result", 0, comp.compare(audio, audio));
assertEquals("Invalid comparison result", 0, comp.compare(audio07, audio07));
assertEquals("Invalid comparison result", 0, comp.compare(audio03, audio03));
assertEquals("Invalid comparison result", 0, comp.compare(audioBasicLevel, audioBasicLevel));

// specific to unspecific
assertTrue("Invalid comparison result", comp.compare(audioBasic, audio) < 0);
assertTrue("Invalid comparison result", comp.compare(audioBasic, all) < 0);
assertTrue("Invalid comparison result", comp.compare(audio, all) < 0);
assertTrue("Invalid comparison result", comp.compare(MediaType.APPLICATION_XHTML_XML, allXml) < 0);

// unspecific to specific
assertTrue("Invalid comparison result", comp.compare(audio, audioBasic) > 0);
assertTrue("Invalid comparison result", comp.compare(all, audioBasic) > 0);
assertTrue("Invalid comparison result", comp.compare(all, audio) > 0);
assertTrue("Invalid comparison result", comp.compare(allXml, MediaType.APPLICATION_XHTML_XML) > 0);

// qualifiers
assertTrue("Invalid comparison result", comp.compare(audio, audio07) < 0);
assertTrue("Invalid comparison result", comp.compare(audio07, audio) > 0);
assertTrue("Invalid comparison result", comp.compare(audio07, audio03) < 0);
assertTrue("Invalid comparison result", comp.compare(audio03, audio07) > 0);
assertTrue("Invalid comparison result", comp.compare(audio03, all) > 0);
assertTrue("Invalid comparison result", comp.compare(all, audio03) < 0);

// other parameters
assertTrue("Invalid comparison result", comp.compare(audioBasic, audioBasicLevel) > 0);
assertTrue("Invalid comparison result", comp.compare(audioBasicLevel, audioBasic) < 0);

// different types
assertEquals("Invalid comparison result", 0, comp.compare(audioBasic, textHtml));
assertEquals("Invalid comparison result", 0, comp.compare(textHtml, audioBasic));

// different subtypes
assertEquals("Invalid comparison result", 0, comp.compare(audioBasic, audioWave));
assertEquals("Invalid comparison result", 0, comp.compare(audioWave, audioBasic));
}
*/
/*
@Test
public void function sortByQualityRelated() {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audio = new MediaType("audio");
MediaType audio03 = new MediaType("audio", "*", 0.3);
MediaType audio07 = new MediaType("audio", "*", 0.7);
MediaType audioBasicLevel = new MediaType("audio", "basic", Collections.singletonMap("level", "1"));
MediaType all = MediaType.ALL;

List<MediaType> expected = new ArrayList<>();
expected.add(audioBasicLevel);
expected.add(audioBasic);
expected.add(audio);
expected.add(all);
expected.add(audio07);
expected.add(audio03);

List<MediaType> result = new ArrayList<>(expected);
Random rnd = new Random();
// shuffle & sort 10 times
for (int i = 0; i < 10; i++) {
Collections.shuffle(result, rnd);
MediaType.sortByQualityValue(result);

for (int j = 0; j < result.size(); j++) {
assertSame("Invalid media type at " + j, expected.get(j), result.get(j));
}
}
}
*/
/*
@Test
public void function sortByQualityUnrelated() {
MediaType audioBasic = new MediaType("audio", "basic");
MediaType audioWave = new MediaType("audio", "wave");
MediaType textHtml = new MediaType("text", "html");

List<MediaType> expected = new ArrayList<>();
expected.add(textHtml);
expected.add(audioBasic);
expected.add(audioWave);

List<MediaType> result = new ArrayList<>(expected);
MediaType.sortBySpecificity(result);

for (int i = 0; i < result.size(); i++) {
assertSame("Invalid media type at " + i, expected.get(i), result.get(i));
}
}
*/
/*
@Test
public void function testWithConversionService() {
ConversionService conversionService = new DefaultConversionService();
assertTrue(conversionService.canConvert(String.class, MediaType.class));
MediaType mediaType = MediaType.parseMediaType("application/xml");
assertEquals(mediaType, conversionService.convert("application/xml", MediaType.class));
}
*/
/*
@Test
public void function isConcrete() {
assertTrue("text/plain not concrete", MediaType.TEXT_PLAIN.isConcrete());
assertFalse("* /* concrete", MediaType.ALL.isConcrete());
assertFalse("text/ * concrete", new MediaType("text", "*").isConcrete());
}
*/
}
