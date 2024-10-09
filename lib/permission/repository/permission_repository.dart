import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_common/vm.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/utils.dart';

addondutyRequestFunction({
  required Student student,
  required String requestname,
  required String description,
  required String date,
  required String location,
  required String registerurl,
  required List<File> documents,
  required ClassRoom classRoom,
  required Proctor proctor,
}) async {
  List<String> documentsresult = await uploadFile(documents);
  final ondutyrequest = Ondutyrequest(
      student: student,
      ondutyname: requestname,
      description: description,
      date: date,
      location: location,
      registerUrl: registerurl,
      documets: documentsresult,
      proctor: proctor,
      classRoom: classRoom);
  final request = ModelMutations.create(ondutyrequest);
  final response = await Amplify.API.mutate(request: request).response;
  List res = graphqlResponseHandle(
      response: [response],
      function: () {
        return null;
      });
  return res;
}

uploadFile(List<File> documents) async {
  List<String> imageslist = [];
  for (int i = 0; i < documents.length; i++) {
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFilePlatform.fromFile(documents[i]),
      path: StoragePath.fromString('Permission-documents/${uuid()}'),
    ).result;
    imageslist.add(result.uploadedItem.path);
  }
  return imageslist;
}

getStudentOndutyFunction(Student student) async {
  final ondutyRequest = ModelQueries.list<Ondutyrequest>(
    Ondutyrequest.classType,
    where: Ondutyrequest.STUDENT.eq(student.id),
  );
  final ondutyResponse =
      await Amplify.API.query(request: ondutyRequest).response;
  List res = graphqlResponseHandle(
      response: [ondutyResponse],
      function: () {
        List<Ondutyrequest> ondutydata = [];
        final ondutyList = ondutyResponse.data?.items;
        if (ondutyList != null) {
          for (int i = 0; i < ondutyList.length; i++) {
            ondutydata.add(ondutyList[i]!);
          }
        }
        return ondutydata;
      });
  return res;
}

deleteOnDutyRequestFunction(Ondutyrequest ondutyRequest) async {
  final request = ModelMutations.delete(ondutyRequest);
  final bool removefile = await removefiles(ondutyRequest.documets!);
  if (removefile == false) {
    return [500, null];
  }
  else{
    final response = await Amplify.API.mutate(request: request).response;
    List res = graphqlResponseHandle(
        response: [response],
        function: () {
          return null;
        });
    return res;
  }
}

removefiles(List<String> filelist) async {
  try {
    final List<StoragePath> paths =
        filelist.map((file) => StoragePath.fromString(file)).toList();
    // ignore: unused_local_variable
    final result = await Amplify.Storage.removeMany(
      paths: paths,
    ).result;
    return true;
  } on StorageException catch (e) {
    safePrint(e.message);
    return false;
  }
}

