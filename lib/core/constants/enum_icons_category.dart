enum EnumIconsCategory {
  food(path: 'utensils.svg', name: 'Comida'),
  enterteinment(path: 'ticket.svg', name: 'Entretenimiento'),
  services(path: 'taxi.svg', name: 'Servicios'),
  salary(path: 'sack.svg', name: 'Salrio'),
  health(path: 'heart.svg', name: 'Salud');

  final String path;
  final String name;

  const EnumIconsCategory({required this.path, required this.name});

  static String getIconPathByName(String iconName) {
    return EnumIconsCategory.values
        .firstWhere(
          (e) => e.name.toLowerCase() == iconName.toLowerCase(),
          orElse: () => EnumIconsCategory.food,
        )
        .path;
  }
}
