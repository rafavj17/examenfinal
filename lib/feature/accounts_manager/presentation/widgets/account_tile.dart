import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_expenses/feature/accounts_manager/domain/entity/account_entity.dart';

class AccountTile extends StatelessWidget {
  final AccountEntity account;
  const AccountTile({required this.account, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: account.color.withAlpha(50),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/${account.icon}',
                height: 30,
                width: 30,
                colorFilter: ColorFilter.mode(account.color, BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(
            width: size.width * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  account.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  account.accountType,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * .3,
            child: Center(
              child: Text(
                '${account.balance} ${account.currency}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: account.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
