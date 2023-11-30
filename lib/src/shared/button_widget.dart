// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/shared/loading_widget.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

enum ButtonType {
  primary,
  outlined,
}

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function()? onTap;
  final bool isLoading;
  final Color? color;
  final Widget? prefix;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool _isEnabled;

  const ButtonWidget({
    super.key,
    required this.buttonType,
    required this.text,
    this.isLoading = false,
    this.color,
    this.onTap,
    this.prefix,
    this.height,
    this.padding,
    bool? isEnabled,
  }) : _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.primary({
    super.key,
    required this.text,
    this.isLoading = false,
    this.color,
    this.onTap,
    this.prefix,
    this.height,
    this.padding,
    bool? isEnabled,
  })  : buttonType = ButtonType.primary,
        _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.outlined({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onTap,
    this.color,
    this.prefix,
    this.height,
    this.padding,
    bool? isEnabled,
  })  : buttonType = ButtonType.outlined,
        _isEnabled = isEnabled ?? onTap != null;

  Color getColor() => color != null
      ? color!
      : _isEnabled
          ? buttonType == ButtonType.primary
              ? ColorApp.primary
              : ColorApp.black
          : ColorApp.gray;

  Color getFocusColor() => color != null
      ? color!.withOpacity(.7)
      : buttonType == ButtonType.primary
          ? Palette.color.shade300
          : ColorApp.gray;

  bool get isPrimary => buttonType == ButtonType.primary;
  bool get isOutlined => buttonType == ButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: getColor(),
          border: isOutlined
              ? Border.all(
                  color: ColorApp.white,
                  width: 0.4,
                )
              : null,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Palette.color.shade200,
              blurRadius: 35,
              offset: const Offset(0, 10),
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
        child: InkWell(
          onTap: _isEnabled && !isLoading ? onTap : null,
          borderRadius: BorderRadius.circular(15.r),
          overlayColor: MaterialStateProperty.all(getFocusColor()),
          focusColor: getFocusColor(),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: SizeApp.w28,
                  vertical: SizeApp.h24,
                ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: SizeApp.customHeight(25),
                      width: SizeApp.customHeight(25),
                      child: const LoadingWidget(),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (prefix != null) ...[
                          prefix!,
                          Gap.w8,
                        ],
                        Text(
                          text,
                          style: _isEnabled
                              ? TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  fontWeight: FontWeight.w600,
                                  color: ColorApp.white,
                                )
                              : TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  fontWeight: FontWeight.w600,
                                  color: ColorApp.gray,
                                ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
