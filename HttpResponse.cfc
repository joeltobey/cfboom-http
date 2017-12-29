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
 * After receiving and interpreting a request message, a server responds
 * with an HTTP response message.
 *
 * @cfboom Joel Tobey
 */
interface
  extends="cfboom.http.HttpMessage"
  displayname="Interface HttpResponse"
{
  /**
   * @actualReturnType Integer
   */
  public numeric function getCode();

  public string function getReasonPhrase();

  public any function getRequest();

  public void function setRequest(cfboom.http.HttpRequest req);

  public boolean function isInformational();

  public boolean function isSuccess();

  public boolean function isRedirection();

  public boolean function isClientError();

  public boolean function isServerError();
}
