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

  variables.DECIMAL_FORMAT_SYMBOLS = createObject("java","java.text.DecimalFormatSymbols").init(createObject("java","java.util.Locale").ENGLISH);

  variables.GMT = createObject("java","java.util.TimeZone").getTimeZone("GMT");

  _instance['headers'] = {};

  public cfboom.http.HttpHeaders function init() {
    return this;
  }

	/**
	 * Set the list of acceptable {@linkplain MediaType media types},
	 * as specified by the {@code Accept} header.
	 * /
	public void setAccept(List<MediaType> acceptableMediaTypes) {
		set(ACCEPT, MediaType.toString(acceptableMediaTypes));
	}
*/
/**
* Return the list of acceptable {@linkplain MediaType media types},
* as specified by the {@code Accept} header.
* <p>Returns an empty list when the acceptable media types are unspecified.
* /
	public List<MediaType> getAccept() {
		return MediaType.parseMediaTypes(get(ACCEPT));
	}
*/
/**
 * Set the acceptable language ranges, as specified by the
 * {@literal Accept-Language} header.
 * @since 5.0
 * /
	public void setAcceptLanguage(List<Locale.LanguageRange> languages) {
		Assert.notNull(languages, "'languages' must not be null");
		DecimalFormat decimal = new DecimalFormat("0.0", DECIMAL_FORMAT_SYMBOLS);
		List<String> values = languages.stream()
				.map(range ->
						range.getWeight() == Locale.LanguageRange.MAX_WEIGHT ?
								range.getRange() :
								range.getRange() + ";q=" + decimal.format(range.getWeight()))
				.collect(Collectors.toList());
		set(ACCEPT_LANGUAGE, toCommaDelimitedString(values));
	}
*/
/**
* Return the language ranges from the {@literal "Accept-Language"} header.
* <p>If you only need sorted, preferred locales only use
* {@link getAcceptLanguageAsLocales()} or if you need to filter based on
* a list of supported locales you can pass the returned list to
* {@link Localefilter(List, Collection)}.
* @since 5.0
* /
	public List<Locale.LanguageRange> getAcceptLanguage() {
		String value = getFirst(ACCEPT_LANGUAGE);
		return StringUtils.hasText(value) ? Locale.LanguageRange.parse(value) : Collections.emptyList();
	}
*/
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
 * /
