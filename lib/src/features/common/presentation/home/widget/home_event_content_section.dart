import 'package:flutter/material.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/features/common/presentation/home/widget/event_card_widget.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
// import 'package:setiket/src/features/common/presentation/home/widget/event_card_widget.dart';
// import 'package:setiket/src/features/domain.dart';
// import 'package:setiket/src/shared/extensions/extensions.dart';

class HomeEventContentSection extends StatelessWidget {
  // final List<Event>? eventList;
  const HomeEventContentSection({
    super.key,
    // required this.eventList,
  });

  @override
  Widget build(BuildContext context) {
    final List<Event> eventList = [
      Event(
        id: 1,
        userId: 1,
        title: 'Sample Event 1',
        description: 'Description for Sample Event 1',
        imageUrl:
            'https://images.unsplash.com/photo-1522778119026-d647f0596c20?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        startDatetime: DateTime.now(),
        endDatetime: DateTime.now().add(Duration(days: 1)),
        city: CityEvent.other,
        locationDetail: 'Sample Location 1',
        ticketPrice: 10,
        capacity: 100,
        remainingCapacity: 50,
      ),
      Event(
        id: 2,
        userId: 1,
        title: 'Sample Event 2',
        description: 'Description for Sample Event 2',
        imageUrl:
            'https://images.unsplash.com/photo-1570498839593-e565b39455fc?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        startDatetime: DateTime.now().add(Duration(days: 2)),
        endDatetime: DateTime.now().add(Duration(days: 3)),
        city: CityEvent.other,
        locationDetail: 'Sample Location 2',
        ticketPrice: 15,
        capacity: 150,
        remainingCapacity: 75,
      ),
      // Add more sample events as needed
    ];

    return Container(
      padding: const EdgeInsets.only(left: 28),
      height: context.screenHeightPercentage(0.4),
      child: ListView.builder(
        itemCount: eventList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final event = eventList[index];
          return EventCardWidget(event: event);
        },
      ),
    );
  }
}
