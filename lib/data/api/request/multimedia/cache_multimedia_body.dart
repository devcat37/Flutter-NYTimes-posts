import 'package:nytimes/data/api/request/request_body.dart';
import 'package:nytimes/domain/model/multimedia/multimedia.dart';

class CacheMultimediaBody extends RequestBody {
  final String url;
  final String format;
  final num height;
  final num width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  CacheMultimediaBody.fromModel(Multimedia model)
      : url = model.url,
        format = model.format,
        height = model.height,
        width = model.width,
        type = model.type,
        subtype = model.subtype,
        caption = model.caption,
        copyright = model.copyright;

  @override
  Map<String, dynamic> toApi() {
    return {
      'url': url,
      'format': format,
      'height': height,
      'width': width,
      'type': type,
      'subtype': subtype,
      'caption': caption,
      'copyright': copyright,
    };
  }
}
