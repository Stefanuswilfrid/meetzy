import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meetzy/src/features/common/data/responses/ticket_reponse.dart';

class MyEventResponse extends Equatable {
  final List<TicketResponse> upcomingEvents;
  final List<TicketResponse> pastEvents;

  const MyEventResponse({
    this.upcomingEvents = const [],
    this.pastEvents = const [],
  });

  factory MyEventResponse.fromRawJson(String str) =>
      MyEventResponse.fromJson(json.decode(str));

  factory MyEventResponse.fromJson(Map<String, dynamic> json) =>
      MyEventResponse(
        upcomingEvents: json["upcomingEvents"]
            .map<TicketResponse>((e) => TicketResponse.fromJson(e))
            .toList(),
        pastEvents: json["pastEvents"]
            .map<TicketResponse>((e) => TicketResponse.fromJson(e))
            .toList(),
      );

  @override
  List<Object?> get props => [upcomingEvents, pastEvents];
}
