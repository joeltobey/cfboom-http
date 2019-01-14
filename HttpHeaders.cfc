component
  extends="cfboom.lang.Object"
  displayname="Class HttpHeaders"
  output="false"
{
  /**
   * The HTTP {@code Accept} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.3.2">Section 5.3.2 of RFC 7231</a>
   */
  variables.ACCEPT = "Accept";
  this['ACCEPT'] = variables.ACCEPT;
  /**
   * The HTTP {@code Accept-Charset} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.3.3">Section 5.3.3 of RFC 7231</a>
   */
  variables.ACCEPT_CHARSET = "Accept-Charset";
  this['ACCEPT_CHARSET'] = variables.ACCEPT_CHARSET;
  /**
   * The HTTP {@code Accept-Encoding} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.3.4">Section 5.3.4 of RFC 7231</a>
   */
  variables.ACCEPT_ENCODING = "Accept-Encoding";
  this['ACCEPT_ENCODING'] = variables.ACCEPT_ENCODING;
  /**
   * The HTTP {@code Accept-Language} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.3.5">Section 5.3.5 of RFC 7231</a>
   */
  variables.ACCEPT_LANGUAGE = "Accept-Language";
  this['ACCEPT_LANGUAGE'] = variables.ACCEPT_LANGUAGE;
  /**
   * The HTTP {@code Accept-Ranges} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7233#section-2.3">Section 5.3.5 of RFC 7233</a>
   */
  variables.ACCEPT_RANGES = "Accept-Ranges";
  this['ACCEPT_RANGES'] = variables.ACCEPT_RANGES;
  /**
   * The CORS {@code Access-Control-Allow-Credentials} response header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_ALLOW_CREDENTIALS = "Access-Control-Allow-Credentials";
  this['ACCESS_CONTROL_ALLOW_CREDENTIALS'] = variables.ACCESS_CONTROL_ALLOW_CREDENTIALS;
  /**
   * The CORS {@code Access-Control-Allow-Headers} response header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_ALLOW_HEADERS = "Access-Control-Allow-Headers";
  this['ACCESS_CONTROL_ALLOW_HEADERS'] = variables.ACCESS_CONTROL_ALLOW_HEADERS;
  /**
   * The CORS {@code Access-Control-Allow-Methods} response header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_ALLOW_METHODS = "Access-Control-Allow-Methods";
  this['ACCESS_CONTROL_ALLOW_METHODS'] = variables.ACCESS_CONTROL_ALLOW_METHODS;
  /**
   * The CORS {@code Access-Control-Allow-Origin} response header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_ALLOW_ORIGIN = "Access-Control-Allow-Origin";
  this['ACCESS_CONTROL_ALLOW_ORIGIN'] = variables.ACCESS_CONTROL_ALLOW_ORIGIN;
  /**
   * The CORS {@code Access-Control-Expose-Headers} response header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_EXPOSE_HEADERS = "Access-Control-Expose-Headers";
  this['ACCESS_CONTROL_EXPOSE_HEADERS'] = variables.ACCESS_CONTROL_EXPOSE_HEADERS;
  /**
   * The CORS {@code Access-Control-Max-Age} response header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_MAX_AGE = "Access-Control-Max-Age";
  this['ACCESS_CONTROL_MAX_AGE'] = variables.ACCESS_CONTROL_MAX_AGE;
  /**
   * The CORS {@code Access-Control-Request-Headers} request header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_REQUEST_HEADERS = "Access-Control-Request-Headers";
  this['ACCESS_CONTROL_REQUEST_HEADERS'] = variables.ACCESS_CONTROL_REQUEST_HEADERS;
  /**
   * The CORS {@code Access-Control-Request-Method} request header field name.
   * @see <a href="http://www.w3.org/TR/cors/">CORS W3C recommendation</a>
   */
  variables.ACCESS_CONTROL_REQUEST_METHOD = "Access-Control-Request-Method";
  this['ACCESS_CONTROL_REQUEST_METHOD'] = variables.ACCESS_CONTROL_REQUEST_METHOD;
  /**
   * The HTTP {@code Age} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7234#section-5.1">Section 5.1 of RFC 7234</a>
   */
  variables.AGE = "Age";
  this['AGE'] = variables.AGE;
  /**
   * The HTTP {@code Allow} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-7.4.1">Section 7.4.1 of RFC 7231</a>
   */
  variables.ALLOW = "Allow";
  this['ALLOW'] = variables.ALLOW;
  /**
   * The HTTP {@code Authorization} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7235#section-4.2">Section 4.2 of RFC 7235</a>
   */
  variables.AUTHORIZATION = "Authorization";
  this['AUTHORIZATION'] = variables.AUTHORIZATION;
  /**
   * The HTTP {@code Cache-Control} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7234#section-5.2">Section 5.2 of RFC 7234</a>
   */
  variables.CACHE_CONTROL = "Cache-Control";
  this['CACHE_CONTROL'] = variables.CACHE_CONTROL;
  /**
   * The HTTP {@code Connection} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-6.1">Section 6.1 of RFC 7230</a>
   */
  variables.CONNECTION = "Connection";
  this['CONNECTION'] = variables.CONNECTION;
  /**
   * The HTTP {@code Content-Encoding} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-3.1.2.2">Section 3.1.2.2 of RFC 7231</a>
   */
  variables.CONTENT_ENCODING = "Content-Encoding";
  this['CONTENT_ENCODING'] = variables.CONTENT_ENCODING;
  /**
   * The HTTP {@code Content-Disposition} header field name
   * @see <a href="http://tools.ietf.org/html/rfc6266">RFC 6266</a>
   */
  variables.CONTENT_DISPOSITION = "Content-Disposition";
  this['CONTENT_DISPOSITION'] = variables.CONTENT_DISPOSITION;
  /**
   * The HTTP {@code Content-Language} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-3.1.3.2">Section 3.1.3.2 of RFC 7231</a>
   */
  variables.CONTENT_LANGUAGE = "Content-Language";
  this['CONTENT_LANGUAGE'] = variables.CONTENT_LANGUAGE;
  /**
   * The HTTP {@code Content-Length} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-3.3.2">Section 3.3.2 of RFC 7230</a>
   */
  variables.CONTENT_LENGTH = "Content-Length";
  this['CONTENT_LENGTH'] = variables.CONTENT_LENGTH;
  /**
   * The HTTP {@code Content-Location} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-3.1.4.2">Section 3.1.4.2 of RFC 7231</a>
   */
  variables.CONTENT_LOCATION = "Content-Location";
  this['CONTENT_LOCATION'] = variables.CONTENT_LOCATION;
  /**
   * The HTTP {@code Content-Range} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7233#section-4.2">Section 4.2 of RFC 7233</a>
   */
  variables.CONTENT_RANGE = "Content-Range";
  this['CONTENT_RANGE'] = variables.CONTENT_RANGE;
  /**
   * The HTTP {@code Content-Type} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-3.1.1.5">Section 3.1.1.5 of RFC 7231</a>
   */
  variables.CONTENT_TYPE = "Content-Type";
  this['CONTENT_TYPE'] = variables.CONTENT_TYPE;
  /**
   * The HTTP {@code Cookie} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc2109#section-4.3.4">Section 4.3.4 of RFC 2109</a>
   */
  variables.COOKIE = "Cookie";
  this['COOKIE'] = variables.COOKIE;
  /**
   * The HTTP {@code Date} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-7.1.1.2">Section 7.1.1.2 of RFC 7231</a>
   */
  variables.DATE = "Date";
  this['DATE'] = variables.DATE;
  /**
   * The HTTP {@code ETag} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7232#section-2.3">Section 2.3 of RFC 7232</a>
   */
  variables.ETAG = "ETag";
  this['ETAG'] = variables.ETAG;
  /**
   * The HTTP {@code Expect} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.1.1">Section 5.1.1 of RFC 7231</a>
   */
  variables.EXPECT = "Expect";
  this['EXPECT'] = variables.EXPECT;
  /**
   * The HTTP {@code Expires} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7234#section-5.3">Section 5.3 of RFC 7234</a>
   */
  variables.EXPIRES = "Expires";
  this['EXPIRES'] = variables.EXPIRES;
  /**
   * The HTTP {@code From} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.5.1">Section 5.5.1 of RFC 7231</a>
   */
  variables.FROM = "From";
  this['FROM'] = variables.FROM;
  /**
   * The HTTP {@code Host} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-5.4">Section 5.4 of RFC 7230</a>
   */
  variables.HOST = "Host";
  this['HOST'] = variables.HOST;
  /**
   * The HTTP {@code If-Match} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7232#section-3.1">Section 3.1 of RFC 7232</a>
   */
  variables.IF_MATCH = "If-Match";
  this['IF_MATCH'] = variables.IF_MATCH;
  /**
   * The HTTP {@code If-Modified-Since} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7232#section-3.3">Section 3.3 of RFC 7232</a>
   */
  variables.IF_MODIFIED_SINCE = "If-Modified-Since";
  this['IF_MODIFIED_SINCE'] = variables.IF_MODIFIED_SINCE;
  /**
   * The HTTP {@code If-None-Match} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7232#section-3.2">Section 3.2 of RFC 7232</a>
   */
  variables.IF_NONE_MATCH = "If-None-Match";
  this['IF_NONE_MATCH'] = variables.IF_NONE_MATCH;
  /**
   * The HTTP {@code If-Range} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7233#section-3.2">Section 3.2 of RFC 7233</a>
   */
  variables.IF_RANGE = "If-Range";
  this['IF_RANGE'] = variables.IF_RANGE;
  /**
   * The HTTP {@code If-Unmodified-Since} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7232#section-3.4">Section 3.4 of RFC 7232</a>
   */
  variables.IF_UNMODIFIED_SINCE = "If-Unmodified-Since";
  this['IF_UNMODIFIED_SINCE'] = variables.IF_UNMODIFIED_SINCE;
  /**
   * The HTTP {@code Last-Modified} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7232#section-2.2">Section 2.2 of RFC 7232</a>
   */
  variables.LAST_MODIFIED = "Last-Modified";
  this['LAST_MODIFIED'] = variables.LAST_MODIFIED;
  /**
   * The HTTP {@code Link} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc5988">RFC 5988</a>
   */
  variables.LINK = "Link";
  this['LINK'] = variables.LINK;
  /**
   * The HTTP {@code Location} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-7.1.2">Section 7.1.2 of RFC 7231</a>
   */
  variables.LOCATION = "Location";
  this['LOCATION'] = variables.LOCATION;
  /**
   * The HTTP {@code Max-Forwards} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.1.2">Section 5.1.2 of RFC 7231</a>
   */
  variables.MAX_FORWARDS = "Max-Forwards";
  this['MAX_FORWARDS'] = variables.MAX_FORWARDS;
  /**
   * The HTTP {@code Origin} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc6454">RFC 6454</a>
   */
  variables.ORIGIN = "Origin";
  this['ORIGIN'] = variables.ORIGIN;
  /**
   * The HTTP {@code Pragma} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7234#section-5.4">Section 5.4 of RFC 7234</a>
   */
  variables.PRAGMA = "Pragma";
  this['PRAGMA'] = variables.PRAGMA;
  /**
   * The HTTP {@code Proxy-Authenticate} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7235#section-4.3">Section 4.3 of RFC 7235</a>
   */
  variables.PROXY_AUTHENTICATE = "Proxy-Authenticate";
  this['PROXY_AUTHENTICATE'] = variables.PROXY_AUTHENTICATE;
  /**
   * The HTTP {@code Proxy-Authorization} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7235#section-4.4">Section 4.4 of RFC 7235</a>
   */
  variables.PROXY_AUTHORIZATION = "Proxy-Authorization";
  this['PROXY_AUTHORIZATION'] = variables.PROXY_AUTHORIZATION;
  /**
   * The HTTP {@code Range} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7233#section-3.1">Section 3.1 of RFC 7233</a>
   */
  variables.RANGE = "Range";
  this['RANGE'] = variables.RANGE;
  /**
   * The HTTP {@code Referer} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.5.2">Section 5.5.2 of RFC 7231</a>
   */
  variables.REFERER = "Referer";
  this['REFERER'] = variables.REFERER;
  /**
   * The HTTP {@code Retry-After} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-7.1.3">Section 7.1.3 of RFC 7231</a>
   */
  variables.RETRY_AFTER = "Retry-After";
  this['RETRY_AFTER'] = variables.RETRY_AFTER;
  /**
   * The HTTP {@code Server} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-7.4.2">Section 7.4.2 of RFC 7231</a>
   */
  variables.SERVER = "Server";
  this['SERVER'] = variables.SERVER;
  /**
   * The HTTP {@code Set-Cookie} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc2109#section-4.2.2">Section 4.2.2 of RFC 2109</a>
   */
  variables.SET_COOKIE = "Set-Cookie";
  this['SET_COOKIE'] = variables.SET_COOKIE;
  /**
   * The HTTP {@code Set-Cookie2} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc2965">RFC 2965</a>
   */
  variables.SET_COOKIE2 = "Set-Cookie2";
  this['SET_COOKIE2'] = variables.SET_COOKIE2;
  /**
   * The HTTP {@code TE} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-4.3">Section 4.3 of RFC 7230</a>
   */
  variables.TE = "TE";
  this['TE'] = variables.TE;
  /**
   * The HTTP {@code Trailer} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-4.4">Section 4.4 of RFC 7230</a>
   */
  variables.TRAILER = "Trailer";
  this['TRAILER'] = variables.TRAILER;
  /**
   * The HTTP {@code Transfer-Encoding} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-3.3.1">Section 3.3.1 of RFC 7230</a>
   */
  variables.TRANSFER_ENCODING = "Transfer-Encoding";
  this['TRANSFER_ENCODING'] = variables.TRANSFER_ENCODING;
  /**
   * The HTTP {@code Upgrade} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-6.7">Section 6.7 of RFC 7230</a>
   */
  variables.UPGRADE = "Upgrade";
  this['UPGRADE'] = variables.UPGRADE;
  /**
   * The HTTP {@code User-Agent} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-5.5.3">Section 5.5.3 of RFC 7231</a>
   */
  variables.USER_AGENT = "User-Agent";
  this['USER_AGENT'] = variables.USER_AGENT;
  /**
   * The HTTP {@code Vary} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7231#section-7.1.4">Section 7.1.4 of RFC 7231</a>
   */
  variables.VARY = "Vary";
  this['VARY'] = variables.VARY;
  /**
   * The HTTP {@code Via} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7230#section-5.7.1">Section 5.7.1 of RFC 7230</a>
   */
  variables.VIA = "Via";
  this['VIA'] = variables.VIA;
  /**
   * The HTTP {@code Warning} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7234#section-5.5">Section 5.5 of RFC 7234</a>
   */
  variables.WARNING = "Warning";
  this['WARNING'] = variables.WARNING;
  /**
   * The HTTP {@code WWW-Authenticate} header field name.
   * @see <a href="http://tools.ietf.org/html/rfc7235#section-4.1">Section 4.1 of RFC 7235</a>
   */
  variables.WWW_AUTHENTICATE = "WWW-Authenticate";
  this['WWW_AUTHENTICATE'] = variables.WWW_AUTHENTICATE;

  /**
   * Date formats as specified in the HTTP RFC
   * @see <a href="https://tools.ietf.org/html/rfc7231#section-7.1.1.1">Section 7.1.1.1 of RFC 7231</a>
   */
  variables.DATE_FORMATS = ["EEE, dd MMM yyyy HH:mm:ss zzz","EEE, dd-MMM-yy HH:mm:ss zzz","EEE MMM dd HH:mm:ss yyyy"];

  /**
   * Pattern matching ETag multiple field values in headers such as "If-Match", "If-None-Match"
   * @see <a href="https://tools.ietf.org/html/rfc7232#section-2.3">Section 2.3 of RFC 7232</a>
   */
  variables.ETAG_HEADER_VALUE_PATTERN = createObject("java","java.util.regex.Pattern").compile('\\*|\\s*((W\\/)?(\"[^\"]*\"))\\s*,?');

  variables.DECIMAL_FORMAT_SYMBOLS = createObject("java","java.text.DecimalFormatSymbols").init( createObject("java","java.util.Locale").ENGLISH );

  variables.GMT = createObject("java","java.util.TimeZone").getTimeZone("GMT");

  variables.ALLOWED_METHODS = "GET,HEAD,POST,PUT,PATCH,DELETE,OPTIONS,TRACE";

  variables['Locale'] = createObject("java","java.util.Locale");
  variables['StandardCharsets'] = createObject("java","java.nio.charset.StandardCharsets");
  variables['Charset'] = createObject("java","java.nio.charset.Charset");

  _instance['headers'] = {};

  public cfboom.http.HttpHeaders function init() {
    return this;
  }

  /**
   * Set the list of acceptable {@linkplain MediaType media types},
   * as specified by the {@code Accept} header.
   */
  public void function setAccept( any acceptableMediaTypes ) {
    if ( structKeyExists( arguments, "acceptableMediaTypes" ) ) {
      if ( !isArray( arguments.acceptableMediaTypes ) )
        arguments.acceptableMediaTypes = [ arguments.acceptableMediaTypes ];
      set( ACCEPT, toCommaDelimitedString( arguments.acceptableMediaTypes ) );
    }
  }

  /**
   * Return the list of acceptable {@linkplain MediaType media types},
   * as specified by the {@code Accept} header.
   * <p>Returns an empty list when the acceptable media types are unspecified.
   */
  public array function getAccept() {
	local['results'] = [];
    local['mediaTypes'] = get(ACCEPT);
    if ( structKeyExists( local, "mediaTypes" ) ) {
      for ( var mediaType in local.mediaTypes ) {
        local['acceptTypes'] = listToArray( mediaType );
        for ( var acceptType in local.acceptTypes ) {
          arrayAppend( local.results, trim(acceptType) );
        }
      }
    }
    return local.results;
  }

  /**
   * Set the acceptable language ranges, as specified by the
   * {@literal Accept-Language} header.
   * @since 5.0
   */
  public void function setAcceptLanguage( required any languages ) {
    local['decimal'] = createObject("java","java.text.DecimalFormat").init("0.0", DECIMAL_FORMAT_SYMBOLS);
// TODO: Figure out how to do this.
/*
		List<String> values = languages.stream()
				.map(range ->
						range.getWeight() == Locale.LanguageRange.MAX_WEIGHT ?
								range.getRange() :
								range.getRange() + ";q=" + decimal.format(range.getWeight()))
				.collect(Collectors.toList());
		set(ACCEPT_LANGUAGE, toCommaDelimitedString(values));
*/
  }

  /**
   * Return the language ranges from the {@literal "Accept-Language"} header.
   * <p>If you only need sorted, preferred locales only use
   * {@link getAcceptLanguageAsLocales()} or if you need to filter based on
   * a list of supported locales you can pass the returned list to
   * {@link Localefilter(List, Collection)}.
   * @since 5.0
   */
  public any function getAcceptLanguage() {
    variables['Collections'] = createObject("java", "java.util.Collections");
    local['value'] = getFirst(ACCEPT_LANGUAGE);
    return structKeyExists( local, "value" ) && len( local.value ) ? createObject("java","java.util.Locale").LanguageRange.parse(local.value) : Collections.emptyList();
  }

/**
* Variant of {@link setAcceptLanguage(List)} using {@link Locale}'s.
* @since 5.0
* /
	public void setAcceptLanguageAsLocales(List<Locale> locales) {
		setAcceptLanguage(locales.stream()
				.map(locale -> new Locale.LanguageRange(locale.toLanguageTag()))
				.collect(Collectors.toList()));
	}
*/
/**
* A variant of {@link getAcceptLanguage()} that converts each
* {@link java.util.Locale.LanguageRange} to a {@link Locale}.
* @return the locales or an empty list
* @since 5.0
* /
public List<Locale> getAcceptLanguageAsLocales() {
List<Locale.LanguageRange> ranges = getAcceptLanguage();
if (ranges.isEmpty()) {
return Collections.emptyList();
}
return ranges.stream()
.map(range -> Locale.forLanguageTag(range.getRange()))
.filter(locale -> StringUtils.hasText(locale.getDisplayName()))
.collect(Collectors.toList());
}
*/
  /**
   * Set the (new) value of the {@code Access-Control-Allow-Credentials} response header.
   */
  public void function setAccessControlAllowCredentials( boolean allowCredentials ) {
    set( ACCESS_CONTROL_ALLOW_CREDENTIALS, Boolean.toString( arguments.allowCredentials ) );
  }

  /**
   * Return the value of the {@code Access-Control-Allow-Credentials} response header.
   */
  public boolean function getAccessControlAllowCredentials() {
    return Boolean.parseBoolean( getFirst( ACCESS_CONTROL_ALLOW_CREDENTIALS ) );
  }

  /**
   * Set the (new) value of the {@code Access-Control-Allow-Headers} response header.
   */
  public void function setAccessControlAllowHeaders( array allowedHeaders ) {
    set( ACCESS_CONTROL_ALLOW_HEADERS, toCommaDelimitedString( arguments.allowedHeaders ) );
  }

  /**
   * Return the value of the {@code Access-Control-Allow-Headers} response header.
   */
  public any function getAccessControlAllowHeaders() {
    return getValuesAsList( ACCESS_CONTROL_ALLOW_HEADERS );
  }

  /**
   * Set the (new) value of the {@code Access-Control-Allow-Methods} response header.
   */
  public void function setAccessControlAllowMethods( required arry allowedMethods ) {
    set( ACCESS_CONTROL_ALLOW_METHODS, arrayToList( arguments.allowedMethods ) );
  }

  /**
   * Return the value of the {@code Access-Control-Allow-Methods} response header.
   */
  public any function getAccessControlAllowMethods() {
    local['result'] = createObject("java","java.util.ArrayList").init();
    local['value'] = getFirst( ACCESS_CONTROL_ALLOW_METHODS );
    if ( structKeyExists( local, "value" ) ) {
      local['tokens'] = listToArray( local.value );
      for ( var token in local.tokens ) {
        local['resolved'] = HttpMethod.resolve(token);
        if ( structKeyExists( local, "resolved" ) ) {
          local.result.add( local.resolved );
        }
      }
    }
    return local.result;
  }

  /**
   * Set the (new) value of the {@code Access-Control-Allow-Origin} response header.
   */
  public void function setAccessControlAllowOrigin( required string allowedOrigin ) {
    set( ACCESS_CONTROL_ALLOW_ORIGIN, arguments.allowedOrigin );
  }

  /**
   * Return the value of the {@code Access-Control-Allow-Origin} response header.
   */
  public string function getAccessControlAllowOrigin() {
    return getFieldValues( ACCESS_CONTROL_ALLOW_ORIGIN );
  }

  /**
   * Set the (new) value of the {@code Access-Control-Expose-Headers} response header.
   */
  public void function setAccessControlExposeHeaders( required array exposedHeaders ) {
    set( ACCESS_CONTROL_EXPOSE_HEADERS, toCommaDelimitedString( arguments.exposedHeaders ) );
  }

  /**
   * Return the value of the {@code Access-Control-Expose-Headers} response header.
   */
  public any function getAccessControlExposeHeaders() {
    return getValuesAsList( ACCESS_CONTROL_EXPOSE_HEADERS );
  }

  /**
   * Set the (new) value of the {@code Access-Control-Max-Age} response header.
   */
  public void function setAccessControlMaxAge( required numeric maxAge ) {
    set( ACCESS_CONTROL_MAX_AGE, Long.toString( javaCast( "long", arguments.maxAge ) ) );
  }

  /**
   * Return the value of the {@code Access-Control-Max-Age} response header.
   * <p>Returns -1 when the max age is unknown.
   */
  public numeric function getAccessControlMaxAge() {
    local['value'] = getFirst( ACCESS_CONTROL_MAX_AGE );
    return ( structKeyExists( local, "value" ) ? Long.parseLong( local.value ) : javaCast("long",-1));
  }

  /**
   * Set the (new) value of the {@code Access-Control-Request-Headers} request header.
   */
  public void function setAccessControlRequestHeaders( required array requestHeaders ) {
    set( ACCESS_CONTROL_REQUEST_HEADERS, toCommaDelimitedString( arguments.requestHeaders ) );
  }

  /**
   * Return the value of the {@code Access-Control-Request-Headers} request header.
   */
  public any function getAccessControlRequestHeaders() {
    return getValuesAsList( ACCESS_CONTROL_REQUEST_HEADERS );
  }

  /**
   * Set the (new) value of the {@code Access-Control-Request-Method} request header.
   */
  public void function setAccessControlRequestMethod( required cfboom.http.HttpMethod requestMethod ) {
    set( ACCESS_CONTROL_REQUEST_METHOD, arguments.requestMethod.name() );
  }

  /**
   * Return the value of the {@code Access-Control-Request-Method} request header.
   */
  public any function getAccessControlRequestMethod() {
    return HttpMethod.resolve( getFirst( ACCESS_CONTROL_REQUEST_METHOD ) );
  }

  /**
   * Set the list of acceptable {@linkplain Charset charsets},
   * as specified by the {@code Accept-Charset} header.
   */
  public void function setAcceptCharset( required any acceptableCharsets ) {
    if ( !isArray( arguments.acceptableCharsets ) )
      arguments.acceptableCharsets = [ arguments.acceptableCharsets ];
    local['charsets'] = [];
    for ( var acceptableCharset in arguments.acceptableCharsets ) {
      arrayAppend( local.charsets, Charset.forName( trim( acceptableCharset ) ) );
    }
    local['values'] = [];
    for ( var charset in local.charsets ) {
      arrayAppend( local.values, charset.name().toLowerCase( Locale.ENGLISH ) );
    }
    set( ACCEPT_CHARSET, arrayToList( local.values ) );
  }

  /**
   * Return the list of acceptable {@linkplain Charset charsets},
   * as specified by the {@code Accept-Charset} header.
   */
  public array function getAcceptCharset() {
    local['value'] = getFirst( ACCEPT_CHARSET );
    if ( structKeyExists( local, "value" ) ) {
      local['tokens'] = listToArray( local.value );
      local['tokenArr'] = [];
      for ( var token in local.tokens ) {
        arrayAppend( local.tokenArr, lCase( trim( token ) ) );
      }
      arraySort( local.tokenArr, qualityValueCompare );

      local['result'] = [];
      for ( var token in local.tokenArr ) {
        local['paramIdx'] = token.indexOf(';');
        if ( local.paramIdx == -1 ) {
          local['charsetName'] = token;
        }
        else {
          local['charsetName'] = token.substring( javaCast("int", 0), local.paramIdx );
        }
        if ( !local.charsetName.equals("*") ) {
          arrayAppend( local.result, Charset.forName( local.charsetName ) );
        }
      }
      return local.result;
    }
    else {
      return [];
    }
  }

  /**
   * Set the set of allowed {@link HttpMethod HTTP methods},
   * as specified by the {@code Allow} header.
   */
  public void function setAllow( required any allowedMethods ) {
    local['headerValues'] = [];
    if ( !isArray( arguments.allowedMethods ) )
      arguments.allowedMethods = [ arguments.allowedMethods ];
    for ( var allowedMethod in arguments.allowedMethods ) {
      if ( listFindNoCase( ALLOWED_METHODS, allowedMethod ) )
        arrayAppend( local.headerValues, uCase( trim( allowedMethod ) ) );
    }
    set( ALLOW, arrayToList( local.headerValues ) );
  }

  /**
   * Return the set of allowed {@link HttpMethod HTTP methods},
   * as specified by the {@code Allow} header.
   * <p>Returns an empty set when the allowed methods are unspecified.
   */
  public array function getAllow() {
    local['value'] = getFirst( ALLOW );
    if ( structKeyExists( local, "value" ) && len( local.value ) ) {
      local['tokens'] = listToArray( local.value );
      local['result'] = [];
      for ( var token in local.tokens ) {
        if ( listFindNoCase( ALLOWED_METHODS, token ) )
          arrayAppend( local.result, new cfboom.http.HttpMethod( UCase( trim( token ) ) ) );
      }
      return local.result;
    } else {
      return [];
    }
  }

  /**
   * Set the (new) value of the {@code Cache-Control} header.
   */
  public void function setCacheControl( required string cacheControl ) {
    set( CACHE_CONTROL, arguments.cacheControl );
  }

  /**
   * Return the value of the {@code Cache-Control} header.
   */
  public string function getCacheControl() {
    return getFieldValues( CACHE_CONTROL );
  }

  /**
   * Set the (new) value of the {@code Connection} header.
   */
  public void function setConnection( required any connection ) {
    set( CONNECTION, toCommaDelimitedString( arguments.connection ) );
  }

  /**
   * Return the value of the {@code Connection} header.
   */
  public any function getConnection() {
    return getValuesAsList( CONNECTION );
  }

  /**
   * Set the (new) value of the {@code Content-Disposition} header
   * for {@code form-data}, optionally encoding the filename using the RFC 5987.
   * <p>Only the US-ASCII, UTF-8 and ISO-8859-1 charsets are supported.
   * @param name the control name
   * @param filename the filename (may be {@code null})
   * @param charset the charset used for the filename (may be {@code null})
   * @since 4.3.3
   * @see #setContentDisposition(ContentDisposition)
   * @see #getContentDisposition()
   * @see <a href="https://tools.ietf.org/html/rfc7230#section-3.2.4">RFC 7230 Section 3.2.4</a>
   */
  public void function setContentDispositionFormData( required string name, string filename, any charset ) {
// TODO: Implement
/*
    ContentDisposition disposition = ContentDisposition.builder("form-data")
    .name(name).filename(filename, charset).build();
    setContentDisposition(disposition);
*/
  }

  /**
   * Set the (new) value of the {@literal Content-Disposition} header. Supports the
   * disposition type and {@literal filename}, {@literal filename*} (encoded according
   * to RFC 5987, only the US-ASCII, UTF-8 and ISO-8859-1 charsets are supported),
   * {@literal name}, {@literal size} parameters.
   * @since 5.0
   * @see #getContentDisposition()
   */
  public void function setContentDisposition( ContentDisposition contentDisposition ) {
    set( CONTENT_DISPOSITION, contentDisposition.toString() );
  }

  /**
   * Return the {@literal Content-Disposition} header parsed as a {@link ContentDisposition}
   * instance. Supports the disposition type and {@literal filename}, {@literal filename*}
   * (encoded according to RFC 5987, only the US-ASCII, UTF-8 and ISO-8859-1 charsets are
   * supported), {@literal name}, {@literal size} parameters.
   * @since 5.0
   * @see #setContentDisposition(ContentDisposition)
   */
  public ContentDisposition function getContentDisposition() {
    local['contentDisposition'] = getFirst(CONTENT_DISPOSITION);
    if ( structKeyExists( local, "contentDisposition" ) ) {
      return ContentDisposition.parse( local.contentDisposition );
    }
    return ContentDisposition.empty();
  }

  /**
   * Set the {@link Locale} of the content language,
   * as specified by the {@literal Content-Language} header.
   * <p>Use {@code set(CONTENT_LANGUAGE, ...)} if you need
   * to set multiple content languages.</p>
   * @since 5.0
   */
  public void function setContentLanguage( required any locale ) {
    set( CONTENT_LANGUAGE, arguments.locale.toLanguageTag() );
  }

  /**
   * Return the first {@link Locale} of the content languages,
   * as specified by the {@literal Content-Language} header.
   * <p>Returns {@code null} when the content language is unknown.
   * <p>Use {@code getValuesAsList(CONTENT_LANGUAGE)} if you need
   * to get multiple content languages.</p>
   * @since 5.0
   */
  public any function getContentLanguage() {
// TODO: Implement this
/*
    return getValuesAsList( CONTENT_LANGUAGE )
      .stream()
      .findFirst()
      .map(Locale::forLanguageTag)
      .orElse(null);
*/
  }

  /**
   * Set the length of the body in bytes, as specified by the
   * {@code Content-Length} header.
   */
  public void function setContentLength( required numeric contentLength ) {
    set(CONTENT_LENGTH, createObject("java","java.lang.Long").toString(javaCast("long",arguments.contentLength)));
  }

  /**
   * Return the length of the body in bytes, as specified by the
   * {@code Content-Length} header.
   * <p>Returns -1 when the content-length is unknown.
   */
  public numeric function getContentLength() {
    local['value'] = getFirst(CONTENT_LENGTH);
    return ( structKeyExists(local, "value") ? createObject("java","java.lang.Long").parseLong(local.value) : javaCast("long",-1));
  }

  /**
   * Set the {@linkplain MediaType media type} of the body,
   * as specified by the {@code Content-Type} header.
   */
  public void function setContentType( required cfboom.http.MediaType mediaType ) {
    Assert.isTrue( !arguments.mediaType.isWildcardType(), "'Content-Type' cannot contain wildcard type '*'" );
    Assert.isTrue( !arguments.mediaType.isWildcardSubtype(), "'Content-Type' cannot contain wildcard subtype '*'" );
    set( CONTENT_TYPE, mediaType.toString() );
  }

  /**
   * Return the {@linkplain MediaType media type} of the body, as specified
   * by the {@code Content-Type} header.
   * <p>Returns {@code null} when the content-type is unknown.
   */
  public any function getContentType() {
    local['value'] = getFirst( CONTENT_TYPE );
    if ( structKeyExists( local, "value" ) && len( local.value ) )
      return MediaType.parseMediaType( local.value );
  }

  /**
   * Set the date and time at which the message was created, as specified
   * by the {@code Date} header.
   * <p>The date should be specified as the number of milliseconds since
   * January 1, 1970 GMT.
   */
  public void function setDate( required numeric date ) {
    setDate( variables.DATE, arguments.date );
  }

  /**
   * Return the date and time at which the message was created, as specified
   * by the {@code Date} header.
   * <p>The date is returned as the number of milliseconds since
   * January 1, 1970 GMT. Returns -1 when the date is unknown.
   * @throws IllegalArgumentException if the value can't be converted to a date
   */
  public numeric function getDate() {
    return getFirstDate( DATE );
  }

  /**
   * Set the (new) entity tag of the body, as specified by the {@code ETag} header.
   */
  public void function setETag( string eTag ) {
// TODO: Implement this
/*
    if (eTag != null) {
    Assert.isTrue(eTag.startsWith("\"") || eTag.startsWith("W/"),
                        "Invalid eTag, does not start with W/ or \"");
    Assert.isTrue(eTag.endsWith("\""), "Invalid eTag, does not end with \"");
    }
    set(ETAG, eTag);
*/
  }

  /**
   * Return the entity tag of the body, as specified by the {@code ETag} header.
   */
  public string function getETag() {
    return getFirst( ETAG );
  }

  /**
   * Set the date and time at which the message is no longer valid,
   * as specified by the {@code Expires} header.
   * <p>The date should be specified as the number of milliseconds since
   * January 1, 1970 GMT.
   */
  public void function setExpires( required numeric expires ) {
    setDate( EXPIRES, arguments.expires );
  }

  /**
   * Return the date and time at which the message is no longer valid,
   * as specified by the {@code Expires} header.
   * <p>The date is returned as the number of milliseconds since
   * January 1, 1970 GMT. Returns -1 when the date is unknown.
   */
  public numeric function getExpires() {
    return getFirstDate( EXPIRES, false );
  }

  /**
   * Set the (new) value of the {@code Host} header.
   * <p>If the given {@linkplain InetSocketAddress#getPort() port} is {@code 0},
   * the host header will only contain the
   * {@linkplain InetSocketAddress#getHostString() hostname}.
   * @since 5.0
   */
  public void function setHost( required any host ) {
    local['value'] = ( arguments.host.getPort() != 0 ? String.format("%s:%d", arguments.host.getHostString(), arguments.host.getPort()) : arguments.host.getHostString() );
    set( HOST, local.value );
  }

  /**
   * Return the value of the required {@code Host} header.
   * <p>If the header value does not contain a port, the returned
   * {@linkplain InetSocketAddress#getPort() port} will be {@code 0}.
   * @since 5.0
   */
  public any function getHost() {
    local['value'] = getFirst( HOST );
    if ( !structKeyExists( local, "value" ) ) {
      return;
    }
    local['idx'] = local.value.lastIndexOf(':');
    local['port'] = 0;
    if ( local.idx != -1 && local.idx < local.value.length() - 1 ) {
      local['hostname'] = local.value.substring( javaCast("int",0), local.idx );
      local['portString'] = local.value.substring( javaCast("int",local.idx + 1) );
      try {
        local.port = Integer.parseInt( local.portString );
      }
      catch ( java.lang.NumberFormatException ex ) {
        // ignored
      }
    }
    if ( !structKeyExists( local, "hostname" ) ) {
      local['hostname'] = local.value;
    }
    return InetSocketAddress.createUnresolved( local.hostname, local.port );
  }

  /**
   * Set the (new) value of the {@code If-Match} header.
   * @since 4.3
   */
  public void function setIfMatch( required string ifMatch ) {
    set( IF_MATCH, arguments.ifMatch );
  }

  /**
   * Set the (new) value of the {@code If-Match} header.
   * @since 4.3
   */
  public void function setIfMatch( required any ifMatchList ) {
    set( IF_MATCH, toCommaDelimitedString( arguments.ifMatchList ) );
  }

  /**
   * Return the value of the {@code If-Match} header.
   * @since 4.3
   */
  public any function getIfMatch() {
    return getETagValuesAsList( IF_MATCH );
  }

  /**
   * Set the (new) value of the {@code If-Modified-Since} header.
   * <p>The date should be specified as the number of milliseconds since
   * January 1, 1970 GMT.
   */
  public void function setIfModifiedSince( required numeric ifModifiedSince ) {
    setDate( IF_MODIFIED_SINCE, arguments.ifModifiedSince );
  }

  /**
   * Return the value of the {@code If-Modified-Since} header.
   * <p>The date is returned as the number of milliseconds since
   * January 1, 1970 GMT. Returns -1 when the date is unknown.
   */
  public numeric function getIfModifiedSince() {
    return getFirstDate( IF_MODIFIED_SINCE, false );
  }

  /**
   * Set the (new) value of the {@code If-None-Match} header.
   */
  public void function setIfNoneMatch( required string ifNoneMatch ) {
    set( IF_NONE_MATCH, arguments.ifNoneMatch );
  }

  /**
   * Set the (new) values of the {@code If-None-Match} header.
   */
  public void function setIfNoneMatch( required any ifNoneMatchList ) {
    set( IF_NONE_MATCH, toCommaDelimitedString( arguments.ifNoneMatchList ) );
  }

  /**
   * Return the value of the {@code If-None-Match} header.
   */
  public any function getIfNoneMatch() {
    return getETagValuesAsList( IF_NONE_MATCH );
  }

  /**
   * Set the (new) value of the {@code If-Unmodified-Since} header.
   * <p>The date should be specified as the number of milliseconds since
   * January 1, 1970 GMT.
   * @since 4.3
   */
  public void function setIfUnmodifiedSince( required numeric ifUnmodifiedSince ) {
    setDate( IF_UNMODIFIED_SINCE, arguments.ifUnmodifiedSince );
  }

  /**
   * Return the value of the {@code If-Unmodified-Since} header.
   * <p>The date is returned as the number of milliseconds since
   * January 1, 1970 GMT. Returns -1 when the date is unknown.
   * @since 4.3
   */
  public numeric function getIfUnmodifiedSince() {
    return getFirstDate( IF_UNMODIFIED_SINCE, false );
  }

  /**
   * Set the time the resource was last changed, as specified by the
   * {@code Last-Modified} header.
   * <p>The date should be specified as the number of milliseconds since
   * January 1, 1970 GMT.
   */
  public void function setLastModified( required numeric lastModified ) {
    setDate( LAST_MODIFIED, arguments.lastModified );
  }

  /**
   * Return the time the resource was last changed, as specified by the
   * {@code Last-Modified} header.
   * <p>The date is returned as the number of milliseconds since
   * January 1, 1970 GMT. Returns -1 when the date is unknown.
   */
  public numeric function getLastModified() {
    return getFirstDate( LAST_MODIFIED, false );
  }

  /**
   * Set the (new) location of a resource,
   * as specified by the {@code Location} header.
   */
  public void function setLocation( required any location ) {
    set( LOCATION, arguments.location.toASCIIString() );
  }

  /**
   * Return the (new) location of a resource
   * as specified by the {@code Location} header.
   * <p>Returns {@code null} when the location is unknown.
   */
  public any function getLocation() {
    local['value'] = getFirst( LOCATION );
    if ( structKeyExists( local, "value" ) )
      return createObject("java","java.net.URI").create( local.value );
  }

  /**
   * Set the (new) value of the {@code Origin} header.
   */
  public void function setOrigin( required string origin ) {
    set( variables.ORIGIN, arguments.origin );
  }

  /**
   * Return the value of the {@code Origin} header.
   */
  public string function getOrigin() {
    return getFirst( ORIGIN );
  }

  /**
   * Set the (new) value of the {@code Pragma} header.
   */
  public void function setPragma( required string pragma ) {
    set( variables.PRAGMA, arguments.pragma );
  }

  /**
   * Return the value of the {@code Pragma} header.
   */
  public string function getPragma() {
    return getFirst( PRAGMA );
  }

  /**
   * Sets the (new) value of the {@code Range} header.
   */
  public void function setRange( required any ranges ) {
    local['value'] = toCommaDelimitedString( arguments.ranges );
    set( RANGE, local.value );
  }

  /**
   * Return the value of the {@code Range} header.
   * <p>Returns an empty list when the range is unknown.
   */
  public any function getRange() {
    local['value'] = getFirst( RANGE );
    return HttpRange.parseRanges( local.value );
  }

  /**
   * Set the (new) value of the {@code Upgrade} header.
   */
  public void function setUpgrade( required string upgrade ) {
    set( variables.UPGRADE, arguments.upgrade );
  }

  /**
   * Return the value of the {@code Upgrade} header.
   */
  public string function getUpgrade() {
    return getFirst( UPGRADE );
  }

  /**
   * Set the request header names (e.g. "Accept-Language") for which the
   * response is subject to content negotiation and variances based on the
   * value of those request headers.
   * @param requestHeaders the request header names
   * @since 4.3
   */
  public void function setVary( required any requestHeaders ) {
    set( VARY, toCommaDelimitedString( arguments.requestHeaders ) );
  }

  /**
   * Return the request header names subject to content negotiation.
   * @since 4.3
   */
  public any function getVary() {
    return getValuesAsList( VARY );
  }

  /**
   * Set the given date under the given header name after formatting it as a string
   * using the pattern {@code "EEE, dd MMM yyyy HH:mm:ss zzz"}. The equivalent of
   * {@link #set(String, String)} but for date headers.
   * @since 3.2.4
   */
  public void function setDate( required string headerName, required numeric theDate ) {
    local['dateFormat'] = createObject("java","java.text.SimpleDateFormat").init( DATE_FORMATS[1], Locale.US );
    local.dateFormat.setTimeZone( GMT );
    set( arguments.headerName, local.dateFormat.format( createObject("java","java.util.Date").init( javaCast("long", arguments.theDate ) )));
  }

  /**
   * Parse the first header value for the given header name as a date,
   * return -1 if there is no value or also in case of an invalid value
   * (if {@code rejectInvalid=false}), or raise {@link IllegalArgumentException}
   * if the value cannot be parsed as a date.
   * @param headerName the header name
   * @param rejectInvalid whether to reject invalid values with an
   * {@link IllegalArgumentException} ({@code true}) or rather return -1
   * in that case ({@code false})
   * @return the parsed date header, or -1 if none (or invalid)
   */
  private numeric function getFirstDate( required string headerName, boolean rejectInvalid = true ) {
    local['headerValue'] = getFirst( arguments.headerName );
    if ( !structKeyExists( local, "headerValue" ) ) {
      // No header value sent at all
      return javaCast("long",-1);
    }
    if ( local.headerValue.length() >= 3 ) {
      // Short "0" or "-1" like values are never valid HTTP date headers...
      // Let's only bother with SimpleDateFormat parsing for long enough values.
      for ( var dateFormat in DATE_FORMATS ) {
        local['simpleDateFormat'] = createObject("java","java.text.SimpleDateFormat").init( dateFormat, Locale.US );
        local.simpleDateFormat.setTimeZone( GMT );
        try {
          return local.simpleDateFormat.parse( local.headerValue ).getTime();
        }
        catch (java.text.ParseException ex) {
          // ignore
        }
      }
    }
    if ( arguments.rejectInvalid ) {
      throw( object=createObject( "java", "java.lang.IllegalArgumentException" ).init( 'Cannot parse date value "' & local.headerValue & '" for "' & local.headerName & '" header' ) );
    }
    return javaCast("long",-1);
  }

  /**
   * Return all values of a given header name,
   * even if this header is set multiple times.
   * @param headerName the header name
   * @return all associated values
   * @since 4.3
   */
  public array function getValuesAsList( required string headerName ) {
    local['values'] = get( arguments.headerName );
    if ( structKeyExists( local, "values" ) ) {
      local['result'] = [];
      for ( var value in local.values ) {
        if ( !isNull( value ) ) {
          local['tokens'] = listToArray( value );
          for ( var token in local.tokens ) {
            arrayAppend( local.result, trim( token ) );
          }
        }
      }
      return local.result;
    }
    return [];
  }

  /**
   * Retrieve a combined result from the field values of the ETag header.
   * @param headerName the header name
   * @return the combined result
   * @since 4.3
   */
  public any function getETagValuesAsList( required string headerName ) {
    variables['Collections'] = createObject("java", "java.util.Collections");
    local['values'] = get( arguments.headerName );
    if ( structKeyExists( local, "values" ) ) {
      local['result'] = createObject("java","java.util.ArrayList").init();
      for ( var value in local.values ) {
        if ( !isNull( value ) ) {
          local['matcher'] = ETAG_HEADER_VALUE_PATTERN.matcher( value );
          while ( local.matcher.find() ) {
            local['asterisk'] = "*";
            if ( local.asterisk.equals( local.matcher.group() ) ) {
              local.result.add( local.matcher.group() );
            }
            else {
              local.result.add( local.matcher.group( javaCast("int",1) ) );
            }
          }
          if ( local.result.isEmpty() ) {
            throw( object=createObject( "java", "java.lang.IllegalArgumentException" ).init( 'Could not parse header "' & arguments.headerName & '" with value "' & value & '"' ) );
          }
        }
      }
      return local.result;
    }
    return Collections.emptyList();
  }

  /**
   * Retrieve a combined result from the field values of multi-valued headers.
   * @param headerName the header name
   * @return the combined result
   * @since 4.3
   */
  public string function getFieldValues( string headerName ) {
    if ( structKeyExists( arguments, "headerName" ) ) {
      local['headerValues'] = get( arguments.headerName );
      if ( structKeyExists( local, "headerValues" ) )
        return toCommaDelimitedString( local.headerValues );
    }
  }

  /**
   * Turn the given list of header values into a comma-delimited result.
   * @param headerValues the list of header values
   * @return a combined result with comma delimitation
   */
  public string function toCommaDelimitedString( any headerValues ) {
    if ( structKeyExists( arguments, "headerValues" ) ) {
      if ( !isArray( arguments.headerValues ) )
        arguments.headerValues = [ arguments.headerValues ];
      local['builder'] = createObject("java","java.lang.StringBuilder").init();
      local['first'] = true;
      for ( var headerValue in arguments.headerValues ) {
        if ( !local.first )
          local.builder.append(", ");
        local.builder.append( headerValue );
        local['first'] = false;
      }
      return local.builder.toString();
    }
  }

  private numeric function qualityValueCompare( required string obj1, required string obj2 ) {
    local['objArr1'] = listToArray( arguments.obj1, ";q=" );
    if ( !arrayIsDefined( local.objArr1, 2 ) ) {
      arrayAppend( local.objArr1, javaCast( "double", 1 ) );
    } else {
      local.objArr1[2] = javaCast( "double", local.objArr1[2] );
    }
    local['objArr2'] = listToArray( arguments.obj2, ";q=" );
    if ( !arrayIsDefined( local.objArr2, 2 ) ) {
      arrayAppend( local.objArr2, javaCast( "double", 1 ) );
    } else {
      local.objArr2[2] = javaCast( "double", local.objArr2[2] );
    }
    // Reverse the compare so that the highest quality value is first.
    if ( local.objArr1[2] < local.objArr2[2] ) {
      return 1;
    } else if ( local.objArr1[2] > local.objArr2[2] ) {
      return -1;
    } else {
      return 0;
    }
  }

  // MultiValueMap implementation

  /**
   * Return the first header value for the given header name, if any.
   * @param headerName the header name
   * @return the first header value, or {@code null} if none
   */
  public string function getFirst( required string headerName ) {
    if ( structKeyExists(_instance.headers, arguments.headerName))
      local['headerValues'] = _instance.headers[ arguments.headerName ];
    if ( structKeyExists( local, "headerValues" ) )
      return local.headerValues[1];
  }

  /**
   * Add the given, single header value under the given name.
   * @param headerName the header name
   * @param headerValue the header value
   * @throws UnsupportedOperationException if adding headers is not supported
   * @see #put(String, List)
   * @see #set(String, String)
   */
  public void function add( required string headerName, string headerValue ) {
    if ( structKeyExists( arguments, "headerValue" ) ) {
      local['headerValues'] = [];
      if ( structKeyExists( _instance.headers, arguments.headerName ) )
        local['headerValues'] = _instance.headers[ arguments.headerName ];
      if ( !arrayFindNoCase( local.headerValues, arguments.headerValue ) ) {
        arrayAppend( local.headerValues, arguments.headerValue );
        _instance.headers[ arguments.headerName ] = local.headerValues;
      }
    }
  }

  public void function addAll( required string key, array values ) {
    if ( structKeyExists( arguments, "values" ) ) {
      local['headerValues'] = [];
      if ( structKeyExists( _instance.headers, arguments.key ) )
        local['headerValues'] = _instance.headers[ arguments.key ];
      for ( var ele in arguments.values ) {
        if ( !arrayFindNoCase( local.headerValues, arguments.values[ele] ) )
          arrayAppend( local.headerValues, arguments.values[ele] );
      }
      _instance.headers[ arguments.headerName ] = local.headerValues;
    }
  }

  /**
   * Set the given, single header value under the given name.
   * @param headerName the header name
   * @param headerValue the header value
   * @throws UnsupportedOperationException if adding headers is not supported
   * @see #put(String, List)
   * @see #add(String, String)
   */
  public void function set( required string headerName, required string headerValue ) {
    local['headerValues'] = [];
    arrayAppend( local.headerValues, arguments.headerValue );
    _instance.headers[ arguments.headerName ] = local.headerValues;
  }

  public void function setAll( struct values ) {
    for ( var key in arguments.values ) {
      set( key, arguments.values[ key ] );
    }
  }

  public struct function toSingleValueMap() {
    local['singleValueMap'] = {};
    for ( var key in _instance.headers ) {
      local.singleValueMap[key] = _instance.headers[key][1];
    }
    return local.singleValueMap;
  }

  // Map implementation

  public numeric function size() {
    return _instance.headers.size();
  }

  public boolean function isEmpty() {
    return structIsEmpty( _instance.headers );
  }

  public boolean function containsKey( string key ) {
    return structKeyExists( _instance.headers, arguments.key );
  }

  public boolean function containsValue( string value ) {
    return _instance.headers.containsValue( arguments.value );
  }

  public any function get( string key ) {
    if ( structKeyExists( _instance.headers, arguments.key ) )
      return _instance.headers[ arguments.key ];
  }

  public any function put( string key, any value ) {
    return _instance.headers.put( arguments.key, arguments.value );
  }

  public any function remove( string key ) {
    return _instance.headers.remove( arguments.key );
  }

  public void function putAll( struct map ) {
    _instance.headers.putAll( arguments.map );
  }

  public void function clear() {
    _instance.headers.clear();
  }

  public any function keySet() {
    return _instance.headers.keySet();
  }

  public any function values() {
    return _instance.headers.values();
  }

  public any function entrySet() {
    return _instance.headers.entrySet();
  }

  public string function toString() {
    return _instance.headers.toString();
  }

}
