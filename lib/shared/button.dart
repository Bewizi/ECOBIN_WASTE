import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton(
    this.text, {
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.showModalBottomSheet,
  });

  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  final void Function()? showModalBottomSheet;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        onLongPress: widget.showModalBottomSheet,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: widget.isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                widget.text,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
      ),
    );
  }
}

// Skip button
class SkipButton extends StatefulWidget {
  const SkipButton(this.text, {super.key, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  State<SkipButton> createState() => _SkipState();
}

class _SkipState extends State<SkipButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.green,
            side: BorderSide(color: Colors.green, width: 2),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// Complete button
class CompleteButton extends StatefulWidget {
  const CompleteButton(this.text, {super.key, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  State<CompleteButton> createState() => _CompleteState();
}

class _CompleteState extends State<CompleteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: widget.onPressed,
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
