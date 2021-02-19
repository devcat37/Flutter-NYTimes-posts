import 'package:nytimes/data/api/model/multimedia/api_multimedia.dart';
import 'package:nytimes/domain/model/multimedia/multimedia.dart';

class MultimediaMapper {
  static Multimedia fromApi(ApiMultimedia api) {
    return Multimedia(
      url: api.url,
      format: api.format,
      height: api.height.toInt(),
      width: api.width.toInt(),
      type: api.type,
      subtype: api.subtype,
      caption: api.caption,
      copyright: api.copyright,
    );
  }
}
