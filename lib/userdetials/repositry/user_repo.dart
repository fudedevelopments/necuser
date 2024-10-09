import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/utils.dart';

getallUserDataFunction(Student student) async {
  final acreq = ModelQueries.get(
      Ac.classType, AcModelIdentifier(id: student.classRoom!.id));
  final acresponse = await Amplify.API.query(request: acreq).response;
  final hodReq = ModelQueries.get(
    Hod.classType,
    HodModelIdentifier(id: student.classRoom!.id),
  );
  final hodresponse = await Amplify.API.query(request: hodReq).response;
  safePrint(hodresponse);
  safePrint(acresponse);
  List res = graphqlResponseHandle(
      response: [acresponse, hodresponse],
      function: () {
        final hod = hodresponse.data;
        final ac = acresponse.data;
        return [ac, hod];
      });
  return res;
}
