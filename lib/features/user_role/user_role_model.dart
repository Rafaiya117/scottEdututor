class UserRole {
  final String id;
  final String name;
  final String svgPath;
  final UserRoleType type; 

  const UserRole({
    required this.id,
    required this.name,
    required this.svgPath,
    required this.type,
  });
}
enum UserRoleType { student, teacher, parent,admin }