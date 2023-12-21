import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/domain/ticket.dart';
import 'package:meetzy/src/features/common/presentation/ticket_detail/ticket_detail_state.dart';

class TicketDetailController extends StateNotifier<TicketDetailState> {
  TicketDetailController() : super(TicketDetailState());

  void setTicket(Ticket ticket) {
    state = state.copyWith(
      ticket: ticket,
      ticketValue: AsyncData(ticket),
    );
  }
}

final ticketDetailControllerProvider =
    StateNotifierProvider<TicketDetailController, TicketDetailState>((ref) {
  return TicketDetailController();
});
