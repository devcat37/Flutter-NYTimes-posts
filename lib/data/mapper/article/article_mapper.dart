import 'package:nytimes/data/api/model/article/api_article.dart';
import 'package:nytimes/data/mapper/multimedia/multimedia_mapper.dart';
import 'package:nytimes/domain/model/article/article.dart';

class ArticleMapper {
  /// Converts [ApiArticle] to [Article] for further exploitation
  /// as appropriate model
  static Article fromApi(ApiArticle api) {
    return Article(
      section: api.section,
      subsection: api.subsection,
      title: api.title,
      abstract: api.abstract,
      url: api.url,
      uri: api.uri,
      byline: api.byline,
      itemType: api.itemType,
      updatedDate: DateTime.tryParse(api.updatedDate),
      createdDate: DateTime.tryParse(api.createdDate),
      publishedDate: DateTime.tryParse(api.publishedDate),
      materialTypeFacet: api.materialTypeFacet,
      kicker: api.kicker,
      desFacet: api.desFacet.map((e) => e as String).toList(),
      orgFacet: api.orgFacet.map((e) => e as String).toList(),
      perFacet: api.perFacet.map((e) => e as String).toList(),
      geoFacet: api.geoFacet.map((e) => e as String).toList(),
      multimedia:
          api.multimedia.map((e) => MultimediaMapper.fromApi(e)).toList(),
      shortUrl: api.shortUrl,
    );
  }
}
