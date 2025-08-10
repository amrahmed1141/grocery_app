import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class AppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTitle(
      {super.key,
      this.title,
      this.actions,
      this.leadingIcon,
     this.showLeadingIcon=false, this.onLeadingIconPressed});

  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final bool showLeadingIcon;
  final VoidCallback? onLeadingIconPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: title,
        leading: showLeadingIcon
            ? IconButton(onPressed: onLeadingIconPressed, icon: const Icon(Icons.arrow_back))
            : null,
        actions: actions,
      ),
    );
  }
  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
