import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_common/vm.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/utils.dart';

addondutyRequestFunction(
    {required Student student,
    required String requestname,
    required String description,
    required String date,
    required String location,
    required String registerurl,
    required List<File> documents}) async {
  List<String> documentsresult = await uploadFile(documents);
  final ondutyrequest = Ondutyrequest(
      student: student,
      ondutyname: requestname,
      description: description,
      date: date,
      location: location,
      registerUrl: registerurl,
      documets: documentsresult);
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

getStudentUsingAttributeFunction(String email) async {
  Student? studentdata;
  List<Ondutyrequest> ondutydata = [];
  final studentRequest = ModelQueries.list<Student>(
    Student.classType,
    where: Student.EMAIL.eq(email),
  );
  final studentResponse =
      await Amplify.API.query(request: studentRequest).response;
  final student = studentResponse.data?.items.first;
  if (student != null) {
    studentdata = student;
    final ondutyRequest = ModelQueries.list<Ondutyrequest>(
      Ondutyrequest.classType,
      where: Ondutyrequest.STUDENT.eq(studentdata.id),
    );
    final ondutyResponse =
        await Amplify.API.query(request: ondutyRequest).response;
    final ondutyList = ondutyResponse.data?.items ?? [];
    for (int i = 0; i < ondutyList.length; i++) {
      ondutydata.add(ondutyList[i]!);
    }
  }
  List res = graphqlResponseHandle(
      response: [studentResponse],
      function: () {
        return [studentdata, ondutydata];
      });
  return res;
}
