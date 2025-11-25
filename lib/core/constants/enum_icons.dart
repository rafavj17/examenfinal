enum EnumIcons {
  bank(path: 'building-solid.svg', name: 'Banco'),
  cash(path: 'wallet-solid.svg', name: 'Efectivo'),
  creditCard(
    path: 'credit-solid.svg',
    name: 'Tarjeta de Crédito',
  ),
  saving(path: 'piggy-solid.svg', name: 'Ahorro'),
  investment(path: 'hand-dollar.svg', name: 'Inversiones');

  final String path;
  final String name;

  const EnumIcons({required this.path, required this.name});

  static String getIconPathByName(String iconName) {
    return EnumIcons.values
        .firstWhere(
          (e) => e.name.toLowerCase() == iconName.toLowerCase(),
          orElse: () => EnumIcons.bank,
        )
        .path;
  }
}
