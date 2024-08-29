import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necuser/model/event_model.dart';
import 'package:necuser/utils.dart';

getHomePageQuery() async {
  try {
    const graphqldocument = '''
             query MyQuery {
                    listevents {
                      items {
                        eventimage
                        eventname
                        eventdetails
                        registerurl
                        date
                        eventlocation 
                      }
                    }
                  }
                    ''';
    final eventrequest = GraphQLRequest<String>(
      document: graphqldocument,
    );
    final response = await Amplify.API.query(request: eventrequest).response;
    safePrint(response.data!);
    final result = handler(
        response: response,
        function: () {
          Map<String, dynamic> deres = json.decode(response.data!);
          List items = deres['listevents']['items'];
          List<Eventmodel> models = [];
          for (int i = 0; i < items.length; i++) {
            Eventmodel model = Eventmodel.fromMap(items[i]);
            models.add(model);
          }
          return models;
        });
    return result;
  } on Exception catch (e) {
    safePrint(e);
  }
}
