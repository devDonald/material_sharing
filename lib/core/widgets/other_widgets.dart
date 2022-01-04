import 'package:flutter/material.dart';
import 'package:material_sharing/core/themes/theme_colors.dart';

class FilesDropDownButton extends StatelessWidget {
  const FilesDropDownButton({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.items,
    required this.value,
    this.isBorder,
  }) : super(key: key);
  final Widget hint;
  final Function(String?) onChanged;
  final List<String> items;
  final String value;
  final bool? isBorder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: hint,
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 25.0,
      elevation: 0,
      style: const TextStyle(color: Colors.black, fontSize: 20),
      decoration: InputDecoration(
        border: (isBorder != null)
            ? (isBorder!)
                ? const OutlineInputBorder()
                : const OutlineInputBorder(borderSide: BorderSide.none)
            : const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DeleteEditPopUp extends StatelessWidget {
  const DeleteEditPopUp({
    Key? key,
    required this.delete,
    required this.edit,
    this.isEditable = false,
    this.isOwner = false,
  }) : super(key: key);
  final Function() delete;
  final Function() edit;
  final bool isEditable, isOwner;
  @override
  Widget build(BuildContext context) {
    return (isOwner)
        ? PopupMenuButton(
            itemBuilder: (context) {
              var list = <PopupMenuEntry<Object>>[];
              list.add(
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 17,
                        color: JanguAskColors.primaryGreyColor,
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: delete,
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            color: JanguAskColors.brownishGrey,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  value: 1,
                ),
              );
              (isEditable)
                  ? list.add(
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 17,
                              color: JanguAskColors.primaryGreyColor,
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: edit,
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  color: JanguAskColors.brownishGrey,
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        value: 1,
                      ),
                    )
                  : Container();

              return list;
            },
            icon: Icon(
              Icons.more_horiz,
              size: 20,
              color: JanguAskColors.primaryGreyColor,
            ),
          )
        : Container();
  }
}
