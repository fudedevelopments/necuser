
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

void showsnakbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

navigationpush(BuildContext context, Widget route) {
  Navigator.push(context, (MaterialPageRoute(builder: (context) => route)));
}

pop(BuildContext context) {
  Navigator.pop(context);
}

List graphqlresponsehandle(
    {required GraphQLResponse response, required Function function}) {
  if (response.hasErrors) {
    String error = response.errors[0].message;
    return [500, error];
  } else {
    return [200, function()];
  }
}

handlebloc(
    {required int statuscode,
    required VoidCallback success,
    required VoidCallback failure}) {
  if (statuscode == 200) {
    success();
  }
  if (statuscode == 500) {
    failure();
  }
}

navigatorpushandremove(BuildContext context, Widget route) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => route), (route) => false);
}

Future<String> getimage({required String path}) async {
  final result = await Amplify.Storage.getUrl(
    path: StoragePath.fromString(path),
  ).result;
  final url = result.url;
  final urlstr = url.toString();
  return urlstr;
}

