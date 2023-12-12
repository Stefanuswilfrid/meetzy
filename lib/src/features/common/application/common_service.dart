import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/data/common_repository.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/features/common/domain/home.dart';
import 'package:meetzy/src/services/remote/result.dart';

class CommonService {
  final CommonRepository _commonRepository;

  CommonService(this._commonRepository);

  Future<Result<List<EventResponse>>> fetchAllEvents() async {
    final resultEvents = await _commonRepository.fetchEvents();
    // Reference to the 'events' collection in Firestore
    // CollectionReference eventsCollection =
    //     FirebaseFirestore.instance.collection('events');

    // // Get all documents from the 'events' collection
    // QuerySnapshot eventsSnapshot = await eventsCollection.get();

    // // Map each document to an Event object
    // List<Event> events = eventsSnapshot.docs.map((DocumentSnapshot document) {
    //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //   return Event(
    //     id: document.id,
    //     userId: 1,
    //     title: data['title'],
    //     description: data['description'],
    //     imageUrl: data['imageUrl'],
    //     startDatetime: (data['startDatetime'] as Timestamp).toDate(),
    //     endDatetime: (data['endDatetime'] as Timestamp).toDate(),
    //     city: data['city'],
    //     locationDetail: data['locationDetail'],
    //     ticketPrice: data['ticketPrice'],
    //     capacity: data['capacity'],
    //     remainingCapacity: data['remainingCapacity'],
    //   );
    // }).toList();
    // return events;
    return resultEvents;
    // state = state.copyWith(home: Home(eventListItems: events));
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);

  return CommonService(commonRepository);
});
