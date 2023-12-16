import 'dart:convert';

import 'package:meetzy/src/features/common/data/responses/ticket_reponse.dart';
import 'package:meetzy/src/features/common/domain/event.dart';

class Ticket {
  final String id;
  final String eventId;
  final String userId;
  final int quantity;
  final int price;
  final Event? event;

  Ticket({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.quantity,
    required this.price,
    this.event,
  });

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as String,
      eventId: map['eventId'] as String,
      userId: map['userId'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      event: map['event'] as Event,
    );
  }

  factory Ticket.fromJson(String source) =>
      Ticket.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Ticket.fromResponse(TicketResponse response) {
    return Ticket(
      id: response.id ?? "",
      eventId: response.eventId ?? "",
      userId: response.userId ?? "",
      quantity: response.quantity ?? 0,
      price: response.price ?? 0,
      event:
          response.event == null ? null : Event.fromResponse(response.event!),
    );
  }
}
