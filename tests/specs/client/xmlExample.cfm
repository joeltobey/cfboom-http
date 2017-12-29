<cfscript>
  sb = createObject( "java", "java.lang.StringBuilder" ).init();
  sb.append('<?xml version="1.0" encoding="UTF-8"?>')
    .append('<note>')
    .append('<to>Tove</to>')
    .append('<from>Jani</from>')
    .append('<heading>Reminder</heading>')
    .append("<body>Don't forget me this weekend!</body>")
    .append("</note>");

  getPageContext().getHttpServletResponse().setContentType( "application/xml" );
  getPageContext().clear();
  getPageContext().write( sb.toString() );
</cfscript>