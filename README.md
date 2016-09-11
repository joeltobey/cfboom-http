[![Build Status](https://api.travis-ci.org/joeltobey/cfboom-http.svg?branch=development)](https://travis-ci.org/joeltobey/cfboom-http)

# WELCOME TO THE CFBOOM HTTP COLDBOX MODULE
A ColdBox Module with a sweet HTTP service.

##LICENSE
Apache License, Version 2.0.

##IMPORTANT LINKS
- https://github.com/joeltobey/cfboom-http/wiki

##SYSTEM REQUIREMENTS
- Lucee 4.5+
- ColdFusion 9+

# INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cfboom-http`

## WireBox Mappings
The module registers the BasicHttpClient: `BasicHttpClient@cfboomHttp` that executes all of your HTTP requests. Check out the API Docs for all the possible functions.

## Settings
You must set the admin password in your `ColdBox.cfc` file under a `cfboomHttp` struct:

```js
cfboomHttp = {
    /**
     * The HttpRequestExecutor used by the BasicHttpClient by default.
     * It must implement cfboom.http.protocol.HttpRequestExecutor.
     * The default is [cfboom.http.protocol.BasicHttpRequestExecutor]
     */
    httpRequestExecutor = "cfboom.http.protocol.HttpRequestExecutor"
};
```
