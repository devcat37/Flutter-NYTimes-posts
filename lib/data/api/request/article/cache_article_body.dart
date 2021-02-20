import 'package:nytimes/data/api/request/multimedia/cache_multimedia_body.dart';
import 'package:nytimes/data/api/request/request_body.dart';
import 'package:nytimes/domain/model/article/article.dart';

class CacheArticleBody extends RequestBody {
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

  CacheArticleBody.fromModel(Article model)
      : section = model.section,
        subsection = model.subsection,
        title = model.title,
        abstract = model.abstract,
        url = model.url,
        uri = model.uri,
        byline = model.byline,
        itemType = model.itemType,
        updatedDate = model.updatedDate.toIso8601String(),
        createdDate = model.createdDate.toIso8601String(),
        publishedDate = model.publishedDate.toIso8601String(),
        materialTypeFacet = model.materialTypeFacet,
        kicker = model.kicker,
        desFacet = model.desFacet,
        orgFacet = model.orgFacet,
        perFacet = model.perFacet,
        geoFacet = model.geoFacet,
        multimedia = model.multimedia
            .map((e) => CacheMultimediaBody.fromModel(e).toApi())
            .toList(),
        shortUrl = model.shortUrl;

  @override
  Map<String, dynamic> toApi() {
    return {
      'section': section,
      'subsection': subsection,
      'title': title,
      'abstract': abstract,
      'url': url,
      'uri': uri,
      'byline': byline,
      'item_type': itemType,
      'updated_date': updatedDate,
      'created_date': createdDate,
      'published_date': publishedDate,
      'material_type_facet': materialTypeFacet,
      'kicker': kicker,
      'des_facet': desFacet,
      'org_facet': orgFacet,
      'per_facet': perFacet,
      'geo_facet': geoFacet,
      'multimedia': multimedia,
      'short_url': shortUrl,
    };
  }
}
