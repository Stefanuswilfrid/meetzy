import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/widget/button_quantity_widget.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final int maxQuantity;
  final Function(int) onMin;
  final Function(int) onPlus;
  const QuantityWidget({
    super.key,
    required this.onMin,
    required this.onPlus,
    this.quantity = 1,
    this.maxQuantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonQuantityWidget(
            onTap: () {
              if (quantity > 1) onMin(quantity - 1);
            },
            child: SvgPicture.asset('assets/icons/ic_min.svg')),
        Gap.w20,
        Text('$quantity',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w600,
              color: ColorApp.black,
            )),
        Gap.w20,
        ButtonQuantityWidget(
          onTap: () {
            if (quantity < maxQuantity) onPlus(quantity + 1);
          },
          child: SvgPicture.asset('assets/icons/ic_plus.svg'),
        ),
      ],
    );
  }
}
