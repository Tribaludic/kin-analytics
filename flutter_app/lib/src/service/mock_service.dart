import 'dart:math';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MockService {

  static Future<bool> pay() async {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    const path = 'https://kin-analitics.com/api/v1';

    try {
      dioAdapter.onGet(
        path,
            (server) =>
            server.reply(
                Random().nextInt(2) == 0 ? 200 : 402, {'message': 'Success!'}),
      );

      final response = await dio.get(path);
      return response.statusCode == 200;
    }catch(_){
      return false;
    }


  }
}
