import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/common/domain/ticket.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/event_detail_controller.dart';
import 'package:meetzy/src/features/common/presentation/home/home_controller.dart';
import 'package:meetzy/src/routes/app_routes.dart';
import 'package:meetzy/src/routes/extras.dart';
import 'package:meetzy/src/shared/button_widget.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class EventDetailButtonSection extends ConsumerWidget {
  const EventDetailButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventDetailControllerProvider);
    final stateHome = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    final detailEvent = state.event!;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.screenHeightPercentage(.2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeApp.w32,
          vertical: SizeApp.h24,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              ColorApp.white,
              ColorApp.white.withOpacity(0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget.primary(
              text: 'BUY TICKET',
              isEnabled: true,
              height: SizeApp.h72,
              onTap: () {
                if (controller.checkUser()) {
                  context.pushNamed(
                    Routes.checkout.name,
                    extra: Extras(
                      datas: {
                        'ticket': Ticket(
                          id: '0',
                          eventId: state.event!.id,
                          userId: stateHome.user!.id,
                          quantity: state.quantity,
                          price: detailEvent.ticketPrice * state.quantity,
                          event: detailEvent,
                        )
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