public void setAccessControlAllowCredentials(boolean allowCredentials) {
set(ACCESS_CONTROL_ALLOW_CREDENTIALS, Boolean.toString(allowCredentials));
}
*/
/**
 * Return the value of the {@code Access-Control-Allow-Credentials} response header.
 * /
public boolean getAccessControlAllowCredentials() {
return Boolean.parseBoolean(getFirst(ACCESS_CONTROL_ALLOW_CREDENTIALS));
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Allow-Headers} response header.
 * /
public void setAccessControlAllowHeaders(List<String> allowedHeaders) {
set(ACCESS_CONTROL_ALLOW_HEADERS, toCommaDelimitedString(allowedHeaders));
}
*/
/**
 * Return the value of the {@code Access-Control-Allow-Headers} response header.
 * /
public List<String> getAccessControlAllowHeaders() {
return getValuesAsList(ACCESS_CONTROL_ALLOW_HEADERS);
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Allow-Methods} response header.
 * /
public void setAccessControlAllowMethods(List<HttpMethod> allowedMethods) {
set(ACCESS_CONTROL_ALLOW_METHODS, StringUtils.collectionToCommaDelimitedString(allowedMethods));
}
*/
/**
 * Return the value of the {@code Access-Control-Allow-Methods} response header.
 * /
public List<HttpMethod> getAccessControlAllowMethods() {
List<HttpMethod> result = new ArrayList<>();
String value = getFirst(ACCESS_CONTROL_ALLOW_METHODS);
if (value != null) {
String[] tokens = StringUtils.tokenizeToStringArray(value, ",");
for (String token : tokens) {
HttpMethod resolved = HttpMethod.resolve(token);
if (resolved != null) {
result.add(resolved);
}
}
}
return result;
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Allow-Origin} response header.
 * /
public void setAccessControlAllowOrigin(String allowedOrigin) {
set(ACCESS_CONTROL_ALLOW_ORIGIN, allowedOrigin);
}
*/
/**
 * Return the value of the {@code Access-Control-Allow-Origin} response header.
 * /
public String getAccessControlAllowOrigin() {
return getFieldValues(ACCESS_CONTROL_ALLOW_ORIGIN);
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Expose-Headers} response header.
 * /
public void setAccessControlExposeHeaders(List<String> exposedHeaders) {
set(ACCESS_CONTROL_EXPOSE_HEADERS, toCommaDelimitedString(exposedHeaders));
}
*/
/**
 * Return the value of the {@code Access-Control-Expose-Headers} response header.
 * /
public List<String> getAccessControlExposeHeaders() {
return getValuesAsList(ACCESS_CONTROL_EXPOSE_HEADERS);
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Max-Age} response header.
 * /
public void setAccessControlMaxAge(long maxAge) {
set(ACCESS_CONTROL_MAX_AGE, Long.toString(maxAge));
}
*/
/**
 * Return the value of the {@code Access-Control-Max-Age} response header.
 * <p>Returns -1 when the max age is unknown.
 * /
public long getAccessControlMaxAge() {
String value = getFirst(ACCESS_CONTROL_MAX_AGE);
return (value != null ? Long.parseLong(value) : -1);
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Request-Headers} request header.
 * /
public void setAccessControlRequestHeaders(List<String> requestHeaders) {
set(ACCESS_CONTROL_REQUEST_HEADERS, toCommaDelimitedString(requestHeaders));
}
*/
/**
 * Return the value of the {@code Access-Control-Request-Headers} request header.
 * /
public List<String> getAccessControlRequestHeaders() {
return getValuesAsList(ACCESS_CONTROL_REQUEST_HEADERS);
}
*/
/**
 * Set the (new) value of the {@code Access-Control-Request-Method} request header.
 * /
public void setAccessControlRequestMethod(HttpMethod requestMethod) {
set(ACCESS_CONTROL_REQUEST_METHOD, requestMethod.name());
}
*/
/**
 * Return the value of the {@code Access-Control-Request-Method} request header.
 * /
public HttpMethod getAccessControlRequestMethod() {
return HttpMethod.resolve(getFirst(ACCESS_CONTROL_REQUEST_METHOD));
}
*/
/**
 * Set the list of acceptable {@linkplain Charset charsets},
 * as specified by the {@code Accept-Charset} header.
 * /
public void setAcceptCharset(List<Charset> acceptableCharsets) {
StringBuilder builder = new StringBuilder();
for (Iterator<Charset> iterator = acceptableCharsets.iterator(); iterator.hasNext();) {
Charset charset = iterator.next();
builder.append(charset.name().toLowerCase(Locale.ENGLISH));
if (iterator.hasNext()) {
builder.append(", ");
}
}
set(ACCEPT_CHARSET, builder.toString());
}
*/
/**
 * Return the list of acceptable {@linkplain Charset charsets},
 * as specified by the {@code Accept-Charset} header.
 * /
public List<Charset> getAcceptCharset() {
String value = getFirst(ACCEPT_CHARSET);
if (value != null) {
String[] tokens = StringUtils.tokenizeToStringArray(value, ",");
List<Charset> result = new ArrayList<>(tokens.length);
for (String token : tokens) {
int paramIdx = token.indexOf(';');
String charsetName;
if (paramIdx == -1) {
charsetName = token;
}
else {
charsetName = token.substring(0, paramIdx);
}
if (!charsetName.equals("*")) {
result.add(Charset.forName(charsetName));
}
}
return result;
}
else {
return Collections.emptyList();
}
}
*/
/**
 * Set the set of allowed {@link HttpMethod HTTP methods},
 * as specified by the {@code Allow} header.
 * /
public void setAllow(Set<HttpMethod> allowedMethods) {
set(ALLOW, StringUtils.collectionToCommaDelimitedString(allowedMethods));
}
*/
/**
 * Return the set of allowed {@link HttpMethod HTTP methods},
 * as specified by the {@code Allow} header.
 * <p>Returns an empty set when the allowed methods are unspecified.
 * /
public Set<HttpMethod> getAllow() {
String value = getFirst(ALLOW);
if (!StringUtils.isEmpty(value)) {
String[] tokens = StringUtils.tokenizeToStringArray(value, ",");
List<HttpMethod> result = new ArrayList<>(tokens.length);
for (String token : tokens) {
HttpMethod resolved = HttpMethod.resolve(token);
if (resolved != null) {
result.add(resolved);
}
}
return EnumSet.copyOf(result);
}
else {
return EnumSet.noneOf(HttpMethod.class);
}
}
*/
/**
 * Set the (new) value of the {@code Cache-Control} header.
 * /
public void setCacheControl(String cacheControl) {
set(CACHE_CONTROL, cacheControl);
}
*/
/**
 * Return the value of the {@code Cache-Control} header.
 * /
public String getCacheControl() {
return getFieldValues(CACHE_CONTROL);
}
*/
/**
 * Set the (new) value of the {@code Connection} header.
 * /
public void setConnection(String connection) {
set(CONNECTION, connection);
}
*/
/**
 * Set the (new) value of the {@code Connection} header.
 * /
public void setConnection(List<String> connection) {
set(CONNECTION, toCommaDelimitedString(connection));
}
*/
/**
 * Return the value of the {@code Connection} header.
 * /
public List<String> getConnection() {
return getValuesAsList(CONNECTION);
}
*/
/**
 * Set the (new) value of the {@code Content-Disposition} header
 * for {@code form-data}.
 * @param name the control name
 * @param filename the filename (may be {@code null})
 * @see #setContentDisposition(ContentDisposition)
 * @see #getContentDisposition()
 * /
public void setContentDispositionFormData(String name, @Nullable String filename) {
setContentDispositionFormData(name, filename, null);
}
*/
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
 * /
