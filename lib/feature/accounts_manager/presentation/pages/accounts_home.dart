import 'package:flutter/material.dart';
import 'package:personal_expenses/feature/accounts_manager/presentation/provider/list_accounts_provider.dart';
import 'package:personal_expenses/feature/accounts_manager/presentation/widgets/account_tile.dart';
import 'package:personal_expenses/feature/accounts_manager/presentation/widgets/dialog_add_account.dart';
import 'package:provider/provider.dart';

class AccountsHome extends StatefulWidget {
  const AccountsHome({super.key});

  @override
  State<AccountsHome> createState() => _AccountsHomeState();
}

class _AccountsHomeState extends State<AccountsHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<ListAccountsProvider>(context).getAccounts();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Cuentas', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ListAccountsProvider>(
              builder: (context, provider, child) {
                final accountsResponse = provider.accountsResponse;
                if (!accountsResponse.success) {
                  return Center(child: Text(accountsResponse.message));
                }
                if (accountsResponse.data!.isEmpty) {
                  return Center(child: Text(accountsResponse.message));
                }
                final accounts = accountsResponse.data;
                return Column(
                  children: [
                    Text(
                      'Tus Cuentas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.7,
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: accounts!.length,
                      itemBuilder: (context, index) {
                        final account = accounts[index];
                        return AccountTile(account: account);
                      },
                    ),
                  ],
                );
              },
            ),
            /* 
            SizedBox(height: 300),
            //Expanded(child: ListView()), */
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Acciones',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.7,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * .4,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.blueAccent,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _showDialogAddAccount();
                          },
                          child: Text('Agregar cuenta'),
                        ),
                      ),
                      SizedBox(
                        width: size.width * .4,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.lightBlueAccent[50],
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.blueAccent,
                            ),
                          ),
                          onPressed: () {
                            //TODO: Programar las transferencias entre cuentas
                          },
                          child: Text('Transferencia'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogAddAccount() {
    showDialog(context: context, builder: (context) => DialogAddAccount());
  }
}
