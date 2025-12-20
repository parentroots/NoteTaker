import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../text/app_text.dart';


class AppButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color? borderColor;
  final double borderWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final bool isLoading;

  const AppButton({
    this.onTap,
    required this.titleText,
    this.titleColor = AppColors.blackColor,
    this.buttonColor = AppColors.primaryColor,
    this.titleSize = 24,
    this.buttonRadius = 8,
    this.titleWeight = FontWeight.w600,
    this.buttonHeight = 48,
    this.borderWidth = 1,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.borderColor = AppColors.primaryColor,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
    AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.15,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      width: widget.buttonWidth,
      child: _buildElevatedButton(),
    );
  }

  Widget _buildElevatedButton() {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: (1 - _animationController.value).toDouble(),
        child: Container(
          height: widget.buttonHeight,
          width: widget.buttonWidth,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(widget.buttonRadius),
            border: Border.all(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth,
            ),
          ),
          child: Center(
            child: widget.isLoading
                ? CircularProgressIndicator(color: widget.titleColor)
                : _buildText(),
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(widget.buttonColor),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.buttonRadius),
          side: BorderSide(
            color: widget.borderColor ?? Colors.blue,
            width: widget.borderWidth,
          ),
        ),
      ),
      elevation: WidgetStateProperty.all(0),
    );
  }

  Widget _buildLoader() {
    return CircularProgressIndicator();
  }

  Widget _buildText() {
    return AppText(
      text: widget.titleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      fontSize: widget.titleSize,
      color: widget.titleColor,
      fontWeight: widget.titleWeight,
    );
  }

  _onTapDown(TapDownDetails details) {
    if (widget.onTap == null) return;
    _animationController.forward();
  }

  _onTapUp(TapUpDetails details) {
    if (widget.onTap == null) return;
    _animationController.reverse();
  }

  _onTapCancel() {
    if (widget.onTap == null) return;
    _animationController.reverse();
  }
}