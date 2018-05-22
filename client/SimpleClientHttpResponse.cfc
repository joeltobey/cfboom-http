/**
 * {@link ClientHttpResponse} implementation that uses standard JDK facilities.
 * Obtained via {@link SimpleBufferingClientHttpRequest#execute()} and
 * {@link SimpleStreamingClientHttpRequest#execute()}.
 *
 * @author Arjen Poutsma
 * @author Brian Clozel
 * @since 3.0
 */
component
  extends="cfboom.http.client.AbstractClientHttpResponse"
  displayname="Class SimpleClientHttpResponse"
  output="false"
{
  public cfboom.http.client.SimpleClientHttpResponse function init( any result ) {
    if (isInstanceOf(arguments.result, "java.net.HttpURLConnection")) {
      _instance['connection'] = arguments.result;
    } else {
      super.init( arguments.result );
    }
    return this;
  }
}
