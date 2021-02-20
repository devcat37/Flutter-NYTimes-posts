/// Exception usually thrown while Loading articles from remote API
class LoadArticlesException {
  final String faultString;

  LoadArticlesException(this.faultString);
}
