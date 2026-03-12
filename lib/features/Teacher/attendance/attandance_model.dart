class AttandanceModel {
  final int studentId;
  final String name;
  final String phone;
  final String status;

  AttandanceModel({
    required this.studentId,
    required this.name,
    required this.phone,
    required this.status,
  });

  factory AttandanceModel.fromJson(Map<String, dynamic> json) {
    return AttandanceModel(
      studentId: json['student_id'],
      name: json['student_name'] ?? '',
      phone: json['email'] ?? '',
      status: json['status'] ?? '',
    );
  }
}