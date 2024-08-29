// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:necuser/common/display_image.dart';
import 'package:necuser/model/event_model.dart';
import 'package:necuser/utils.dart';


class EventListScreen extends StatelessWidget {
  final List<Eventmodel> eventmodels;
  EventListScreen({
    super.key,
    required this.eventmodels,
  });

   final List<Map<String, String>> announcements = [
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'Announcement 1',
      'date': '2024-08-15',
      'details': 'Details about announcement 1',
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'Announcement 2',
      'date': '2024-08-16',
      'details': 'Details about announcement 2',
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'Announcement 3',
      'date': '2024-08-17',
      'details': 'Details about announcement 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: eventmodels.length,
      itemBuilder: (context, index) {
        final event = eventmodels[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade50, Colors.blue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: ImageDisplay(imageUrlFuture: getimage(path: event.eventimage[0])),
                  // Image.network(
                  //   announcements[0]['image']!,
                  //   height: 100,
                  //   width: 100,
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventname,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              color: Colors.blueAccent, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            event.date,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.blueAccent, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            event.eventlocation,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
