import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necuser/models/Student.dart';
import 'package:necuser/utils.dart';

 fetchUserAttributes() async {

    final result = await Amplify.Auth.fetchUserAttributes();

    String name = '';
    String email = '';

    for (final element in result) {
      if (element.userAttributeKey.toString() == 'sub') {
        name = element.value;
      } else if (element.userAttributeKey.toString() == 'email') {
        email = element.value;
      }
    }
    if (name != '' && email != '') {
    final studentRequest = ModelQueries.list<Student>(
    Student.classType,
    where: Student.EMAIL.eq(email),
  );
  final studentResponse =
      await Amplify.API.query(request: studentRequest).response;

  List res = graphqlResponseHandle(
      response: [studentResponse],
      function: () {
        Student? studentdata;
        final student = studentResponse.data?.items.first;
        if (student != null) {
          studentdata = student;
        }
        return studentdata;
      });
    return res;
    }
    
}
