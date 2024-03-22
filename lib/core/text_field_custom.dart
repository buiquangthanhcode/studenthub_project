import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:studenthub/constants/app_theme.dart';

// Core widget builder for custom TextFormField
class TextFieldFormCustom extends StatefulWidget {
  const TextFieldFormCustom({
    super.key,
    required this.name,
    this.hintText,
    this.icon,
    this.onChange,
    this.onTap,
    this.onSaved,
    this.validator,
    this.maxLines,
    this.initialValue,
    this.focusNode,
    this.textInputType,
    this.textInputAction,
    this.maxLength,
    this.minLines,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.style,
    this.fillColor,
  });

  final String name;
  final String? hintText;
  final Widget? icon;
  final void Function(String?)? onChange;
  final GestureTapCallback? onTap;
  final void Function(String?)? onSaved;
  final String Function(String?)? validator;
  final int? maxLines;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? minLines;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final TextStyle? style;
  final Color? fillColor;

  @override
  State<TextFieldFormCustom> createState() => _TextFieldFormCustomState();
}

class _TextFieldFormCustomState extends State<TextFieldFormCustom> {
  final bool obscureText = false;

  final bool autocorrect = true;

  final bool autofocus = false;

  final TextInputType keyboardType = TextInputType.text;

  final bool readOnly = false;

  final bool enabled = true;

  final bool autovalidate = false;

  final bool showCursor = true;

  final bool enableSuggestions = true;

  final bool maxLengthEnforced = false;

  final bool expands = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: FormBuilderTextField(
        name: widget.name,
        onChanged: widget.onChange,
        onTap: widget.onTap,
        onSaved: widget.onSaved,
        validator: widget.validator,
        maxLines: widget.maxLines,
        obscureText: obscureText,
        autocorrect: autocorrect,
        autofocus: autofocus,
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        keyboardType: widget.textInputType ?? TextInputType.text,
        textInputAction: widget.textInputAction,
        readOnly: readOnly,
        enabled: enabled,
        showCursor: showCursor,
        enableSuggestions: enableSuggestions,
        maxLength: widget.maxLength,
        minLines: widget.minLines,
        expands: expands,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onFieldSubmitted,
        style: widget.style,
        decoration: InputDecoration(
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon ?? const SizedBox(),
            ],
          ),
          hintText: widget.hintText ?? 'Please select a hint',
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.hintColor,
              ),
          contentPadding: const EdgeInsets.all(0),
          fillColor: widget.fillColor ?? const Color.fromARGB(255, 242, 242, 242),
          filled: true,
          isDense: true,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
        ),
      ),
    );
  }
}
