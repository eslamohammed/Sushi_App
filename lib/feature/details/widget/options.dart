import 'package:flutter/material.dart';

import '../../../core/utils/color_manger.dart';
import '../../../core/utils/style_manager.dart';

class OptionsList extends StatefulWidget {
  final Map<String, bool> selectedOptions;
  const OptionsList({super.key, required this.selectedOptions});

  @override
  _OptionsListState createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          widget.selectedOptions.keys.map((optionName) {
            return CheckboxListTile(
              title: Text(
                optionName,
                style: headlineNew3.copyWith(
                  color: ColorManager.white,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Add extra ${optionName.toLowerCase()}',
                style: hintline.copyWith(
                  color: ColorManager.grey,
                  fontSize: 14,
                ),
              ),
              value: widget.selectedOptions[optionName],
              onChanged: (bool? newValue) {
                setState(() {
                  widget.selectedOptions[optionName] = newValue!;
                });
              },
              checkColor: Colors.white,
              activeColor: ColorManager.primary,
              selectedTileColor: Colors.grey[900],
            );
          }).toList(),
    );
  }
}
