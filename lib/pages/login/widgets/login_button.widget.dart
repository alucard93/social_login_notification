import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? pathImage;
  final IconData? icon;
  final String? text;
  final void Function()? onPressed;
  final bool isLoading;

  const LoginButton({
    super.key,
    this.pathImage,
    this.icon,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      borderRadius: BorderRadius.circular(55),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(55),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (pathImage != null) Image.asset(pathImage!, height: 25),

                  if (icon != null) Icon(icon!),

                  SizedBox(width: 15),

                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        text!,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
