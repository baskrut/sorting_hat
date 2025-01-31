import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/models/app_base_response.dart';
import 'package:sorting_hat/receivers/dialog_receiver.dart';

enum RequestType {
  get,
  patch,
  post,
  put,
  delete,
}

class ApiRequester {
  ApiRequester._privateConstructor();

  static final ApiRequester instance = ApiRequester._privateConstructor();

  Future<AppBaseResponse> handleRequest({
    required RequestType type,
    required String url,
    Map<String, dynamic>? body,
  }) async {
    const Map<String, String> header = tokenLesHeaders;

    log('~~\n\nrequest $url, type: $type,\nrequest body: ${body ?? ''}');

    final Response response;
    switch (type) {
      case RequestType.get:
        response = await get(
          Uri.parse(url),
          headers: header,
        ).onError((e, stackTrace) {
          log(e.runtimeType.toString());
          return Response('', httpError);
        }).timeout(const Duration(seconds: httpTimeOut), onTimeout: () async {
          log('onTimeout');
          return Response('', httpConnectionError);
        });
        break;
      case RequestType.post:
        response = await post(
          Uri.parse(url),
          headers: header,
          body: body != null ? json.encode(body) : '',
        ).onError((e, stackTrace) {
          log(e.runtimeType.toString());
          return Response('', httpError);
        }).timeout(const Duration(seconds: httpTimeOut), onTimeout: () async {
          log('onTimeout');
          return Response('', httpConnectionError);
        });
        break;
      case RequestType.patch:
        response = await patch(
          Uri.parse(url),
          headers: header,
          body: body != null ? json.encode(body) : '',
        ).onError((e, stackTrace) {
          log(e.runtimeType.toString());
          return Response('', httpError);
        }).timeout(const Duration(seconds: httpTimeOut), onTimeout: () async {
          log('onTimeout');
          return Response('', httpConnectionError);
        });
        break;
      case RequestType.put:
        response = await put(
          Uri.parse(url),
          headers: header,
          body: body != null ? json.encode(body) : '',
        ).onError((e, stackTrace) {
          log(e.runtimeType.toString());
          return Response('', httpError);
        }).timeout(const Duration(seconds: httpTimeOut), onTimeout: () async {
          log('onTimeout');
          return Response('', httpConnectionError);
        });
        break;
      case RequestType.delete:
        response = await delete(
          Uri.parse(url),
          headers: header,
          body: body != null ? json.encode(body) : '',
        ).onError((e, stackTrace) {
          return Response('', httpError);
        }).timeout(const Duration(seconds: httpTimeOut), onTimeout: () async {
          log('onTimeout');
          return Response('', httpConnectionError);
        });
        break;
    }

    log('statusCode ${response.statusCode}\nresponse body\n ${response.body.isEmpty ? 'empty' : response.body}\n');

    if (response.statusCode == 200 || response.statusCode == 204 || response.statusCode == 201) {
      return AppBaseResponse(body: response.body, isSuccess: true);
    } else if (response.statusCode == 401) {
//place for future auth issues handling
      return AppBaseResponse(isSuccess: false);
    } else if (response.statusCode == 599) {
      dialogReceiver.add(const DialogEvent());
      return AppBaseResponse(isSuccess: false);
    } else if (response.statusCode == 422) {
      //422 most common response with error params
      return AppBaseResponse(
        errorText: json.decode(response.body)?['message'] ?? 'something went wrong',
        isSuccess: false,
      );
    } else {
      //'message' most common field with error description
      return AppBaseResponse(
          errorText: json.decode(response.body)?['message'] ?? 'something went wrong', isSuccess: false);
    }
  }
}
