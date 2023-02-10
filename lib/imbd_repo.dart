import 'package:cinema/model.dart';
import 'package:dio/dio.dart';

class ImbdRepo {
  final Dio dio;
  ImbdRepo({required this.dio});

  String apiKey = '7fdd3c30';
  Future<modelCinema> searchCinema({required String name}) async {
    final responce = await dio.get(
      '',
      queryParameters: {
        'apiKey': apiKey,
        't': 'name',
      },
    );
    return modelCinema.fromJson(responce.data);
  }
}
