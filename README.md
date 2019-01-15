[![Build Status](https://api.travis-ci.org/joeltobey/cfboom-http.svg?branch=development)](https://travis-ci.org/joeltobey/cfboom-http)

# WELCOME TO THE CFBOOM HTTP COLDBOX MODULE
The cfboom-http module provides solid, consistent HTTP request and response handling.

##LICENSE
Apache License, Version 2.0.

##IMPORTANT LINKS
- https://github.com/joeltobey/cfboom-http/wiki

##SYSTEM REQUIREMENTS
- Lucee 4.5+
- ColdFusion 9+

# INSTRUCTIONS
Ensure `cfboom` is already installed and use CommandBox to install

`box install cfboom-http`

## WireBox Mappings
The module registers the BasicHttpClient: `BasicHttpClient@cfboom-http` that executes all of your HTTP requests. Check out the API Docs for all the possible functions.

## Settings
There's an optional setting in your `ColdBox.cfc` file under a `cfboom-http` struct of `moduleSettings` to override the default `HttpRequestExecutor`:

```js
moduleSettings = {
  "cfboom-http" = {
    /**
     * The HttpRequestExecutor used by the BasicHttpClient by default.
     * It must implement cfboom.http.protocol.HttpRequestExecutor.
     * The default is [cfboom.http.protocol.BasicHttpRequestExecutor]
     */
    httpRequestExecutor = "cfboom.http.protocol.HttpRequestExecutor"
  }
};
```

## HttpClient Methods

Once you have an instance of the `HttpClient`, you can call these methods:

```
#getInstance( "BasicHttpClient@cfboom-http" ).get( string uri )#
#getInstance( "BasicHttpClient@cfboom-http" ).execute( cfboom.http.HttpRequest req )#
#getInstance( "BasicHttpClient@cfboom-http" ).setExecutor( cfboom.http.protocol.HttpRequestExecutor executor )#
```

## HttpRequest Methods

```
var req = new cfboom.http.message.BasicHttpRequest("PUT", "https://api.foo.com");
req.addQueryParam("id", 123); // Same as ?id=123
req.addFormField("submit", "true");
req.addBody('{"data":"foo"}'); // Set the request body/payload (i.e. JSON, XML, Text, etc)
req.addHeader("Content-Type", "application/json");
```

## RequestParam Methods

You can build your own request parameter with the `RequestParam`.

```
var rp = new cfboom.http.RequestParam( "myFile" );
rp.setFile( expandPath("path/to/file.txt") );
var req = new cfboom.http.message.BasicHttpRequest("POST", "https://api.foo.com");
req.addParam( rp );
```
