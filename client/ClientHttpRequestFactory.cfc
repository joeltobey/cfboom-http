/**
 * Factory for {@link ClientHttpRequest} objects.
 * Requests are created by the {@link #createRequest(URI, HttpMethod)} method.
 *
 * @author Arjen Poutsma
 * @since 3.0
 */
interface
  displayname="Interface ClientHttpRequestFactory"
{
  /**
   * Create a new {@link ClientHttpRequest} for the specified URI and HTTP method.
   * <p>The returned request can be written to, and then executed by calling
   * {@link ClientHttpRequest#execute()}.
   * @param uri the URI to create a request for
   * @param httpMethod the HTTP method to execute
   * @return the created request
   * @throws IOException in case of I/O errors
   */
  public cfboom.http.client.ClientHttpRequest function createRequest( required any uri, cfboom.http.HttpMethod httpMethod );
}
