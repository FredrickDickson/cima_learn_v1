class Course {
  final String id;
  final String title;
  final String instructor;
  final double rating;
  final int reviewCount;
  final String duration;
  final int studentCount;
  final double price;
  final double? originalPrice;
  final String category;
  final String level;
  final String image;
  final bool isPopular;
  final bool isBestseller;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.reviewCount,
    required this.duration,
    required this.studentCount,
    required this.price,
    this.originalPrice,
    required this.category,
    required this.level,
    required this.image,
    this.isPopular = false,
    this.isBestseller = false,
  });
}