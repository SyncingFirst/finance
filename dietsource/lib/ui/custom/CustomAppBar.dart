import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  bool hasBackIcon;
  bool hasSearchIcon;
  final VoidCallback? onBackTap;
  final VoidCallback? onSearchTap;

  CustomAppBar({
    super.key,
    required this.title,
    required this.hasBackIcon,
    required this.hasSearchIcon,
    required this.onBackTap,
    required this.onSearchTap,
  });

  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  CommonComponents commonComponents = CommonComponents();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(
        top: Dimensions.marginMedium * 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.hasBackIcon
              ? IconButton(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginDefault,
                  ),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: widget.onBackTap ?? () {},
                )
              : Container(),
          Expanded(
            child: Text(
              widget.title,
              style: commonComponents.getMediumTextStyle(),
            ),
          ),
          widget.hasSearchIcon
              ? IconButton(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginDefault,
                  ),
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: widget.onSearchTap ?? () {},
                )
              : Container(),
        ],
      ),
    );

    /*return AppBar(
      leading: widget.hasBackIcon
          ? Container(
              margin: const EdgeInsets.only(
                left: Dimensions.marginLarge,
              ),
              child: commonComponents.getSvgImage("ic_back"),
            )
          : Container(),
      leadingWidth: 100,
      title: widget.title.isNotEmpty
          ? Text(
              widget.title,
              style: commonComponents.getMediumTextStyle(),
            )
          : Container(),
    );*/
  }
}
