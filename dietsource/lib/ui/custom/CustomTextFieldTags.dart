import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomTextFieldTags extends StatefulWidget {
  final TextfieldTagsController textFieldTagsController;
  final Function onDelete;

  const CustomTextFieldTags({
    super.key,
    required this.textFieldTagsController,
    required this.onDelete,
  });

  @override
  State<CustomTextFieldTags> createState() => _CustomTextFieldTagsState();
}

class _CustomTextFieldTagsState extends State<CustomTextFieldTags> {
  CommonComponents commonComponents = CommonComponents();

  List<String>? initialTags = [];

  @override
  void initState() {
    super.initState();
    commonComponents.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      initialTags: initialTags,
      textfieldTagsController: widget.textFieldTagsController,
      textSeparators: const [' ', ','],
      letterCase: LetterCase.normal,
      validator: (String tag) {
        if (Util.showLogs) {
          debugPrint("Selected tag : $tag");
        }
        if (widget.textFieldTagsController.getTags!.contains(tag)) {
          return MyAppLocalization.of(context)!.translate("user_already_added");
        }
        return null;
      },
      inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
        return ((context, scrollController, tags, onTagDelete) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  Dimensions.paddingDefault,
                ),
                child: TextField(
                  controller: tec,
                  focusNode: fn,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(
                      Dimensions.paddingDefault,
                    ),
                    errorText: error,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 137, 92),
                        width: 3.0,
                      ),
                    ),
                    hintText: widget.textFieldTagsController.hasTags
                        ? ""
                        : MyAppLocalization.of(context)!.translate("selected_users"),
                    hintStyle: commonComponents.getHintTextStyle(),
                    isDense: true,
                    prefixIcon: tags.isNotEmpty
                        ? SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: tags.map((String tag) {
                              // tag
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                                  color: ColorResources.grey,
                                ),
                                margin: const EdgeInsets.only(
                                  right: Dimensions.marginExtraSmall,
                                ),
                                padding: const EdgeInsets.all(
                                  Dimensions.paddingDefault,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tag,
                                      style: commonComponents.getRegularTextStyle(),
                                    ),
                                    commonComponents.getHorizontalSpacing(),
                                    InkWell(
                                      child: commonComponents.getSvgImage("ic_cancel"),
                                      onTap: () {
                                        widget.onDelete(tag);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                          )
                        : null,
                  ),
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