public void setContentDispositionFormData(String name, @Nullable String filename, @Nullable Charset charset) {
Assert.notNull(name, "'name' must not be null");
ContentDisposition disposition = ContentDisposition.builder("form-data")
.name(name).filename(filename, charset).build();
setContentDisposition(disposition);
}
*/
/**
 * Set the (new) value of the {@literal Content-Disposition} header. Supports the
 * disposition type and {@literal filename}, {@literal filename*} (encoded according
 * to RFC 5987, only the US-ASCII, UTF-8 and ISO-8859-1 charsets are supported),
 * {@literal name}, {@literal size} parameters.
 * @since 5.0
 * @see #getContentDisposition()
 * /
public void setContentDisposition(ContentDisposition contentDisposition) {
set(CONTENT_DISPOSITION, contentDisposition.toString());
}
*/
/**
 * Return the {@literal Content-Disposition} header parsed as a {@link ContentDisposition}
 * instance. Supports the disposition type and {@literal filename}, {@literal filename*}
 * (encoded according to RFC 5987, only the US-ASCII, UTF-8 and ISO-8859-1 charsets are
 * supported), {@literal name}, {@literal size} parameters.
 * @since 5.0
 * @see #setContentDisposition(ContentDisposition)
 * /
public ContentDisposition getContentDisposition() {
String contentDisposition = getFirst(CONTENT_DISPOSITION);
if (contentDisposition != null) {
return ContentDisposition.parse(contentDisposition);
}
return ContentDisposition.empty();
}
*/
/**
 * Set the {@link Locale} of the content language,
 * as specified by the {@literal Content-Language} header.
 * <p>Use {@code set(CONTENT_LANGUAGE, ...)} if you need
 * to set multiple content languages.</p>
 * @since 5.0
 * /
public void setContentLanguage(Locale locale) {
Assert.notNull(locale, "'locale' must not be null");
set(CONTENT_LANGUAGE, locale.toLanguageTag());
}
*/
/**
 * Return the first {@link Locale} of the content languages,
 * as specified by the {@literal Content-Language} header.
 * <p>Returns {@code null} when the content language is unknown.
 * <p>Use {@code getValuesAsList(CONTENT_LANGUAGE)} if you need
 * to get multiple content languages.</p>
 * @since 5.0
 * /
@Nullable
public Locale getContentLanguage() {
return getValuesAsList(CONTENT_LANGUAGE)
.stream()
.findFirst()
.map(Locale::forLanguageTag)
.orElse(null);
}
*/
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
 * /
