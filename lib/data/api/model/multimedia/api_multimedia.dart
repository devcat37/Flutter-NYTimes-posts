class ApiMultimedia {
  final String url;
  final String format;
  final num height;
  final num width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  ApiMultimedia.fromApi(Map<String, dynamic> api)
      : url = api['url'],
        format = api['format'],
        height = num.parse(api['height'].toString()),
        width = num.parse(api['width'].toString()),
        type = api['type'],
        subtype = api['subtype'],
        caption = api['caption'],
        copyright = api['copyright'];
}
