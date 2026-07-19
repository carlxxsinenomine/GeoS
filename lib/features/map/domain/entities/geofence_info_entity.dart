class GeofenceInfoEntity {
  final String? user;
  final String? name;
  final String? description;
  final String? municipality;
  final String? province;
  final bool? isActive;
  final int? color;

  const GeofenceInfoEntity({
    this.user,
    this.name,
    this.description,
    this.municipality,
    this.province,
    this.isActive,
    this.color,
  });
}
