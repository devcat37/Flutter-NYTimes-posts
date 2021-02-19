import 'package:nytimes/data/api/model/multimedia/api_multimedia.dart';

class ApiArticle {
  final String section;
  final String subsection;
  final String title;
  final String abstract;
  final String url;
  final String uri;
  final String byline;
  final String itemType;
  final String updatedDate;
  final String createdDate;
  final String publishedDate;
  final String materialTypeFacet;
  final String kicker;
  final List<dynamic> desFacet;
  final List<dynamic> orgFacet;
  final List<dynamic> perFacet;
  final List<dynamic> geoFacet;
  final List<dynamic> multimedia;
  final String shortUrl;

  ApiArticle.fromApi(Map<String, dynamic> api)
      : section = api['section'],
        subsection = api['subsection'],
        title = api['title'],
        abstract = api['abstract'],
        url = api['url'],
        uri = api['uri'],
        byline = api['byline'],
        itemType = api['item_type'],
        updatedDate = api['updated_date'],
        createdDate = api['created_date'],
        publishedDate = api['published_date'],
        materialTypeFacet = api['material_type_facet'],
        kicker = api['kicker'],
        desFacet = api['des_facet'],
        orgFacet = api['org_facet'],
        perFacet = api['per_facet'],
        geoFacet = api['geo_facet'],
        multimedia =
            api['multimedia'].map((e) => ApiMultimedia.fromApi(e)).toList(),
        shortUrl = api['short_url'];
}
