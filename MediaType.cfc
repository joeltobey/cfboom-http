/*
 * Copyright 2002-2018 the original author or authors and and Joel Tobey <joeltobey@gmail.com>.
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
 * A sub-class of {@link MimeType} that adds support for quality parameters as defined
 * in the HTTP specification.
 *
 * @author Arjen Poutsma
 * @author Juergen Hoeller
 * @author Rossen Stoyanchev
 * @author Sebastien Deleuze
 * @author Kazuki Shimizu
 * @since 3.0
 * @see <a href="http://tools.ietf.org/html/rfc7231#section-3.1.1.1">HTTP 1.1: Semantics and Content, section 3.1.1.1</a>
 */
component
  extends="cfboom.lang.Object"
  displayname="Enum MediaType"
  output="false"
{
  import cfboom.http.MediaType;

  _instance['enums'] = {};

  public cfboom.http.MediaType function enum() {

    /**
     * Public constant media type that includes all media ranges (i.e. "&#42;/&#42;").
     */
    variables.ALL_VALUE = "*/*";
    this.ALL_VALUE = variables.ALL_VALUE;
    _instance.enums['ALL'] = valueOf(ALL_VALUE);
    this['ALL'] = _instance.enums.ALL;

    /**
     *  Public constant media type for {@code application/atom+xml}.
     */
    variables.APPLICATION_ATOM_XML_VALUE = "application/atom+xml";
    this.APPLICATION_ATOM_XML_VALUE = variables.APPLICATION_ATOM_XML_VALUE;
    _instance.enums['APPLICATION_ATOM_XML'] = valueOf(APPLICATION_ATOM_XML_VALUE);
    this['APPLICATION_ATOM_XML'] = _instance.enums.APPLICATION_ATOM_XML;

    /**
     * Public constant media type for {@code application/x-www-form-urlencoded}.
     */
    variables.APPLICATION_FORM_URLENCODED_VALUE = "application/x-www-form-urlencoded";
    this.APPLICATION_FORM_URLENCODED_VALUE = variables.APPLICATION_FORM_URLENCODED_VALUE;
    _instance.enums['APPLICATION_FORM_URLENCODED'] = valueOf(APPLICATION_FORM_URLENCODED_VALUE);
    this['APPLICATION_FORM_URLENCODED'] = _instance.enums.APPLICATION_FORM_URLENCODED;

    /**
     * Public constant media type for {@code application/json}.
     * @see #APPLICATION_JSON_UTF8
     */
    variables.APPLICATION_JSON_VALUE = "application/json";
    this.APPLICATION_JSON_VALUE = variables.APPLICATION_JSON_VALUE;
    _instance.enums['APPLICATION_JSON'] = valueOf(APPLICATION_JSON_VALUE);
    this['APPLICATION_JSON'] = _instance.enums.APPLICATION_JSON;

    /**
     * Public constant media type for {@code application/json;charset=UTF-8}.
     */
    variables.APPLICATION_JSON_UTF8_VALUE = APPLICATION_JSON_VALUE & ";charset=UTF-8";
    this.APPLICATION_JSON_UTF8_VALUE = variables.APPLICATION_JSON_UTF8_VALUE;
    _instance.enums['APPLICATION_JSON_UTF8'] = valueOf(APPLICATION_JSON_UTF8_VALUE);
    this['APPLICATION_JSON_UTF8'] = _instance.enums.APPLICATION_JSON_UTF8;

    /**
     * Public constant media type for {@code application/octet-stream}.
     */
    variables.APPLICATION_OCTET_STREAM_VALUE = "application/octet-stream";
    this.APPLICATION_OCTET_STREAM_VALUE = variables.APPLICATION_OCTET_STREAM_VALUE;
    _instance.enums['APPLICATION_OCTET_STREAM'] = valueOf(APPLICATION_OCTET_STREAM_VALUE);
    this['APPLICATION_OCTET_STREAM'] = _instance.enums.APPLICATION_OCTET_STREAM;

    /**
     * Public constant media type for {@code application/pdf}.
     * @since 4.3
     */
    variables.APPLICATION_PDF_VALUE = "application/octet-stream";
    this.APPLICATION_PDF_VALUE = variables.APPLICATION_PDF_VALUE;
    _instance.enums['APPLICATION_PDF'] = valueOf(APPLICATION_PDF_VALUE);
    this['APPLICATION_PDF'] = _instance.enums.APPLICATION_PDF;

    /**
     * Public constant media type for {@code application/rss+xml}.
     * @since 4.3.6
     */
    variables.APPLICATION_RSS_XML_VALUE = "application/octet-stream";
    this.APPLICATION_RSS_XML_VALUE = variables.APPLICATION_RSS_XML_VALUE;
    _instance.enums['APPLICATION_RSS_XML'] = valueOf(APPLICATION_RSS_XML_VALUE);
    this['APPLICATION_RSS_XML'] = _instance.enums.APPLICATION_RSS_XML;

    /**
     * Public constant media type for {@code application/stream+json}.
     * @since 5.0
     */
    variables.APPLICATION_STREAM_JSON_VALUE = "application/stream+json";
    this.APPLICATION_STREAM_JSON_VALUE = variables.APPLICATION_STREAM_JSON_VALUE;
    _instance.enums['APPLICATION_STREAM_JSON'] = valueOf(APPLICATION_STREAM_JSON_VALUE);
    this['APPLICATION_STREAM_JSON'] = _instance.enums.APPLICATION_STREAM_JSON;

    /**
     * Public constant media type for {@code application/xhtml+xml}.
     */
    variables.APPLICATION_XHTML_XML_VALUE = "application/xhtml+xml";
    this.APPLICATION_XHTML_XML_VALUE = variables.APPLICATION_XHTML_XML_VALUE;
    _instance.enums['APPLICATION_XHTML_XML'] = valueOf(APPLICATION_XHTML_XML_VALUE);
    this['APPLICATION_XHTML_XML'] = _instance.enums.APPLICATION_XHTML_XML;

    /**
     * Public constant media type for {@code application/xml}.
     */
    variables.APPLICATION_XML_VALUE = "application/xml";
    this.APPLICATION_XML_VALUE = variables.APPLICATION_XML_VALUE;
    _instance.enums['APPLICATION_XML'] = valueOf(APPLICATION_XML_VALUE);
    this['APPLICATION_XML'] = _instance.enums.APPLICATION_XML;

    /**
     * Public constant media type for {@code image/gif}.
     */
    variables.IMAGE_GIF_VALUE = "image/gif";
    this.IMAGE_GIF_VALUE = variables.IMAGE_GIF_VALUE;
    _instance.enums['IMAGE_GIF'] = valueOf(IMAGE_GIF_VALUE);
    this['IMAGE_GIF'] = _instance.enums.IMAGE_GIF;

    /**
     * Public constant media type for {@code image/jpeg}.
     */
    variables.IMAGE_JPEG_VALUE = "image/jpeg";
    this.IMAGE_JPEG_VALUE = variables.IMAGE_JPEG_VALUE;
    _instance.enums['IMAGE_JPEG'] = valueOf(IMAGE_JPEG_VALUE);
    this['IMAGE_JPEG'] = _instance.enums.IMAGE_JPEG;

    /**
     * Public constant media type for {@code image/png}.
     */
    variables.IMAGE_PNG_VALUE = "image/jpeg";
    this.IMAGE_PNG_VALUE = variables.IMAGE_PNG_VALUE;
    _instance.enums['IMAGE_PNG'] = valueOf(IMAGE_PNG_VALUE);
    this['IMAGE_PNG'] = _instance.enums.IMAGE_PNG;

    /**
     * Public constant media type for {@code multipart/form-data}.
     */
    variables.MULTIPART_FORM_DATA_VALUE = "multipart/form-data";
    this.MULTIPART_FORM_DATA_VALUE = variables.MULTIPART_FORM_DATA_VALUE;
    _instance.enums['MULTIPART_FORM_DATA'] = valueOf(MULTIPART_FORM_DATA_VALUE);
    this['MULTIPART_FORM_DATA'] = _instance.enums.MULTIPART_FORM_DATA;

    /**
     * Public constant media type for {@code text/event-stream}.
     * @since 4.3.6
     * @see <a href="https://www.w3.org/TR/eventsource/">Server-Sent Events W3C recommendation</a>
     */
    variables.TEXT_EVENT_STREAM_VALUE = "text/event-stream";
    this.TEXT_EVENT_STREAM_VALUE = variables.TEXT_EVENT_STREAM_VALUE;
    _instance.enums['TEXT_EVENT_STREAM'] = valueOf(TEXT_EVENT_STREAM_VALUE);
    this['TEXT_EVENT_STREAM'] = _instance.enums.TEXT_EVENT_STREAM;

    /**
     * Public constant media type for {@code text/html}.
     */
    variables.TEXT_HTML_VALUE = "text/html";
    this.TEXT_HTML_VALUE = variables.TEXT_HTML_VALUE;
    _instance.enums['TEXT_HTML'] = valueOf(TEXT_HTML_VALUE);
    this['TEXT_HTML'] = _instance.enums.TEXT_HTML;

    /**
     * Public constant media type for {@code text/markdown}.
     * @since 4.3
     */
    variables.TEXT_MARKDOWN_VALUE = "text/markdown";
    this.TEXT_MARKDOWN_VALUE = variables.TEXT_MARKDOWN_VALUE;
    _instance.enums['TEXT_MARKDOWN'] = valueOf(TEXT_MARKDOWN_VALUE);
    this['TEXT_MARKDOWN'] = _instance.enums.TEXT_MARKDOWN;

    /**
     * Public constant media type for {@code text/plain}.
     */
    variables.TEXT_PLAIN_VALUE = "text/plain";
    this.TEXT_PLAIN_VALUE = variables.TEXT_PLAIN_VALUE;
    _instance.enums['TEXT_PLAIN'] = valueOf(TEXT_PLAIN_VALUE);
    this['TEXT_PLAIN'] = _instance.enums.TEXT_PLAIN;

    /**
     * Public constant media type for {@code text/xml}.
     */
    variables.TEXT_XML_VALUE = "text/xml";
    this.TEXT_XML_VALUE = variables.TEXT_XML_VALUE;
    _instance.enums['TEXT_XML'] = valueOf(TEXT_XML_VALUE);
    this['TEXT_XML'] = _instance.enums.TEXT_XML;

    /**
     * Public constant media type for {@code application/problem+json}.
     * @since 5.0
     * @see <a href="https://tools.ietf.org/html/rfc7807#section-6.1">Problem Details for HTTP APIs, 6.1. application/problem+json</a>
     */
    variables.APPLICATION_PROBLEM_JSON_VALUE = "application/problem+json";
    this.APPLICATION_PROBLEM_JSON_VALUE = variables.APPLICATION_PROBLEM_JSON_VALUE;
    _instance.enums['APPLICATION_PROBLEM_JSON'] = valueOf(APPLICATION_PROBLEM_JSON_VALUE);
    this['APPLICATION_PROBLEM_JSON'] = _instance.enums.APPLICATION_PROBLEM_JSON;

    /**
     * Public constant media type for {@code application/problem+xml}.
     * @since 5.0
     * @see <a href="https://tools.ietf.org/html/rfc7807#section-6.2">Problem Details for HTTP APIs, 6.2. application/problem+xml</a>
     */
    variables.APPLICATION_PROBLEM_XML_VALUE = "application/problem+xml";
    this.APPLICATION_PROBLEM_XML_VALUE = variables.APPLICATION_PROBLEM_XML_VALUE;
    _instance.enums['APPLICATION_PROBLEM_XML'] = valueOf(APPLICATION_PROBLEM_XML_VALUE);
    this['APPLICATION_PROBLEM_XML'] = _instance.enums.APPLICATION_PROBLEM_XML;

    return this;
  }

  variables.WILDCARD_TYPE = "*";

  variables.PARAM_CHARSET = "charset";

  variables.PARAM_QUALITY_FACTOR = "q";

  variables['Charset'] = createObject("java","java.nio.charset.Charset");

  /**
   * Internally used during MediaType.enum().
   */
  public cfboom.http.MediaType function init( required string type, string subtype = WILDCARD_TYPE, any parameters ) {
    if ( !structKeyExists( variables, "TOKEN" ) ) {
      // variable names refer to RFC 2616, section 2.2
      local['ctl'] = createObject("java","java.util.BitSet").init(javaCast("int",128));
      for (var i = 0; i <= 31; i++) {
        local.ctl.set(javaCast("int",i));
      }
      local.ctl.set(javaCast("int",127));

      local['separators'] = createObject("java","java.util.BitSet").init(javaCast("int",128));
      local.separators.set(javaCast("int",40)); // (
      local.separators.set(javaCast("int",41)); // )
      local.separators.set(javaCast("int",60)); // <
      local.separators.set(javaCast("int",62)); // >
      local.separators.set(javaCast("int",64)); // @
      local.separators.set(javaCast("int",44)); // ,
      local.separators.set(javaCast("int",59)); // ;
      local.separators.set(javaCast("int",58)); // :
      local.separators.set(javaCast("int",92)); // \
      local.separators.set(javaCast("int",47)); // /
      local.separators.set(javaCast("int",91)); // [
      local.separators.set(javaCast("int",93)); // ]
      local.separators.set(javaCast("int",63)); // ?
      local.separators.set(javaCast("int",61)); // =
      local.separators.set(javaCast("int",123)); // {
      local.separators.set(javaCast("int",125)); // }
      local.separators.set(javaCast("int",32)); //
      local.separators.set(javaCast("int",9)); // \t

      variables['TOKEN'] = createObject("java","java.util.BitSet").init(javaCast("int",128));
      TOKEN.set(javaCast("int",0), javaCast("int",128));
      TOKEN.andNot(local.ctl);
      TOKEN.andNot(local.separators);
    }
    checkToken(arguments.type);
    checkToken(arguments.subtype);
    _instance['type'] = arguments.type;
    _instance['subtype'] = arguments.subtype;
    if ( !structKeyExists( arguments, "parameters" ) )
      arguments['parameters'] = {};
    if ( isNumeric(arguments.parameters) )
      arguments['parameters'] = {"#PARAM_QUALITY_FACTOR#" = javaCast("double",arguments.parameters)};
    if ( isValid("string",arguments.parameters) )
      arguments['parameters'] = {"#PARAM_CHARSET#" = arguments.parameters};
    _instance['parameters'] = arguments.parameters;
    return this;
  }

  /**
   * Return the enum values.
   */
  public struct function enums() {
    return _instance.enums;
  }

  public void function checkParameters( required string attribute, required string value ) {
    checkToken( arguments.attribute );
    if ( PARAM_CHARSET.equals( arguments.attribute ) ) {
      arguments.value = unquote( arguments.value );
      Charset.forName( arguments.value );
    }
    else if ( !isQuotedString( arguments.value ) ) {
      checkToken( arguments.value );
    }
    if ( PARAM_QUALITY_FACTOR.equals( arguments.attribute ) ) {
      arguments.value = unquote( arguments.value );
      local['d'] = Double.parseDouble( arguments.value );
      if ( !( local.d >= 0 && local.d <= 1 ) )
        throw( object = createObject("java","java.lang.IllegalArgumentException").init('Invalid quality value "' & arguments.value & '": should be between 0.0 and 1.0') );
    }
  }

  /**
   * Return the quality value, as indicated by a {@code q} parameter, if any.
   * Defaults to {@code 1.0}.
   * @return the quality factory
   */
  public numeric function getQualityValue() {
    local['qualityFactory'] = getParameter( PARAM_QUALITY_FACTOR );
    return ( structKeyExists( local, "qualityFactory" ) ? Double.parseDouble(unquote(local.qualityFactory)) : javaCast("double",1));
  }

  /**
   * Indicate whether this {@code MediaType} includes the given media type.
   * <p>For instance, {@code text/*} includes {@code text/plain} and {@code text/html}, and {@code application/*+xml}
   * includes {@code application/soap+xml}, etc. This method is <b>not</b> symmetric.
   * @param other the reference media type with which to compare
   * @return {@code true} if this media type includes the given media type; {@code false} otherwise
   */
  public boolean function includes( cfboom.http.MediaType other ) {
    if ( !structKeyExists( arguments, "other" ) ) {
      return false;
    }
    if (isWildcardType()) {
      // */* includes anything
      return true;
    }
    else if (getType() == arguments.other.getType()) {
      if (getSubtype() == arguments.other.getSubtype()) {
        return true;
      }
      if (this.isWildcardSubtype()) {
        // wildcard with suffix, e.g. application/*+xml
        local['subtype'] = getSubtype();
        local['thisPlusIdx'] = local.subtype.indexOf('+');
        if (local.thisPlusIdx == -1) {
          return true;
        }
        else {
          // application/*+xml includes application/soap+xml
          local['otherSubtype'] = arguments.other.getSubtype();
          local['otherPlusIdx'] = local.otherSubtype.indexOf('+');
          if (local.otherPlusIdx != -1) {
            local['subtype'] = getSubtype();
            local['thisSubtypeNoSuffix'] = local.subtype.substring(javaCast("int",0), local.thisPlusIdx);
            local['thisSubtypeSuffix'] = local.subtype.substring(javaCast("int",local.thisPlusIdx + 1));
            local['otherSubtypeSuffix'] = local.otherSubtype.substring(javaCast("int",local.otherPlusIdx + 1));
            if (local.thisSubtypeSuffix.equals(local.otherSubtypeSuffix) && WILDCARD_TYPE.equals(local.thisSubtypeNoSuffix)) {
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  /**
   * Indicate whether this {@code MediaType} is compatible with the given media type.
   * <p>For instance, {@code text/*} is compatible with {@code text/plain}, {@code text/html}, and vice versa.
   * In effect, this method is similar to {@link #includes(MediaType)}, except that it <b>is</b> symmetric.
   * @param other the reference media type with which to compare
   * @return {@code true} if this media type is compatible with the given media type; {@code false} otherwise
   */
  public boolean function isCompatibleWith( cfboom.http.MediaType other ) {
    if ( !structKeyExists( arguments, "other" ) ) {
      return false;
    }
    if (isWildcardType() || arguments.other.isWildcardType()) {
      return true;
    }
    else if (getType() == arguments.other.getType()) {
      if (getSubtype() == arguments.other.getSubtype()) {
        return true;
      }
      // wildcard with suffix? e.g. application/*+xml
      if (isWildcardSubtype() || arguments.other.isWildcardSubtype()) {

        local['subtype'] = getSubtype();
        local['thisPlusIdx'] = local.subtype.indexOf('+');
        local['otherSubtype'] = arguments.other.getSubtype();
        local['otherPlusIdx'] = local.otherSubtype.indexOf('+');

        if (local.thisPlusIdx == -1 && local.otherPlusIdx == -1) {
          return true;
        }
        else if (local.thisPlusIdx != -1 && local.otherPlusIdx != -1) {
          local['thisSubtypeNoSuffix'] = local.subtype.substring(javaCast("int",0), local.thisPlusIdx);
          local['otherSubtypeNoSuffix'] = local.otherSubtype.substring(javaCast("int",0), local.otherPlusIdx);

          local['thisSubtypeSuffix'] = local.subtype.substring(javaCast("int",local.thisPlusIdx + 1));
          local['otherSubtypeSuffix'] = local.otherSubtype.substring(javaCast("int",local.otherPlusIdx + 1));

          if (local.thisSubtypeSuffix.equals(local.otherSubtypeSuffix) &&
              (WILDCARD_TYPE.equals(local.thisSubtypeNoSuffix) || WILDCARD_TYPE.equals(local.otherSubtypeNoSuffix))) {
            return true;
          }
        }
      }
    }
    return false;
  }


  /**
   * Return a replica of this instance with the quality value of the given MediaType.
   * @return the same instance if the given MediaType doesn't have a quality value, or a new one otherwise
   */
  public cfboom.http.MediaType function copyQualityValue( required cfboom.http.MediaType mediaType ) {
    if (!structKeyExists(arguments.mediaType.getParameters(), PARAM_QUALITY_FACTOR)) {
      return this;
    }
    local['params'] = {};
    local.params[PARAM_QUALITY_FACTOR] = arguments.mediaType.getParameters()[PARAM_QUALITY_FACTOR];
    return new MediaType(getType(), getSubtype(), local.params);
  }

  /**
   * Return a replica of this instance with its quality value removed.
   * @return the same instance if the media type doesn't contain a quality value, or a new one otherwise
   */
  public cfboom.http.MediaType function removeQualityValue() {
    if (!structKeyExists(getParameters(), PARAM_QUALITY_FACTOR)) {
      return this;
    }
    local['params'] = {};
    for ( var thisParam in getParameters() ) {
      if (thisParam != PARAM_QUALITY_FACTOR)
        local.params[thisParam] = getParameters()[thisParam];
    }
    return new MediaType(getType(), getSubtype(), local.params);
  }


  /**
   * Parse the given String value into a {@code MediaType} object,
   * with this method name following the 'valueOf' naming convention
   * (as supported by {@link org.springframework.core.convert.ConversionService}.
   * @param value the string to parse
   * @throws InvalidMediaTypeException if the media type value cannot be parsed
   * @see #parseMediaType(String)
   */
  public cfboom.http.MediaType function valueOf( required string value ) {
    return parseMediaType(arguments.value);
  }

  /**
   * Parse the given String into a single {@code MediaType}.
   * @param mediaType the string to parse
   * @return the media type
   * @throws InvalidMediaTypeException if the media type value cannot be parsed
   */
  public cfboom.http.MediaType function parseMediaType( required string mediaType ) {
    if (!len(arguments.mediaType)) {
      throw( object = createObject("java","java.lang.IllegalArgumentException").init("Invalid media type """ & arguments.mediaType & """: 'mediaType' must not be empty") );
    }

    local['index'] = arguments.mediaType.indexOf(';');
    local['fullType'] = trim((local.index >= 0 ? arguments.mediaType.substring(javaCast("int",0), local.index) : arguments.mediaType));
    if (local.fullType.isEmpty()) {
      throw( object = createObject("java","java.lang.IllegalArgumentException").init("Invalid media type """ & arguments.mediaType & """: 'mediaType' must not be empty") );
    }

    // java.net.HttpURLConnection returns a *; q=.2 Accept header
    if (WILDCARD_TYPE.equals(local.fullType)) {
      local['fullType'] = "*/*";
    }
    local['subIndex'] = local.fullType.indexOf('/');
    if (local.subIndex == -1) {
      throw( object = createObject("java","java.lang.IllegalArgumentException").init("Invalid media type """ & arguments.mediaType & """: does not contain '/'") );
    }
    if (local.subIndex == local.fullType.length() - 1) {
      throw( object = createObject("java","java.lang.IllegalArgumentException").init("Invalid media type """ & arguments.mediaType & """: does not contain subtype after '/'") );
    }
    local['type'] = local.fullType.substring(javaCast("int",0), local.subIndex);
    local['subtype'] = local.fullType.substring(javaCast("int",local.subIndex + 1), local.fullType.length());
    if (WILDCARD_TYPE.equals(local.type) && !WILDCARD_TYPE.equals(local.subtype)) {
      throw( object = createObject("java","java.lang.IllegalArgumentException").init("Invalid media type """ & arguments.mediaType & """: wildcard type is legal only in '*/*' (all mime types)") );
    }

    local['parameters'] = {};
    do {
      local['nextIndex'] = javaCast("int",local.index + 1);
      local['quoted'] = false;
      while (local.nextIndex < arguments.mediaType.length()) {
        local['ch'] = arguments.mediaType.charAt(local.nextIndex);
        if (local.ch == ';') {
          if (!local.quoted) {
            break;
          }
        }
        else if (local.ch == '"') {
          local['quoted'] = !local.quoted;
        }
        local.nextIndex++;
      }
      local['parameter'] = trim(arguments.mediaType.substring(javaCast("int", local.index + 1), local.nextIndex));
      if (len(local.parameter) > 0) {
        local['eqIndex'] = local.parameter.indexOf('=');
        if (local.eqIndex >= 0) {
          local['attribute'] = local.parameter.substring(javaCast("int",0), local.eqIndex);
          local['value'] = local.parameter.substring(javaCast("int",local.eqIndex + 1), len(local.parameter));
          local.parameters[local.attribute] = local.value;
        }
      }
      local['index'] = javaCast("int",local.nextIndex);
    }
    while (local.index < arguments.mediaType.length());

    try {
      return new MediaType( local.type, local.subtype, local.parameters );
    }
    catch (UnsupportedCharsetException ex) {
    throw new InvalidMimeTypeException(mimeType, "unsupported charset '" + ex.getCharsetName() + "'");
    }
    catch (IllegalArgumentException ex) {
    throw new InvalidMimeTypeException(arguments.mediaType, ex.getMessage());
    }
  }

/**
 * Parse the given list of (potentially) comma-separated strings into a
 * list of {@code MediaType} objects.
 * <p>This method can be used to parse an Accept or Content-Type header.
 * @param mediaTypes the string to parse
 * @return the list of media types
 * @throws InvalidMediaTypeException if the media type value cannot be parsed
 * @since 4.3.2
 * /
public static List<MediaType> parseMediaTypes(List<String> mediaTypes) {
if (CollectionUtils.isEmpty(mediaTypes)) {
return Collections.emptyList();
}
else if (mediaTypes.size() == 1) {
return parseMediaTypes(mediaTypes.get(0));
}
else {
List<MediaType> result = new ArrayList<>(8);
for (String mediaType : mediaTypes) {
result.addAll(parseMediaTypes(mediaType));
}
return result;
}
}
*/

/**
 * Re-create the given mime types as media types.
 * @since 5.0
 * /
public static List<MediaType> asMediaTypes(List<MimeType> mimeTypes) {
return mimeTypes.stream().map(MediaType::asMediaType).collect(Collectors.toList());
}
*/

/**
 * Re-create the given mime type as a media type.
 * @since 5.0
 * /
public static MediaType asMediaType(MimeType mimeType) {
if (mimeType instanceof MediaType) {
return (MediaType) mimeType;
}
return new MediaType(mimeType.getType(), mimeType.getSubtype(), mimeType.getParameters());
}
*/

/**
 * Return a string representation of the given list of {@code MediaType} objects.
 * <p>This method can be used to for an {@code Accept} or {@code Content-Type} header.
 * @param mediaTypes the media types to create a string representation for
 * @return the string representation
 * /
public static String toString(Collection<MediaType> mediaTypes) {
return MimeTypeUtils.toString(mediaTypes);
}
*/

/**
 * Sorts the given list of {@code MediaType} objects by specificity.
 * <p>Given two media types:
 * <ol>
 * <li>if either media type has a {@linkplain #isWildcardType() wildcard type}, then the media type without the
 * wildcard is ordered before the other.</li>
 * <li>if the two media types have different {@linkplain #getType() types}, then they are considered equal and
 * remain their current order.</li>
 * <li>if either media type has a {@linkplain #isWildcardSubtype() wildcard subtype}, then the media type without
 * the wildcard is sorted before the other.</li>
 * <li>if the two media types have different {@linkplain #getSubtype() subtypes}, then they are considered equal
 * and remain their current order.</li>
 * <li>if the two media types have different {@linkplain #getQualityValue() quality value}, then the media type
 * with the highest quality value is ordered before the other.</li>
 * <li>if the two media types have a different amount of {@linkplain #getParameter(String) parameters}, then the
 * media type with the most parameters is ordered before the other.</li>
 * </ol>
 * <p>For example:
 * <blockquote>audio/basic &lt; audio/* &lt; *&#047;*</blockquote>
 * <blockquote>audio/* &lt; audio/*;q=0.7; audio/*;q=0.3</blockquote>
 * <blockquote>audio/basic;level=1 &lt; audio/basic</blockquote>
 * <blockquote>audio/basic == text/html</blockquote>
 * <blockquote>audio/basic == audio/wave</blockquote>
 * @param mediaTypes the list of media types to be sorted
 * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.3.2">HTTP 1.1: Semantics
 * and Content, section 5.3.2</a>
 * /
public static void sortBySpecificity(List<MediaType> mediaTypes) {
Assert.notNull(mediaTypes, "'mediaTypes' must not be null");
if (mediaTypes.size() > 1) {
Collections.sort(mediaTypes, SPECIFICITY_COMPARATOR);
}
}
*/

/**
 * Sorts the given list of {@code MediaType} objects by quality value.
 * <p>Given two media types:
 * <ol>
 * <li>if the two media types have different {@linkplain #getQualityValue() quality value}, then the media type
 * with the highest quality value is ordered before the other.</li>
 * <li>if either media type has a {@linkplain #isWildcardType() wildcard type}, then the media type without the
 * wildcard is ordered before the other.</li>
 * <li>if the two media types have different {@linkplain #getType() types}, then they are considered equal and
 * remain their current order.</li>
 * <li>if either media type has a {@linkplain #isWildcardSubtype() wildcard subtype}, then the media type without
 * the wildcard is sorted before the other.</li>
 * <li>if the two media types have different {@linkplain #getSubtype() subtypes}, then they are considered equal
 * and remain their current order.</li>
 * <li>if the two media types have a different amount of {@linkplain #getParameter(String) parameters}, then the
 * media type with the most parameters is ordered before the other.</li>
 * </ol>
 * @param mediaTypes the list of media types to be sorted
 * @see #getQualityValue()
 * /
public static void sortByQualityValue(List<MediaType> mediaTypes) {
Assert.notNull(mediaTypes, "'mediaTypes' must not be null");
if (mediaTypes.size() > 1) {
Collections.sort(mediaTypes, QUALITY_VALUE_COMPARATOR);
}
}
*/

/**
 * Sorts the given list of {@code MediaType} objects by specificity as the
 * primary criteria and quality value the secondary.
 * @see MediaType#sortBySpecificity(List)
 * @see MediaType#sortByQualityValue(List)
 * /
public static void sortBySpecificityAndQuality(List<MediaType> mediaTypes) {
Assert.notNull(mediaTypes, "'mediaTypes' must not be null");
if (mediaTypes.size() > 1) {
Collections.sort(mediaTypes,
MediaType.SPECIFICITY_COMPARATOR.thenComparing(MediaType.QUALITY_VALUE_COMPARATOR));
}
}
*/

  /**
   * Checks the given token string for illegal characters, as defined in RFC 2616,
   * section 2.2.
   * @throws IllegalArgumentException in case of illegal characters
   * @see <a href="http://tools.ietf.org/html/rfc2616#section-2.2">HTTP 1.1, section 2.2</a>
   */
  private void function checkToken( required string token ) {
    for (var i = 0; i < len(arguments.token); i++ ) {
      local['ch'] = arguments.token.charAt(javaCast("int",i));
      if (!variables.TOKEN.get(local.ch)) {
        throw( object = createObject("java","java.lang.IllegalArgumentException").init("Invalid token character '" & local.ch & "' in token """ & arguments.token & '"') );
      }
    }
  }

  private boolean function isQuotedString( required string s ) {
    if (arguments.s.length() < 2) {
      return false;
    }
    else {
      return ((arguments.s.startsWith('"') && arguments.s.endsWith('"')) || (arguments.s.startsWith("'") && arguments.s.endsWith("'")));
    }
  }

  public string function unquote( string s ) {
    if ( !structKeyExists( arguments, "s" ) ) {
      return;
    }
    return isQuotedString(arguments.s) ? arguments.s.substring(javaCast("int",1), javaCast("int",arguments.s.length() - 1)) : arguments.s;
  }

  /**
   * Indicates whether the {@linkplain #getType() type} is the wildcard character
   * <code>&#42;</code> or not.
   */
  public boolean function isWildcardType() {
    return WILDCARD_TYPE.equals(getType());
  }

  /**
   * Indicates whether the {@linkplain #getSubtype() subtype} is the wildcard
   * character <code>&#42;</code> or the wildcard character followed by a suffix
   * (e.g. <code>&#42;+xml</code>).
   * @return whether the subtype is a wildcard
   */
  public boolean function isWildcardSubtype() {
    local['subtype'] = getSubtype();
    return WILDCARD_TYPE.equals(local.subtype) || local.subtype.startsWith("*+");
  }

  /**
   * Indicates whether this media type is concrete, i.e. whether neither the type
   * nor the subtype is a wildcard character <code>&#42;</code>.
   * @return whether this media type is concrete
   */
  public boolean function isConcrete() {
    return !isWildcardType() && !isWildcardSubtype();
  }

  /**
   * Return the primary type.
   */
  public string function getType() {
    return _instance.type;
  }

  /**
   * Return the subtype.
   */
  public string function getSubtype() {
    return _instance.subtype;
  }

  /**
   * Return the character set, as indicated by a {@code charset} parameter, if any.
   * @return the character set, or {@code null} if not available
   * @since 4.3
   */
  public any function getCharset() {
    local['charset'] = getParameter(PARAM_CHARSET);
    if ( structKeyExists( local, "charset" ) )
      return Charset.forName(unquote(local.charset));
  }

  /**
   * Return a generic parameter value, given a parameter name.
   * @param name the parameter name
   * @return the parameter value, or {@code null} if not present
   */
  public string function getParameter( string name ) {
    if ( structKeyExists( arguments, "name" ) ) {
      if ( structKeyExists( _instance.parameters, arguments.name ) )
        return _instance.parameters[arguments.name];
    }
  }

  /**
   * Return all generic parameter values.
   * @return a read-only map (possibly empty, never {@code null})
   */
  public struct function getParameters() {
    return _instance.parameters;
  }

  public string function toString() {
    local['builder'] = createObject("java","java.lang.StringBuilder").init();
    appendTo(local.builder);
    return local.builder.toString();
  }

  public void function appendTo( required any builder ) {
    arguments.builder.append(_instance.type);
    arguments.builder.append('/');
    arguments.builder.append(_instance.subtype);
    appendParametersTo(_instance.parameters, arguments.builder);
  }

  private void function appendParametersTo( required struct map, required any builder ) {
    for ( var key in arguments.map ) {
      arguments.builder.append(';');
      arguments.builder.append(key);
      arguments.builder.append('=');
      arguments.builder.append(arguments.map[key]);
    }
  }

/**
 * Compares this {@code MediaType} to another alphabetically.
 * @param other media type to compare to
 * @see MimeTypeUtils#sortBySpecificity(List)
 * /
@Override
public int compareTo(MimeType other) {
int comp = getType().compareToIgnoreCase(other.getType());
if (comp != 0) {
return comp;
}
comp = getSubtype().compareToIgnoreCase(other.getSubtype());
if (comp != 0) {
return comp;
}
comp = getParameters().size() - other.getParameters().size();
if (comp != 0) {
return comp;
}
TreeSet<String> thisAttributes = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
thisAttributes.addAll(getParameters().keySet());
TreeSet<String> otherAttributes = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
otherAttributes.addAll(other.getParameters().keySet());
Iterator<String> thisAttributesIterator = thisAttributes.iterator();
Iterator<String> otherAttributesIterator = otherAttributes.iterator();
while (thisAttributesIterator.hasNext()) {
String thisAttribute = thisAttributesIterator.next();
String otherAttribute = otherAttributesIterator.next();
comp = thisAttribute.compareToIgnoreCase(otherAttribute);
if (comp != 0) {
return comp;
}
String thisValue = getParameters().get(thisAttribute);
String otherValue = other.getParameters().get(otherAttribute);
if (otherValue == null) {
otherValue = "";
}
comp = thisValue.compareTo(otherValue);
if (comp != 0) {
return comp;
}
}
return 0;
}
*/

}