public void setContentType(MediaType mediaType) {
Assert.isTrue(!mediaType.isWildcardType(), "'Content-Type' cannot contain wildcard type '*'");
Assert.isTrue(!mediaType.isWildcardSubtype(), "'Content-Type' cannot contain wildcard subtype '*'");
set(CONTENT_TYPE, mediaType.toString());
}
*/
/**
 * Return the {@linkplain MediaType media type} of the body, as specified
 * by the {@code Content-Type} header.
 * <p>Returns {@code null} when the content-type is unknown.
 * /
@Nullable
public MediaType getContentType() {
String value = getFirst(CONTENT_TYPE);
return (StringUtils.hasLength(value) ? MediaType.parseMediaType(value) : null);
}
*/
/**
 * Set the date and time at which the message was created, as specified
 * by the {@code Date} header.
 * <p>The date should be specified as the number of milliseconds since
 * January 1, 1970 GMT.
 * /
public void setDate(long date) {
setDate(DATE, date);
}
*/
/**
 * Return the date and time at which the message was created, as specified
 * by the {@code Date} header.
 * <p>The date is returned as the number of milliseconds since
 * January 1, 1970 GMT. Returns -1 when the date is unknown.
 * @throws IllegalArgumentException if the value can't be converted to a date
 * /
public long getDate() {
return getFirstDate(DATE);
}
*/
/**
 * Set the (new) entity tag of the body, as specified by the {@code ETag} header.
 * /
public void setETag(String eTag) {
if (eTag != null) {
Assert.isTrue(eTag.startsWith("\"") || eTag.startsWith("W/"),
					"Invalid eTag, does not start with W/ or \"");
Assert.isTrue(eTag.endsWith("\""), "Invalid eTag, does not end with \"");
}
set(ETAG, eTag);
}
*/
/**
 * Return the entity tag of the body, as specified by the {@code ETag} header.
 * /
public String getETag() {
return getFirst(ETAG);
}
*/
/**
 * Set the date and time at which the message is no longer valid,
 * as specified by the {@code Expires} header.
 * <p>The date should be specified as the number of milliseconds since
 * January 1, 1970 GMT.
 * /
public void setExpires(long expires) {
setDate(EXPIRES, expires);
}
*/
/**
 * Return the date and time at which the message is no longer valid,
 * as specified by the {@code Expires} header.
 * <p>The date is returned as the number of milliseconds since
 * January 1, 1970 GMT. Returns -1 when the date is unknown.
 * /
public long getExpires() {
return getFirstDate(EXPIRES, false);
}
*/
/**
 * Set the (new) value of the {@code Host} header.
 * <p>If the given {@linkplain InetSocketAddress#getPort() port} is {@code 0},
 * the host header will only contain the
 * {@linkplain InetSocketAddress#getHostString() hostname}.
 * @since 5.0
 * /
public void setHost(InetSocketAddress host) {
String value = (host.getPort() != 0 ?
String.format("%s:%d", host.getHostString(), host.getPort()) : host.getHostString());
set(HOST, value);
}
*/
/**
 * Return the value of the required {@code Host} header.
 * <p>If the header value does not contain a port, the returned
 * {@linkplain InetSocketAddress#getPort() port} will be {@code 0}.
 * @since 5.0
 * /
@Nullable
public InetSocketAddress getHost() {
String value = getFirst(HOST);
if (value == null) {
return null;
}
int idx = value.lastIndexOf(':');
String hostname = null;
int port = 0;
if (idx != -1 && idx < value.length() - 1) {
hostname = value.substring(0, idx);
String portString = value.substring(idx + 1);
try {
port = Integer.parseInt(portString);
}
catch (NumberFormatException ex) {
// ignored
}
}
if (hostname == null) {
hostname = value;
}
return InetSocketAddress.createUnresolved(hostname, port);
}
*/
/**
 * Set the (new) value of the {@code If-Match} header.
 * @since 4.3
 * /
public void setIfMatch(String ifMatch) {
set(IF_MATCH, ifMatch);
}
*/
/**
 * Set the (new) value of the {@code If-Match} header.
 * @since 4.3
 * /
public void setIfMatch(List<String> ifMatchList) {
set(IF_MATCH, toCommaDelimitedString(ifMatchList));
}
*/
/**
 * Return the value of the {@code If-Match} header.
 * @since 4.3
 * /
public List<String> getIfMatch() {
return getETagValuesAsList(IF_MATCH);
}
*/
/**
 * Set the (new) value of the {@code If-Modified-Since} header.
 * <p>The date should be specified as the number of milliseconds since
 * January 1, 1970 GMT.
 * /
public void setIfModifiedSince(long ifModifiedSince) {
setDate(IF_MODIFIED_SINCE, ifModifiedSince);
}
*/
/**
 * Return the value of the {@code If-Modified-Since} header.
 * <p>The date is returned as the number of milliseconds since
 * January 1, 1970 GMT. Returns -1 when the date is unknown.
 * /
public long getIfModifiedSince() {
return getFirstDate(IF_MODIFIED_SINCE, false);
}
*/
/**
 * Set the (new) value of the {@code If-None-Match} header.
 * /
public void setIfNoneMatch(String ifNoneMatch) {
set(IF_NONE_MATCH, ifNoneMatch);
}
*/
/**
 * Set the (new) values of the {@code If-None-Match} header.
 * /
public void setIfNoneMatch(List<String> ifNoneMatchList) {
set(IF_NONE_MATCH, toCommaDelimitedString(ifNoneMatchList));
}
*/
/**
 * Return the value of the {@code If-None-Match} header.
 * /
public List<String> getIfNoneMatch() {
return getETagValuesAsList(IF_NONE_MATCH);
}
*/
/**
 * Set the (new) value of the {@code If-Unmodified-Since} header.
 * <p>The date should be specified as the number of milliseconds since
 * January 1, 1970 GMT.
 * @since 4.3
 * /
public void setIfUnmodifiedSince(long ifUnmodifiedSince) {
setDate(IF_UNMODIFIED_SINCE, ifUnmodifiedSince);
}
*/
/**
 * Return the value of the {@code If-Unmodified-Since} header.
 * <p>The date is returned as the number of milliseconds since
 * January 1, 1970 GMT. Returns -1 when the date is unknown.
 * @since 4.3
 * /
public long getIfUnmodifiedSince() {
return getFirstDate(IF_UNMODIFIED_SINCE, false);
}
*/
/**
 * Set the time the resource was last changed, as specified by the
 * {@code Last-Modified} header.
 * <p>The date should be specified as the number of milliseconds since
 * January 1, 1970 GMT.
 * /
public void setLastModified(long lastModified) {
setDate(LAST_MODIFIED, lastModified);
}
*/
/**
 * Return the time the resource was last changed, as specified by the
 * {@code Last-Modified} header.
 * <p>The date is returned as the number of milliseconds since
 * January 1, 1970 GMT. Returns -1 when the date is unknown.
 * /
public long getLastModified() {
return getFirstDate(LAST_MODIFIED, false);
}
*/
/**
 * Set the (new) location of a resource,
 * as specified by the {@code Location} header.
 * /
public void setLocation(URI location) {
set(LOCATION, location.toASCIIString());
}
*/
/**
 * Return the (new) location of a resource
 * as specified by the {@code Location} header.
 * <p>Returns {@code null} when the location is unknown.
 * /
@Nullable
public URI getLocation() {
String value = getFirst(LOCATION);
return (value != null ? URI.create(value) : null);
}
*/
/**
 * Set the (new) value of the {@code Origin} header.
 * /
public void setOrigin(String origin) {
set(ORIGIN, origin);
}
*/
/**
 * Return the value of the {@code Origin} header.
 * /
public String getOrigin() {
return getFirst(ORIGIN);
}
*/
/**
 * Set the (new) value of the {@code Pragma} header.
 * /
public void setPragma(String pragma) {
set(PRAGMA, pragma);
}
*/
/**
 * Return the value of the {@code Pragma} header.
 * /
public String getPragma() {
return getFirst(PRAGMA);
}
*/
/**
 * Sets the (new) value of the {@code Range} header.
 * /
public void setRange(List<HttpRange> ranges) {
String value = HttpRange.toString(ranges);
set(RANGE, value);
}
*/
/**
 * Return the value of the {@code Range} header.
 * <p>Returns an empty list when the range is unknown.
 * /
public List<HttpRange> getRange() {
String value = getFirst(RANGE);
return HttpRange.parseRanges(value);
}
*/
/**
 * Set the (new) value of the {@code Upgrade} header.
 * /
public void setUpgrade(String upgrade) {
set(UPGRADE, upgrade);
}
*/
/**
 * Return the value of the {@code Upgrade} header.
 * /
public String getUpgrade() {
return getFirst(UPGRADE);
}
*/
/**
 * Set the request header names (e.g. "Accept-Language") for which the
 * response is subject to content negotiation and variances based on the
 * value of those request headers.
 * @param requestHeaders the request header names
 * @since 4.3
 * /
public void setVary(List<String> requestHeaders) {
set(VARY, toCommaDelimitedString(requestHeaders));
}
*/
/**
 * Return the request header names subject to content negotiation.
 * @since 4.3
 * /
public List<String> getVary() {
return getValuesAsList(VARY);
}
*/
/**
 * Set the given date under the given header name after formatting it as a string
 * using the pattern {@code "EEE, dd MMM yyyy HH:mm:ss zzz"}. The equivalent of
 * {@link #set(String, String)} but for date headers.
 * @since 3.2.4
 * /
public void setDate(String headerName, long date) {
SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMATS[0], Locale.US);
dateFormat.setTimeZone(GMT);
set(headerName, dateFormat.format(new Date(date)));
}
*/
/**
 * Parse the first header value for the given header name as a date,
 * return -1 if there is no value, or raise {@link IllegalArgumentException}
 * if the value cannot be parsed as a date.
 * @param headerName the header name
 * @return the parsed date header, or -1 if none
 * @since 3.2.4
 * /
public long getFirstDate(String headerName) {
return getFirstDate(headerName, true);
}
*/
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
  * /
