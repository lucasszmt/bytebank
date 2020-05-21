import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

///Interceptador de requisições http, ver o pacote http_interceptor
class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
//    print("Request");
//    print(data.url);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
//    print("Response");
//    print(data.url);
//    print(data.headers);
//    print(data.body);
//    print(data.statusCode);
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get("http://192.168.0.40:8080/transactions");
  List<Transaction> transactions = List();
  List<dynamic> decodedJson = jsonDecode(response.body);
  for (Map<String, dynamic> element in decodedJson) {
    final Map<String, dynamic> contactJson = element['contact'];
    final Transaction transaction = Transaction(
      element['value'],
      contactJson['accountNumber']
    );
    transactions.add(transaction);
  }
  return transactions;
}
