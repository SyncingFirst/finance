import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final List<String> list;
  int selectedIndex;
  final Function onTap;

  CustomToggleButton({
    super.key,
    required this.list,
    required this.selectedIndex,
    required this.onTap,
  });

  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  CommonComponents commonComponents = CommonComponents();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: widget.list.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              right: Dimensions.marginExtraSmall,
            ),
            child: InkWell(
              child: Card(
                color: widget.selectedIndex == index ? ColorResources.primary : ColorResources.white,
                elevation: Dimensions.cardElevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.cardRadiusMedium),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(
                    Dimensions.paddingLarge,
                    Dimensions.paddingDefault,
                    Dimensions.paddingLarge,
                    Dimensions.paddingDefault,
                  ),
                  child: Text(
                    widget.list[index],
                    style: widget.selectedIndex == index
                        ? commonComponents.getRegularTextStyleWhite()
                        : commonComponents.getRegularTextStyle(),
                  ),
                ),
              ),
              onTap: () {
                widget.onTap(index);
              },
            ),
          );
        },
      ),
    );
  }
}
