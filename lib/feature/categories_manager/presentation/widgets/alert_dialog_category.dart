import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_expenses/core/constants/enum_color.dart';
import 'package:personal_expenses/core/constants/enum_icons_category.dart';

class AlertDialogCategory extends StatefulWidget {
  const AlertDialogCategory({super.key});

  @override
  State<AlertDialogCategory> createState() => _AlertDialogCategoryState();
}

class _AlertDialogCategoryState extends State<AlertDialogCategory> {
  final _nameController = TextEditingController();
  EnumColors _colorSelected = EnumColors.skyBlue;
  EnumIconsCategory _iconSelected = EnumIconsCategory.food;
  String? _dropDownValue;
  final List<String> _categoryTypes = ['expense', 'income'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva categoría'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              label: const Text('Nombre de la categoría'),
            ),
          ),
          const SizedBox(height: 15),
          DropdownButton(
            value: _dropDownValue,
            hint: const Text('Tipo de categoría'),
            items: _categoryTypes.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category.toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _dropDownValue = value;
              });
            },
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 25.75,
                children: EnumColors.values.map((enumColor) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _colorSelected = enumColor;
                      });
                    },
                    child: Container(
                      width: 20.5,
                      height: 20.5,
                      decoration: BoxDecoration(
                        color: enumColor.color,
                        shape: BoxShape.circle,
                        border: _colorSelected == enumColor
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 10.5,
                children: EnumIconsCategory.values.map((enumIcon) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _iconSelected = enumIcon;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: _iconSelected == enumIcon
                            ? _colorSelected.color.withAlpha(80)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/${enumIcon.path}',
                          height: 20,
                          width: 20,
                          colorFilter: _iconSelected == enumIcon
                              ? ColorFilter.mode(
                                  _colorSelected.color,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(onPressed: () {}, child: const Text('Guardar')),
      ],
    );
  }
}
