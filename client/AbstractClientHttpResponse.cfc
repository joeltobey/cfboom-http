component
  extends="cfboom.http.message.BasicHttpResponse"
  implements="cfboom.http.client.ClientHttpResponse"
  displayname="Abstract Class AbstractClientHttpResponse"
  output="false"
{
  property name="HttpStatus" inject="HttpStatus@cfboomHttp";

  public cfboom.http.client.AbstractClientHttpResponse function init( any result ) {
    super.init( arguments.result );
    return this;
  }

  public cfboom.http.HttpStatus function getStatusCode() {
    return HttpStatus.valueOf( getRawStatusCode() );
  }

  public numeric function getRawStatusCode() {
    if (structKeyExists(_instance,"connection")) {
      _instance.connection.getResponseCode();
    } else {
      return getCode();
    }
  }

  public string function getStatusText() {
    if (structKeyExists(_instance,"connection")) {
      _instance.connection.getResponseMessage();
    } else {
      return getReasonPhrase();
    }
  }

  public void function close() {
    if ( structKeyExists( _instance, "responseStream") ) {
      try {
        local['javaArray'] = createObject("java","java.lang.reflect.Array");
        local['theArray'] = [];
        for ( var i = 1; i <= 4096; i++ ) {
          arrayAppend( local.theArray, "a" );
        }
        local['buffer'] = javaCast("char[]",local.theArray);
        local['bytesRead'] = javaCast("int", -1);
        local['byteCount'] = 0;
        while ((local.bytesRead = _instance.responseStream.read(local.buffer)) != -1) {
          local.byteCount += local.bytesRead;
        }
        _instance.responseStream.close();
      } catch ( java.io.IOException ex ) {
        // ignore
      }
    }
  }

  public any function getBody() {
    if (structKeyExists(_instance,"connection")) {
      getInputStream();
      if ( !structKeyExists( _instance, "responseStream") )
        return "";
      local['out'] = createObject("java","java.lang.StringBuilder").init();
      local['reader'] = createObject("java","java.io.InputStreamReader").init( _instance.responseStream, createObject("java","java.nio.charset.Charset").forName("UTF-8") );
      local['javaArray'] = createObject("java","java.lang.reflect.Array");
      local['theArray'] = [];
      for ( var i = 1; i <= 4096; i++ ) {
        arrayAppend( local.theArray, "a" );
      }
      local['buffer'] = javaCast("char[]",local.theArray);
      local['bytesRead'] = javaCast("int", -1);
      while ((local.bytesRead = local.reader.read(local.buffer)) != -1) {
        local.out.append(local.buffer, javaCast("int", 0), local.bytesRead);
      }
      return local.out.toString();
    } else {
      return getFileContent();
    }
  }

  public any function getInputStream() {
    local['errorStream'] = _instance.connection.getErrorStream();
    _instance['responseStream'] = (structKeyExists(local, "errorStream") ? local.errorStream : _instance.connection.getInputStream());
    return _instance.responseStream;
  }
}
