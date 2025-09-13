
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleTextField extends ConsumerStatefulWidget {

  final String hintText;
  final int maxLength;
  final double height;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isObscureText;
  final BuildContext? context;
  final Function(String value)? onSubmit;
  final Function(String value)? onChanged;

  const SingleTextField({
    super.key,
    required this.hintText,
    required this.maxLength,
    required this.height,
    required this.controller,
    required this.inputType,
    required this.isObscureText,
    this.context,
    this.onSubmit,
    this.onChanged ,
  });

  @override
  ConsumerState<SingleTextField> createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends ConsumerState<SingleTextField>
{
  //final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late bool _visible;

  @override
  void initState() {
    super.initState();
    _visible = widget.isObscureText;
  }

  @override
  void dispose() {
    super.dispose();
    //_controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    //_visible = widget.isObscureText;

    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: _visible,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(
                  color: Color(0xffBCBCBC),
                  width: 1.0,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(
                  color: Color(0xffBCBCBC),
                  width: 1.0,
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                )
            ),
            hintText: widget.hintText,
            suffixIcon: widget.isObscureText ? IconButton(
              icon: Icon(
                _visible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
            ) : null
        ),
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: widget.inputType,
        maxLines: 1,
        onSubmitted: widget.onSubmit,
        onChanged: widget.onChanged,
      ),
    );
  }
}