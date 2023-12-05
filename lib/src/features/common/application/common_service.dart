import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/domain/event.dart';

class CommonService {
  CommonService();

  Future<List<Event>> fetchAllEvents() async {
    try {
      // Reference to the 'events' collection in Firestore
      CollectionReference eventsCollection =
          FirebaseFirestore.instance.collection('events');

      // Get all documents from the 'events' collection
      QuerySnapshot eventsSnapshot = await eventsCollection.get();

      // Map each document to an Event object
      List<Event> events = eventsSnapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        return Event(
          id: document.id,
          userId: 1,
          title: data['title'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          startDatetime: (data['startDatetime'] as Timestamp).toDate(),
          endDatetime: (data['endDatetime'] as Timestamp).toDate(),
          city: data['city'],
          locationDetail: data['locationDetail'],
          ticketPrice: data['ticketPrice'],
          capacity: data['capacity'],
          remainingCapacity: data['remainingCapacity'],
        );
      }).toList();
      return events;
      // state = state.copyWith(home: Home(eventListItems: events));
    } catch (e) {
      // Handle errors (e.g., print the error)
      print('Error fetching events: $e');
      return [];
    }
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  return CommonService();
});
