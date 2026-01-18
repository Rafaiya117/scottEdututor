class UserRole {
  final String id;
  final String name;
  final String svgPath;

  const UserRole({
    required this.id,
    required this.name,
    required this.svgPath,
  });
}

enum UserRoleType { student, teacher, parent }