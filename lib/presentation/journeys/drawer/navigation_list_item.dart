import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extension/size_extension.dart';

class NavigationListItem extends StatelessWidget {
  const NavigationListItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            )
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  const NavigationSubListItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            )
          ],
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w.toDouble()),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
