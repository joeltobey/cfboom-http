<cfscript>
  sb = createObject( "java", "java.lang.StringBuilder" ).init();
  sb.append("{")
    .append('"userId":1,')
    .append('"id":1,')
    .append('"title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit",')
    .append('"body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"')
    .append("}");

  getPageContext().getHttpServletResponse().setContentType( "application/json" );
  getPageContext().clear();
  getPageContext().write( sb.toString() );
</cfscript>