private long getFirstDate(String headerName, boolean rejectInvalid) {
String headerValue = getFirst(headerName);
if (headerValue == null) {
// No header value sent at all
return -1;
}
if (headerValue.length() >= 3) {
// Short "0" or "-1" like values are never valid HTTP date headers...
// Let's only bother with SimpleDateFormat parsing for long enough values.
for (String dateFormat : DATE_FORMATS) {
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat, Locale.US);
simpleDateFormat.setTimeZone(GMT);
try {
return simpleDateFormat.parse(headerValue).getTime();
}
catch (ParseException ex) {
// ignore
}
}
}
if (rejectInvalid) {
throw new IllegalArgumentException("Cannot parse date value \"" + headerValue +
					"\" for \"" + headerName + "\" header");
}
return -1;
}
*/
/**
 * Return all values of a given header name,
 * even if this header is set multiple times.
 * @param headerName the header name
 * @return all associated values
 * @since 4.3
 * /
public List<String> getValuesAsList(String headerName) {
List<String> values = get(headerName);
if (values != null) {
List<String> result = new ArrayList<>();
for (String value : values) {
if (value != null) {
String[] tokens = StringUtils.tokenizeToStringArray(value, ",");
for (String token : tokens) {
result.add(token);
}
}
}
return result;
}
return Collections.emptyList();
}
*/
/**
 * Retrieve a combined result from the field values of the ETag header.
 * @param headerName the header name
 * @return the combined result
 * @since 4.3
 * /
protected List<String> getETagValuesAsList(String headerName) {
List<String> values = get(headerName);
if (values != null) {
List<String> result = new ArrayList<>();
for (String value : values) {
if (value != null) {
Matcher matcher = ETAG_HEADER_VALUE_PATTERN.matcher(value);
while (matcher.find()) {
if ("*".equals(matcher.group())) {
result.add(matcher.group());
}
else {
result.add(matcher.group(1));
}
}
if (result.isEmpty()) {
throw new IllegalArgumentException(
"Could not parse header '" + headerName + "' with value '" + value + "'");
}
}
}
return result;
}
return Collections.emptyList();
}
*/
/**
 * Retrieve a combined result from the field values of multi-valued headers.
 * @param headerName the header name
 * @return the combined result
 * @since 4.3
 * /
protected String getFieldValues(String headerName) {
List<String> headerValues = get(headerName);
return (headerValues != null ? toCommaDelimitedString(headerValues) : null);
}
*/

