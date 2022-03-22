import 'dart:math';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MockService {

  static Future<bool> pay() async {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    const path = 'https://kin-analitics.com/api/v1';

    //50% of success and 50% of fail
    final randomValue = Random().nextInt(2);

    try {
      dioAdapter.onGet(
        path,
            (server) =>
            server.reply(
                randomValue == 0 ? 200 : 402, {'message': randomValue == 0 ? 'Success!' : 'Error'}),
      );

      final response = await dio.get(path);
      return response.statusCode == 200;
    }catch(_){
      return false;
    }


  }
}
