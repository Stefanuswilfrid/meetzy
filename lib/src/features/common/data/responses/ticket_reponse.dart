import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';

class TicketResponse extends Equatable {
  final String? id;
  final String? eventId;
  final String? userId;
  final int? quantity;
  final int? price;
  final DateTime? createdAt;
  final EventResponse? event;

  const TicketResponse({
    this.id,
    this.eventId,
    this.userId,
    this.quantity,
    this.price,
    this.createdAt,
    this.event,
  });

  factory TicketResponse.fromRawJson(String str) =>
      TicketResponse.fromJson(json.decode(str));

  factory TicketResponse.fromJson(Map<String, dynamic> json) => TicketResponse(
        id: json["id"],
        eventId: json["eventId"],
        userId: json["userId"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        event: json["event"] == null
            ? null
            : EventResponse.fromJson(json["event"]),
      );

  @override
  List<Object?> get props =>
      [id, eventId, userId, quantity, price, createdAt, event];
}
