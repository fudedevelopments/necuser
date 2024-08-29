
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

List handler({required GraphQLResponse response, required Function function}) {
  if (response.hasErrors) {
    return [500, null];
  } else {
    return [200, function()];
  }
}

emitterhandler(
    {required List response,
    required VoidCallback successresponsehandle,
    required VoidCallback failureresponsehandle}) {
  if (response[0] == 200) {
    successresponsehandle();
  }
  if (response[0] == 500) {
    failureresponsehandle();
  }
}


Future<String> getimage({required String path}) async {
  final result = await Amplify.Storage.getUrl(
    path: StoragePath.fromString(path),
  ).result;
  final url = result.url;
  final urlstr = url.toString();
  return urlstr;
}

