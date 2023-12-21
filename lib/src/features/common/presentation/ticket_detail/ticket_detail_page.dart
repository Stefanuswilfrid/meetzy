import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/common_widgets/async_value/async_value_widget.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/features/common/domain/ticket.dart';
import 'package:meetzy/src/features/common/presentation/ticket_detail/ticket_detail_controller.dart';
import 'package:meetzy/src/features/common/presentation/ticket_detail/ticket_detail_state.dart';
import 'package:meetzy/src/features/common/presentation/ticket_detail/widget/ticket_detail_content_section.dart';

class TicketDetail extends ConsumerStatefulWidget {
  final Ticket ticket;
  const TicketDetail({
    super.key,
    required this.ticket,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketDetailState();
}

class _TicketDetailState extends ConsumerState<TicketDetail> {
  TicketDetailController get controller =>
      ref.read(ticketDetailControllerProvider.notifier);
  TicketDetailState get state => ref.watch(ticketDetailControllerProvider);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setTicket(widget.ticket);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        body: AsyncValueWidget(
          value: state.ticketValue,
          data: (data) {
            return const SingleChildScrollView(
                child: TicketDetailContentSection());
          },
        ),
      ),
    );
  }
}