/**
 * Turn the given list of header values into a comma-delimited result.
 * @param headerValues the list of header values
 * @return a combined result with comma delimitation
 * /
protected String toCommaDelimitedString(List<String> headerValues) {
StringBuilder builder = new StringBuilder();
for (Iterator<String> it = headerValues.iterator(); it.hasNext(); ) {
String val = it.next();
builder.append(val);
if (it.hasNext()) {
builder.append(", ");
}
}
return builder.toString();
}
*/

  // MultiValueMap implementation

  /**
   * Return the first header value for the given header name, if any.
   * @param headerName the header name
   * @return the first header value, or {@code null} if none
   */
  public string function getFirst( required string headerName ) {
    if ( structKeyExists(_instance.headers, arguments.headerName))
      local['headerValues'] = _instance.headers.get( arguments.headerName );
    return (structKeyExists(local,"headerValues") ? local.headerValues.get(0) : javaCast("null",""));
  }

/**
 * Add the given, single header value under the given name.
 * @param headerName the header name
 * @param headerValue the header value
 * @throws UnsupportedOperationException if adding headers is not supported
 * @see #put(String, List)
 * @see #set(String, String)
 * /
@Override
public void add(String headerName, @Nullable String headerValue) {
List<String> headerValues = this.headers.computeIfAbsent(headerName, k -> new LinkedList<>());
headerValues.add(headerValue);
}
*/
/*
@Override
public void addAll(String key, List<String> values) {
List<String> currentValues = this.headers.computeIfAbsent(key, k -> new LinkedList<>());
currentValues.addAll(values);
}
*/
  /**
   * Set the given, single header value under the given name.
   * @param headerName the header name
   * @param headerValue the header value
   * @throws UnsupportedOperationException if adding headers is not supported
   * @see #put(String, List)
   * @see #add(String, String)
   */
  public void function set( required string headerName, required string headerValue ) {
    local['headerValues'] = createObject("java","java.util.LinkedList").init();
    local.headerValues.add( arguments.headerValue );
    _instance.headers.put( arguments.headerName, local.headerValues );
  }

