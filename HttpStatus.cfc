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
 * Enumeration of HTTP status codes.
 *
 * <p>The HTTP status code series can be retrieved via {@link #series()}.
 *
 * @author Arjen Poutsma
 * @author Sebastien Deleuze
 * @author Brian Clozel
 * @see HttpStatus.Series
 * @see <a href="http://www.iana.org/assignments/http-status-codes">HTTP Status Code Registry</a>
 * @see <a href="http://en.wikipedia.org/wiki/List_of_HTTP_status_codes">List of HTTP status codes - Wikipedia</a>
 */
component
  extends="cfboom.lang.Object"
  displayname="Enum HttpStatus"
  output="false"
{
  import cfboom.http.HttpStatus;

  _instance['enums'] = {};
  _instance['values'] = {};

  public cfboom.http.HttpStatus function enum() {

    // 0 Status Code Unavailable

    /**
     * {@code 0 Unavailable}.
     */
    _instance.enums['UNAVAILABLE'] = new HttpStatus(0, "UNAVAILABLE", "Unavailable");
    _instance.values[0] = _instance.enums.UNAVAILABLE;
    this['UNAVAILABLE'] = _instance.enums.UNAVAILABLE;

    // 1xx Informational

    /**
     * {@code 100 Continue}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.2.1">HTTP/1.1: Semantics and Content, section 6.2.1</a>
     */
    _instance.enums['CONTINUE'] = new HttpStatus(100, "CONTINUE", "Continue");
    _instance.values[100] = _instance.enums.CONTINUE;
    this['CONTINUE'] = _instance.enums.CONTINUE;

    /**
     * {@code 101 Switching Protocols}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.2.2">HTTP/1.1: Semantics and Content, section 6.2.2</a>
     */
    _instance.enums['SWITCHING_PROTOCOLS'] = new HttpStatus(101, "SWITCHING_PROTOCOLS", "Switching Protocols");
    _instance.values[101] = _instance.enums.SWITCHING_PROTOCOLS;
    this['SWITCHING_PROTOCOLS'] = _instance.enums.SWITCHING_PROTOCOLS;

    /**
     * {@code 102 Processing}.
     * @see <a href="http://tools.ietf.org/html/rfc2518#section-10.1">WebDAV</a>
     */
    _instance.enums['PROCESSING'] = new HttpStatus(102, "PROCESSING", "Processing");
    _instance.values[102] = _instance.enums.PROCESSING;
    this['PROCESSING'] = _instance.enums.PROCESSING;
  
    /**
     * {@code 103 Checkpoint}.
     * @see <a href="http://code.google.com/p/gears/wiki/ResumableHttpRequestsProposal">A proposal for supporting
     * resumable POST/PUT HTTP requests in HTTP/1.0</a>
     */
    _instance.enums['CHECKPOINT'] = new HttpStatus(103, "CHECKPOINT", "Checkpoint");
    _instance.values[103] = _instance.enums.CHECKPOINT;
    this['CHECKPOINT'] = _instance.enums.CHECKPOINT;
  
    // 2xx Success
  
    /**
     * {@code 200 OK}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.3.1">HTTP/1.1: Semantics and Content, section 6.3.1</a>
     */
    _instance.enums['OK'] = new HttpStatus(200, "OK", "OK");
    _instance.values[200] = _instance.enums.OK;
    this['OK'] = _instance.enums.OK;
  
    /**
     * {@code 201 Created}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.3.2">HTTP/1.1: Semantics and Content, section 6.3.2</a>
     */
    _instance.enums['CREATED'] = new HttpStatus(201, "CREATED", "Created");
    _instance.values[201] = _instance.enums.CREATED;
    this['CREATED'] = _instance.enums.CREATED;
  
    /**
     * {@code 202 Accepted}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.3.3">HTTP/1.1: Semantics and Content, section 6.3.3</a>
     */
    _instance.enums['ACCEPTED'] = new HttpStatus(202, "ACCEPTED", "Accepted");
    _instance.values[202] = _instance.enums.ACCEPTED;
    this['ACCEPTED'] = _instance.enums.ACCEPTED;
  
    /**
     * {@code 203 Non-Authoritative Information}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.3.4">HTTP/1.1: Semantics and Content, section 6.3.4</a>
     */
    _instance.enums['NON_AUTHORITATIVE_INFORMATION'] = new HttpStatus(203, "NON_AUTHORITATIVE_INFORMATION", "Non-Authoritative Information");
    _instance.values[203] = _instance.enums.NON_AUTHORITATIVE_INFORMATION;
    this['NON_AUTHORITATIVE_INFORMATION'] = _instance.enums.NON_AUTHORITATIVE_INFORMATION;
  
    /**
     * {@code 204 No Content}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.3.5">HTTP/1.1: Semantics and Content, section 6.3.5</a>
     */
    _instance.enums['NO_CONTENT'] = new HttpStatus(204, "NO_CONTENT", "No Content");
    _instance.values[204] = _instance.enums.NO_CONTENT;
    this['NO_CONTENT'] = _instance.enums.NO_CONTENT;
  
    /**
     * {@code 205 Reset Content}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.3.6">HTTP/1.1: Semantics and Content, section 6.3.6</a>
     */
    _instance.enums['RESET_CONTENT'] = new HttpStatus(205, "RESET_CONTENT", "Reset Content");
    _instance.values[205] = _instance.enums.RESET_CONTENT;
    this['RESET_CONTENT'] = _instance.enums.RESET_CONTENT;
  
    /**
     * {@code 206 Partial Content}.
     * @see <a href="http://tools.ietf.org/html/rfc7233#section-4.1">HTTP/1.1: Range Requests, section 4.1</a>
     */
    _instance.enums['PARTIAL_CONTENT'] = new HttpStatus(206, "PARTIAL_CONTENT", "Partial Content");
    _instance.values[206] = _instance.enums.PARTIAL_CONTENT;
    this['PARTIAL_CONTENT'] = _instance.enums.PARTIAL_CONTENT;
  
    /**
     * {@code 207 Multi-Status}.
     * @see <a href="http://tools.ietf.org/html/rfc4918#section-13">WebDAV</a>
     */
    _instance.enums['MULTI_STATUS'] = new HttpStatus(207, "MULTI_STATUS", "Multi-Status");
    _instance.values[207] = _instance.enums.MULTI_STATUS;
    this['MULTI_STATUS'] = _instance.enums.MULTI_STATUS;
  
    /**
     * {@code 208 Already Reported}.
     * @see <a href="http://tools.ietf.org/html/rfc5842#section-7.1">WebDAV Binding Extensions</a>
     */
    _instance.enums['ALREADY_REPORTED'] = new HttpStatus(208, "ALREADY_REPORTED", "Already Reported");
    _instance.values[208] = _instance.enums.ALREADY_REPORTED;
    this['ALREADY_REPORTED'] = _instance.enums.ALREADY_REPORTED;
  
    /**
     * {@code 226 IM Used}.
     * @see <a href="http://tools.ietf.org/html/rfc3229#section-10.4.1">Delta encoding in HTTP</a>
     */
    _instance.enums['IM_USED'] = new HttpStatus(226, "IM_USED", "IM Used");
    _instance.values[226] = _instance.enums.IM_USED;
    this['IM_USED'] = _instance.enums.IM_USED;
  
    // 3xx Redirection
  
    /**
     * {@code 300 Multiple Choices}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.4.1">HTTP/1.1: Semantics and Content, section 6.4.1</a>
     */
    _instance.enums['MULTIPLE_CHOICES'] = new HttpStatus(300, "MULTIPLE_CHOICES", "Multiple Choices");
    _instance.values[300] = _instance.enums.MULTIPLE_CHOICES;
    this['MULTIPLE_CHOICES'] = _instance.enums.MULTIPLE_CHOICES;
  
    /**
     * {@code 301 Moved Permanently}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.4.2">HTTP/1.1: Semantics and Content, section 6.4.2</a>
     */
    _instance.enums['MOVED_PERMANENTLY'] = new HttpStatus(301, "MOVED_PERMANENTLY", "Moved Permanently");
    _instance.values[301] = _instance.enums.MOVED_PERMANENTLY;
    this['MOVED_PERMANENTLY'] = _instance.enums.MOVED_PERMANENTLY;
  
    /**
     * {@code 302 Found}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.4.3">HTTP/1.1: Semantics and Content, section 6.4.3</a>
     */
    _instance.enums['FOUND'] = new HttpStatus(302, "FOUND", "Found");
    _instance.values[302] = _instance.enums.FOUND;
    this['FOUND'] = _instance.enums.FOUND;
  
    /**
     * {@code 303 See Other}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.4.4">HTTP/1.1: Semantics and Content, section 6.4.4</a>
     */
    _instance.enums['SEE_OTHER'] = new HttpStatus(303, "SEE_OTHER", "See Other");
    _instance.values[303] = _instance.enums.SEE_OTHER;
    this['SEE_OTHER'] = _instance.enums.SEE_OTHER;
  
    /**
     * {@code 304 Not Modified}.
     * @see <a href="http://tools.ietf.org/html/rfc7232#section-4.1">HTTP/1.1: Conditional Requests, section 4.1</a>
     */
    _instance.enums['NOT_MODIFIED'] = new HttpStatus(304, "NOT_MODIFIED", "Not Modified");
    _instance.values[304] = _instance.enums.NOT_MODIFIED;
    this['NOT_MODIFIED'] = _instance.enums.NOT_MODIFIED;
  
    /**
     * {@code 305 Use Proxy}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.4.5">HTTP/1.1: Semantics and Content, section 6.4.5</a>
     * @deprecated due to security concerns regarding in-band configuration of a proxy
     */
    _instance.enums['USE_PROXY'] = new HttpStatus(305, "USE_PROXY", "Use Proxy");
    _instance.values[305] = _instance.enums.USE_PROXY;
    this['USE_PROXY'] = _instance.enums.USE_PROXY;
  
    /**
     * {@code 307 Temporary Redirect}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.4.7">HTTP/1.1: Semantics and Content, section 6.4.7</a>
     */
    _instance.enums['TEMPORARY_REDIRECT'] = new HttpStatus(307, "TEMPORARY_REDIRECT", "Temporary Redirect");
    _instance.values[307] = _instance.enums.TEMPORARY_REDIRECT;
    this['TEMPORARY_REDIRECT'] = _instance.enums.TEMPORARY_REDIRECT;
  
    /**
     * {@code 308 Permanent Redirect}.
     * @see <a href="http://tools.ietf.org/html/rfc7238">RFC 7238</a>
     */
    _instance.enums['PERMANENT_REDIRECT'] = new HttpStatus(308, "PERMANENT_REDIRECT", "Permanent Redirect");
    _instance.values[308] = _instance.enums.PERMANENT_REDIRECT;
    this['PERMANENT_REDIRECT'] = _instance.enums.PERMANENT_REDIRECT;
  
    // --- 4xx Client Error ---
  
    /**
     * {@code 400 Bad Request}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.1">HTTP/1.1: Semantics and Content, section 6.5.1</a>
     */
    _instance.enums['BAD_REQUEST'] = new HttpStatus(400, "BAD_REQUEST", "Bad Request");
    _instance.values[400] = _instance.enums.BAD_REQUEST;
    this['BAD_REQUEST'] = _instance.enums.BAD_REQUEST;
  
    /**
     * {@code 401 Unauthorized}.
     * @see <a href="http://tools.ietf.org/html/rfc7235#section-3.1">HTTP/1.1: Authentication, section 3.1</a>
     */
    _instance.enums['UNAUTHORIZED'] = new HttpStatus(401, "UNAUTHORIZED", "Unauthorized");
    _instance.values[401] = _instance.enums.UNAUTHORIZED;
    this['UNAUTHORIZED'] = _instance.enums.UNAUTHORIZED;
  
    /**
     * {@code 402 Payment Required}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.2">HTTP/1.1: Semantics and Content, section 6.5.2</a>
     */
    _instance.enums['PAYMENT_REQUIRED'] = new HttpStatus(402, "PAYMENT_REQUIRED", "Payment Required");
    _instance.values[402] = _instance.enums.PAYMENT_REQUIRED;
    this['PAYMENT_REQUIRED'] = _instance.enums.PAYMENT_REQUIRED;
  
    /**
     * {@code 403 Forbidden}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.3">HTTP/1.1: Semantics and Content, section 6.5.3</a>
     */
    _instance.enums['FORBIDDEN'] = new HttpStatus(403, "FORBIDDEN", "Forbidden");
    _instance.values[403] = _instance.enums.FORBIDDEN;
    this['FORBIDDEN'] = _instance.enums.FORBIDDEN;
  
    /**
     * {@code 404 Not Found}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.4">HTTP/1.1: Semantics and Content, section 6.5.4</a>
     */
    _instance.enums['NOT_FOUND'] = new HttpStatus(404, "NOT_FOUND", "Not Found");
    _instance.values[404] = _instance.enums.NOT_FOUND;
    this['NOT_FOUND'] = _instance.enums.NOT_FOUND;
  
    /**
     * {@code 405 Method Not Allowed}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.5">HTTP/1.1: Semantics and Content, section 6.5.5</a>
     */
    _instance.enums['METHOD_NOT_ALLOWED'] = new HttpStatus(405, "METHOD_NOT_ALLOWED", "Method Not Allowed");
    _instance.values[405] = _instance.enums.METHOD_NOT_ALLOWED;
    this['METHOD_NOT_ALLOWED'] = _instance.enums.METHOD_NOT_ALLOWED;
  
    /**
     * {@code 406 Not Acceptable}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.6">HTTP/1.1: Semantics and Content, section 6.5.6</a>
     */
    _instance.enums['NOT_ACCEPTABLE'] = new HttpStatus(406, "NOT_ACCEPTABLE", "Not Acceptable");
    _instance.values[406] = _instance.enums.NOT_ACCEPTABLE;
    this['NOT_ACCEPTABLE'] = _instance.enums.NOT_ACCEPTABLE;
  
    /**
     * {@code 407 Proxy Authentication Required}.
     * @see <a href="http://tools.ietf.org/html/rfc7235#section-3.2">HTTP/1.1: Authentication, section 3.2</a>
     */
    _instance.enums['PROXY_AUTHENTICATION_REQUIRED'] = new HttpStatus(407, "PROXY_AUTHENTICATION_REQUIRED", "Proxy Authentication Required");
    _instance.values[407] = _instance.enums.PROXY_AUTHENTICATION_REQUIRED;
    this['PROXY_AUTHENTICATION_REQUIRED'] = _instance.enums.PROXY_AUTHENTICATION_REQUIRED;
  
    /**
     * {@code 408 Request Timeout}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.7">HTTP/1.1: Semantics and Content, section 6.5.7</a>
     */
    _instance.enums['REQUEST_TIMEOUT'] = new HttpStatus(408, "REQUEST_TIMEOUT", "Request Timeout");
    _instance.values[408] = _instance.enums.REQUEST_TIMEOUT;
    this['REQUEST_TIMEOUT'] = _instance.enums.REQUEST_TIMEOUT;
  
    /**
     * {@code 409 Conflict}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.8">HTTP/1.1: Semantics and Content, section 6.5.8</a>
     */
    _instance.enums['CONFLICT'] = new HttpStatus(409, "CONFLICT", "Conflict");
    _instance.values[409] = _instance.enums.CONFLICT;
    this['CONFLICT'] = _instance.enums.CONFLICT;
  
    /**
     * {@code 410 Gone}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.9">HTTP/1.1: Semantics and Content, section 6.5.9</a>
     */
    _instance.enums['GONE'] = new HttpStatus(410, "GONE", "Gone");
    _instance.values[410] = _instance.enums.GONE;
    this['GONE'] = _instance.enums.GONE;
  
    /**
     * {@code 411 Length Required}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.10">HTTP/1.1: Semantics and Content, section 6.5.10</a>
     */
    _instance.enums['LENGTH_REQUIRED'] = new HttpStatus(411, "LENGTH_REQUIRED", "Length Required");
    _instance.values[411] = _instance.enums.LENGTH_REQUIRED;
    this['LENGTH_REQUIRED'] = _instance.enums.LENGTH_REQUIRED;
  
    /**
     * {@code 412 Precondition failed}.
     * @see <a href="http://tools.ietf.org/html/rfc7232#section-4.2">HTTP/1.1: Conditional Requests, section 4.2</a>
     */
    _instance.enums['PRECONDITION_FAILED'] = new HttpStatus(412, "PRECONDITION_FAILED", "Precondition Failed");
    _instance.values[412] = _instance.enums.PRECONDITION_FAILED;
    this['PRECONDITION_FAILED'] = _instance.enums.PRECONDITION_FAILED;
  
    /**
     * {@code 413 Payload Too Large}.
     * @since 4.1
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.11">HTTP/1.1: Semantics and Content, section 6.5.11</a>
     */
    _instance.enums['PAYLOAD_TOO_LARGE'] = new HttpStatus(413, "PAYLOAD_TOO_LARGE", "Payload Too Large");
    _instance.values[413] = _instance.enums.PAYLOAD_TOO_LARGE;
    this['PAYLOAD_TOO_LARGE'] = _instance.enums.PAYLOAD_TOO_LARGE;
  
    /**
     * {@code 414 URI Too Long}.
     * @since 4.1
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.12">HTTP/1.1: Semantics and Content, section 6.5.12</a>
     */
    _instance.enums['URI_TOO_LONG'] = new HttpStatus(414, "URI_TOO_LONG", "URI Too Long");
    _instance.values[414] = _instance.enums.URI_TOO_LONG;
    this['URI_TOO_LONG'] = _instance.enums.URI_TOO_LONG;
  
    /**
     * {@code 415 Unsupported Media Type}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.13">HTTP/1.1: Semantics and Content, section 6.5.13</a>
     */
    _instance.enums['UNSUPPORTED_MEDIA_TYPE'] = new HttpStatus(415, "UNSUPPORTED_MEDIA_TYPE", "Unsupported Media Type");
    _instance.values[415] = _instance.enums.UNSUPPORTED_MEDIA_TYPE;
    this['UNSUPPORTED_MEDIA_TYPE'] = _instance.enums.UNSUPPORTED_MEDIA_TYPE;
  
    /**
     * {@code 416 Requested Range Not Satisfiable}.
     * @see <a href="http://tools.ietf.org/html/rfc7233#section-4.4">HTTP/1.1: Range Requests, section 4.4</a>
     */
    _instance.enums['REQUESTED_RANGE_NOT_SATISFIABLE'] = new HttpStatus(416, "REQUESTED_RANGE_NOT_SATISFIABLE", "Requested range not satisfiable");
    _instance.values[416] = _instance.enums.REQUESTED_RANGE_NOT_SATISFIABLE;
    this['REQUESTED_RANGE_NOT_SATISFIABLE'] = _instance.enums.REQUESTED_RANGE_NOT_SATISFIABLE;
  
    /**
     * {@code 417 Expectation Failed}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.5.14">HTTP/1.1: Semantics and Content, section 6.5.14</a>
     */
    _instance.enums['EXPECTATION_FAILED'] = new HttpStatus(417, "EXPECTATION_FAILED", "Expectation Failed");
    _instance.values[417] = _instance.enums.EXPECTATION_FAILED;
    this['EXPECTATION_FAILED'] = _instance.enums.EXPECTATION_FAILED;
  
    /**
     * {@code 418 I'm a teapot}.
     * @see <a href="http://tools.ietf.org/html/rfc2324#section-2.3.2">HTCPCP/1.0</a>
     */
    _instance.enums['I_AM_A_TEAPOT'] = new HttpStatus(418, "I_AM_A_TEAPOT", "I'm a teapot");
    _instance.values[418] = _instance.enums.I_AM_A_TEAPOT;
    this['I_AM_A_TEAPOT'] = _instance.enums.I_AM_A_TEAPOT;
  
    /**
     * {@code 422 Unprocessable Entity}.
     * @see <a href="http://tools.ietf.org/html/rfc4918#section-11.2">WebDAV</a>
     */
    _instance.enums['UNPROCESSABLE_ENTITY'] = new HttpStatus(422, "UNPROCESSABLE_ENTITY", "Unprocessable Entity");
    _instance.values[422] = _instance.enums.UNPROCESSABLE_ENTITY;
    this['UNPROCESSABLE_ENTITY'] = _instance.enums.UNPROCESSABLE_ENTITY;
  
    /**
     * {@code 423 Locked}.
     * @see <a href="http://tools.ietf.org/html/rfc4918#section-11.3">WebDAV</a>
     */
    _instance.enums['LOCKED'] = new HttpStatus(423, "LOCKED", "Locked");
    _instance.values[423] = _instance.enums.LOCKED;
    this['LOCKED'] = _instance.enums.LOCKED;
  
    /**
     * {@code 424 Failed Dependency}.
     * @see <a href="http://tools.ietf.org/html/rfc4918#section-11.4">WebDAV</a>
     */
    _instance.enums['FAILED_DEPENDENCY'] = new HttpStatus(424, "FAILED_DEPENDENCY", "Failed Dependency");
    _instance.values[424] = _instance.enums.FAILED_DEPENDENCY;
    this['FAILED_DEPENDENCY'] = _instance.enums.FAILED_DEPENDENCY;
  
    /**
     * {@code 426 Upgrade Required}.
     * @see <a href="http://tools.ietf.org/html/rfc2817#section-6">Upgrading to TLS Within HTTP/1.1</a>
     */
    _instance.enums['UPGRADE_REQUIRED'] = new HttpStatus(426, "UPGRADE_REQUIRED", "Upgrade Required");
    _instance.values[426] = _instance.enums.UPGRADE_REQUIRED;
    this['UPGRADE_REQUIRED'] = _instance.enums.UPGRADE_REQUIRED;
  
    /**
     * {@code 428 Precondition Required}.
     * @see <a href="http://tools.ietf.org/html/rfc6585#section-3">Additional HTTP Status Codes</a>
     */
    _instance.enums['PRECONDITION_REQUIRED'] = new HttpStatus(428, "PRECONDITION_REQUIRED", "Precondition Required");
    _instance.values[428] = _instance.enums.PRECONDITION_REQUIRED;
    this['PRECONDITION_REQUIRED'] = _instance.enums.PRECONDITION_REQUIRED;
  
    /**
     * {@code 429 Too Many Requests}.
     * @see <a href="http://tools.ietf.org/html/rfc6585#section-4">Additional HTTP Status Codes</a>
     */
    _instance.enums['TOO_MANY_REQUESTS'] = new HttpStatus(429, "TOO_MANY_REQUESTS", "Too Many Requests");
    _instance.values[429] = _instance.enums.TOO_MANY_REQUESTS;
    this['TOO_MANY_REQUESTS'] = _instance.enums.TOO_MANY_REQUESTS;
  
    /**
     * {@code 431 Request Header Fields Too Large}.
     * @see <a href="http://tools.ietf.org/html/rfc6585#section-5">Additional HTTP Status Codes</a>
     */
    _instance.enums['REQUEST_HEADER_FIELDS_TOO_LARGE'] = new HttpStatus(431, "REQUEST_HEADER_FIELDS_TOO_LARGE", "Request Header Fields Too Large");
    _instance.values[431] = _instance.enums.REQUEST_HEADER_FIELDS_TOO_LARGE;
    this['REQUEST_HEADER_FIELDS_TOO_LARGE'] = _instance.enums.REQUEST_HEADER_FIELDS_TOO_LARGE;
  
    /**
     * {@code 451 Unavailable For Legal Reasons}.
     * @see <a href="https://tools.ietf.org/html/draft-ietf-httpbis-legally-restricted-status-04">
     *   An HTTP Status Code to Report Legal Obstacles</a>
     */
    _instance.enums['UNAVAILABLE_FOR_LEGAL_REASONS'] = new HttpStatus(451, "UNAVAILABLE_FOR_LEGAL_REASONS", "Unavailable For Legal Reasons");
    _instance.values[451] = _instance.enums.UNAVAILABLE_FOR_LEGAL_REASONS;
    this['UNAVAILABLE_FOR_LEGAL_REASONS'] = _instance.enums.UNAVAILABLE_FOR_LEGAL_REASONS;
  
    // --- 5xx Server Error ---
  
    /**
     * {@code 500 Internal Server Error}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.6.1">HTTP/1.1: Semantics and Content, section 6.6.1</a>
     */
    _instance.enums['INTERNAL_SERVER_ERROR'] = new HttpStatus(500, "INTERNAL_SERVER_ERROR", "Internal Server Error");
    _instance.values[500] = _instance.enums.INTERNAL_SERVER_ERROR;
    this['INTERNAL_SERVER_ERROR'] = _instance.enums.INTERNAL_SERVER_ERROR;
  
    /**
     * {@code 501 Not Implemented}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.6.2">HTTP/1.1: Semantics and Content, section 6.6.2</a>
     */
    _instance.enums['NOT_IMPLEMENTED'] = new HttpStatus(501, "NOT_IMPLEMENTED", "Not Implemented");
    _instance.values[501] = _instance.enums.NOT_IMPLEMENTED;
    this['NOT_IMPLEMENTED'] = _instance.enums.NOT_IMPLEMENTED;
  
    /**
     * {@code 502 Bad Gateway}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.6.3">HTTP/1.1: Semantics and Content, section 6.6.3</a>
     */
    _instance.enums['BAD_GATEWAY'] = new HttpStatus(502, "BAD_GATEWAY", "Bad Gateway");
    _instance.values[502] = _instance.enums.BAD_GATEWAY;
    this['BAD_GATEWAY'] = _instance.enums.BAD_GATEWAY;
  
    /**
     * {@code 503 Service Unavailable}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.6.4">HTTP/1.1: Semantics and Content, section 6.6.4</a>
     */
    _instance.enums['SERVICE_UNAVAILABLE'] = new HttpStatus(503, "SERVICE_UNAVAILABLE", "Service Unavailable");
    _instance.values[503] = _instance.enums.SERVICE_UNAVAILABLE;
    this['SERVICE_UNAVAILABLE'] = _instance.enums.SERVICE_UNAVAILABLE;
  
    /**
     * {@code 504 Gateway Timeout}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.6.5">HTTP/1.1: Semantics and Content, section 6.6.5</a>
     */
    _instance.enums['GATEWAY_TIMEOUT'] = new HttpStatus(504, "GATEWAY_TIMEOUT", "Gateway Timeout");
    _instance.values[504] = _instance.enums.GATEWAY_TIMEOUT;
    this['GATEWAY_TIMEOUT'] = _instance.enums.GATEWAY_TIMEOUT;
  
    /**
     * {@code 505 HTTP Version Not Supported}.
     * @see <a href="http://tools.ietf.org/html/rfc7231#section-6.6.6">HTTP/1.1: Semantics and Content, section 6.6.6</a>
     */
    _instance.enums['HTTP_VERSION_NOT_SUPPORTED'] = new HttpStatus(505, "HTTP_VERSION_NOT_SUPPORTED", "HTTP Version not supported");
    _instance.values[505] = _instance.enums.HTTP_VERSION_NOT_SUPPORTED;
    this['HTTP_VERSION_NOT_SUPPORTED'] = _instance.enums.HTTP_VERSION_NOT_SUPPORTED;
  
    /**
     * {@code 506 Variant Also Negotiates}
     * @see <a href="http://tools.ietf.org/html/rfc2295#section-8.1">Transparent Content Negotiation</a>
     */
    _instance.enums['VARIANT_ALSO_NEGOTIATES'] = new HttpStatus(506, "VARIANT_ALSO_NEGOTIATES", "Variant Also Negotiates");
    _instance.values[506] = _instance.enums.VARIANT_ALSO_NEGOTIATES;
    this['VARIANT_ALSO_NEGOTIATES'] = _instance.enums.VARIANT_ALSO_NEGOTIATES;
  
    /**
     * {@code 507 Insufficient Storage}
     * @see <a href="http://tools.ietf.org/html/rfc4918#section-11.5">WebDAV</a>
     */
    _instance.enums['INSUFFICIENT_STORAGE'] = new HttpStatus(507, "INSUFFICIENT_STORAGE", "Insufficient Storage");
    _instance.values[507] = _instance.enums.INSUFFICIENT_STORAGE;
    this['INSUFFICIENT_STORAGE'] = _instance.enums.INSUFFICIENT_STORAGE;
  
    /**
     * {@code 508 Loop Detected}
     * @see <a href="http://tools.ietf.org/html/rfc5842#section-7.2">WebDAV Binding Extensions</a>
      */
    _instance.enums['LOOP_DETECTED'] = new HttpStatus(508, "LOOP_DETECTED", "Loop Detected");
    _instance.values[508] = _instance.enums.LOOP_DETECTED;
    this['LOOP_DETECTED'] = _instance.enums.LOOP_DETECTED;
  
    /**
     * {@code 509 Bandwidth Limit Exceeded}
      */
    _instance.enums['BANDWIDTH_LIMIT_EXCEEDED'] = new HttpStatus(509, "BANDWIDTH_LIMIT_EXCEEDED", "Bandwidth Limit Exceeded");
    _instance.values[509] = _instance.enums.BANDWIDTH_LIMIT_EXCEEDED;
    this['BANDWIDTH_LIMIT_EXCEEDED'] = _instance.enums.BANDWIDTH_LIMIT_EXCEEDED;
  
    /**
     * {@code 510 Not Extended}
     * @see <a href="http://tools.ietf.org/html/rfc2774#section-7">HTTP Extension Framework</a>
     */
    _instance.enums['NOT_EXTENDED'] = new HttpStatus(510, "NOT_EXTENDED", "Not Extended");
    _instance.values[510] = _instance.enums.NOT_EXTENDED;
    this['NOT_EXTENDED'] = _instance.enums.NOT_EXTENDED;
  
    /**
     * {@code 511 Network Authentication Required}.
     * @see <a href="http://tools.ietf.org/html/rfc6585#section-6">Additional HTTP Status Codes</a>
     */
    _instance.enums['NETWORK_AUTHENTICATION_REQUIRED'] = new HttpStatus(511, "NETWORK_AUTHENTICATION_REQUIRED", "Network Authentication Required");
    _instance.values[511] = _instance.enums.NETWORK_AUTHENTICATION_REQUIRED;
    this['NETWORK_AUTHENTICATION_REQUIRED'] = _instance.enums.NETWORK_AUTHENTICATION_REQUIRED;

    return this;
  }

  /**
   * Internally used during HttpStatus.enum().
   */
  public cfboom.http.HttpStatus function init( required numeric value, required string name, required string reasonPhrase ) {
    _instance['value'] = javaCast("int", arguments.value);
    _instance['name'] = arguments.name;
    _instance['reasonPhrase'] = arguments.reasonPhrase;
    return this;
  }

  /**
   * Return the integer value of this status code.
   */
  public numeric function value() {
    return _instance.value;
  }

  /**
   * Return the value name of this status code.
   */
  public string function name() {
    return _instance.name;
  }

  /**
   * Return the reason phrase of this status code.
   */
  public string function getReasonPhrase() {
    return _instance.reasonPhrase;
  }

  /**
   * Return the enum values.
   */
  public struct function values() {
    return _instance.enums;
  }

  /**
   * Whether this status code is in the HTTP series
   * {@link org.springframework.http.HttpStatus.Series#INFORMATIONAL}.
   * This is a shortcut for checking the value of {@link #series()}.
   */
  public boolean function is1xxInformational() {
    return left(_instance.value, 1) == "1";
  }

  /**
   * Whether this status code is in the HTTP series
   * {@link org.springframework.http.HttpStatus.Series#SUCCESSFUL}.
   * This is a shortcut for checking the value of {@link #series()}.
   */
  public boolean function is2xxSuccessful() {
    return left(_instance.value, 1) == "2";
  }

  /**
   * Whether this status code is in the HTTP series
   * {@link org.springframework.http.HttpStatus.Series#REDIRECTION}.
   * This is a shortcut for checking the value of {@link #series()}.
   */
  public boolean function is3xxRedirection() {
    return left(_instance.value, 1) == "3";
  }

  /**
   * Whether this status code is in the HTTP series
   * {@link org.springframework.http.HttpStatus.Series#CLIENT_ERROR}.
   * This is a shortcut for checking the value of {@link #series()}.
   */
  public boolean function is4xxClientError() {
    return left(_instance.value, 1) == "4";
  }

  /**
   * Whether this status code is in the HTTP series
   * {@link org.springframework.http.HttpStatus.Series#SERVER_ERROR}.
   * This is a shortcut for checking the value of {@link #series()}.
   */
  public boolean function is5xxServerError() {
    return left(_instance.value, 1) == "5";
  }

  /**
   * Return the enum constant of this type with the specified numeric value.
   * @param statusCode the numeric value of the enum to be returned
   * @return the enum constant with the specified numeric value
   * @throws IllegalArgumentException if this enum has no constant for the specified numeric value
   */
  public cfboom.http.HttpStatus function valueOf( required numeric statusCode ) {
    if ( !structKeyExists( _instance.values, arguments.statusCode ) )
      throw( object=createObject( "java", "java.lang.IllegalArgumentException" ).init( "No matching constant for [" & arguments.statusCode & "]" ) );
    return _instance.values[ arguments.statusCode ];
  }

  public string function toString() {
    return "HttpStatus: " & _instance.value & " " & _instance.name;
  }
}
