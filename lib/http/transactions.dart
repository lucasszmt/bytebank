
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print("Request");
    print(data.url);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print("Response");
    print(data.url);
    print(data.headers);
    print(data.body);
    print(data.statusCode);
    return data;
  }
}

void findAll() async {
  Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get("http://192.168.0.40:8080/transactions");
}