/*
@Override
public void setAll(Map<String, String> values) {
for (Entry<String, String> entry : values.entrySet()) {
set(entry.getKey(), entry.getValue());
}
}

@Override
public Map<String, String> toSingleValueMap() {
LinkedHashMap<String, String> singleValueMap = new LinkedHashMap<>(this.headers.size());
for (Entry<String, List<String>> entry : this.headers.entrySet()) {
singleValueMap.put(entry.getKey(), entry.getValue().get(0));
}
return singleValueMap;
}


// Map implementation

@Override
public int size() {
return this.headers.size();
}

@Override
public boolean isEmpty() {
return this.headers.isEmpty();
}

@Override
public boolean containsKey(Object key) {
return this.headers.containsKey(key);
}

@Override
public boolean containsValue(Object value) {
return this.headers.containsValue(value);
}

@Override
public List<String> get(Object key) {
return this.headers.get(key);
}

@Override
public List<String> put(String key, List<String> value) {
return this.headers.put(key, value);
}

@Override
public List<String> remove(Object key) {
return this.headers.remove(key);
}

@Override
public void putAll(Map<? extends String, ? extends List<String>> map) {
this.headers.putAll(map);
}

@Override
public void clear() {
this.headers.clear();
}

@Override
public Set<String> keySet() {
return this.headers.keySet();
}

@Override
public Collection<List<String>> values() {
return this.headers.values();
}

@Override
public Set<Entry<String, List<String>>> entrySet() {
return this.headers.entrySet();
}


@Override
public boolean equals(Object other) {
if (this == other) {
return true;
}
if (!(other instanceof HttpHeaders)) {
return false;
}
HttpHeaders otherHeaders = (HttpHeaders) other;
return this.headers.equals(otherHeaders.headers);
}

@Override
public int hashCode() {
return this.headers.hashCode();
}

@Override
public String toString() {
return this.headers.toString();
}
*/
}
