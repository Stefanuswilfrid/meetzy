import 'package:meetzy/src/features/common/domain/ticket.dart';

class MyEvents {
  final List<Ticket> upcomingEvents;
  final List<Ticket> pastEvents;
  MyEvents({required this.upcomingEvents, required this.pastEvents});
}
