/// Abstract class for all the [RequestBody]'es
/// which will convert model to api
abstract class RequestBody {
  Map<String, dynamic> toApi();
}
