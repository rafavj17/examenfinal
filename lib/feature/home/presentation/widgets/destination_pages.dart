import 'package:flutter/material.dart';

class DestinationPages {
  IconData icon;
  IconData selectedIcon;
  String label;

  DestinationPages({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  static List<Widget> getNavigationDestinatios() => destinations
      .map(
        (destination) => NavigationDestination(
          icon: Icon(destination.icon),
          selectedIcon: Icon(destination.selectedIcon),
          label: destination.label,
        ),
      )
      .toList();
}

List<DestinationPages> destinations = [
  DestinationPages(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_filled,
    label: 'Inicio',
  ),
  DestinationPages(
    icon: Icons.account_balance_outlined,
    selectedIcon: Icons.account_balance,
    label: 'Cuentas',
  ),
  DestinationPages(
    icon: Icons.category_outlined,
    selectedIcon: Icons.category,
    label: 'Categorias',
  ),
  DestinationPages(
    icon: Icons.money_outlined,
    selectedIcon: Icons.money,
    label: 'Presupuestos',
  ),
  DestinationPages(
    icon: Icons.emoji_events_outlined,
    selectedIcon: Icons.emoji_events,
    label: 'Objetivos',
  ),
];
