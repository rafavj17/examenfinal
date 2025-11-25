import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_expenses/core/constants/constants_app.dart';
import 'package:personal_expenses/core/constants/enum_color.dart';
import 'package:personal_expenses/core/constants/enum_icons.dart';
import 'package:personal_expenses/core/constants/global_widgets.dart';
import 'package:personal_expenses/feature/accounts_manager/data/repo/accounts_manager_repo_impl.dart';
import 'package:personal_expenses/feature/accounts_manager/domain/entity/account_entity.dart';
import 'package:personal_expenses/feature/accounts_manager/presentation/provider/list_accounts_provider.dart';
import 'package:provider/provider.dart';

class DialogAddAccount extends StatefulWidget {
  const DialogAddAccount({super.key});

  @override
  State<DialogAddAccount> createState() => _DialogAddAccountState();
}

class _DialogAddAccountState extends State<DialogAddAccount> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _initialBalanceController = TextEditingController();
  String? _dropDownValue;
  final List<String> _accountTypes = [
    'Cuenta Bancaria',
    'Ahorro',
    'Tarjeta de Crédito',
    'Efectivo',
    'Inversiones',
  ];

  EnumColors _colorSelected = EnumColors.skyBlue;
  EnumIcons _iconSelected = EnumIcons.bank;

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<ListAccountsProvider>(context);
    return AlertDialog(
      title: Text('Agregar Cuenta'),
      content: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(label: Text('Nombre')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre de cuenta';
                  }
                  return null;
                },
              ),
              DropdownButton(
                value: _dropDownValue,
                hint: Text('Tipo de Cuenta'),
                items: _accountTypes
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _dropDownValue = value;
                  });
                },
              ),
              TextFormField(
                controller: _initialBalanceController,
                decoration: InputDecoration(label: Text('Balance actual')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el balance actual';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null) {
                    return 'Ingrese un monto válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              //Image.asset('assets/images/man.png', height: 50, width: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 10.5,
                    children: EnumIcons.values.map((enumIcon) {
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
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                    foregroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  ),
                  label: Text(
                    'Registrar cuenta',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.save, color: Colors.white),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_dropDownValue == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Seleccione un tipo de cuenta'),
                          ),
                        );
                      }
                      final newAccount = AccountEntity(
                        name: _nameController.text,
                        accountType: _dropDownValue!,
                        icon: _iconSelected.path,
                        color: _colorSelected.color,
                        balance: double.parse(_initialBalanceController.text),
                        userId: userLoged!.id!,
                      );
                      final res = await AccountsManagerRepoImpl().createAccount(
                        newAccount,
                      );
                      if (!res.success) {
                        _showMessage(res.message);
                        print(res.message);
                      } else {
                        _showMessage(res.message);
                        accountProvider.getAccounts();
                        _backPage();
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(GlobalWidgets.snackMessage(context, message));
  }

  void _backPage() {
    Navigator.pop(context);
  }
}
