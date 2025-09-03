import '../models/course.dart';
import '../utils/course_utils.dart';

class CourseService {
  List<Course> getFilteredCourses(String category) {
    if (category == 'all') return courses;
    return courses.where((course) => course.category == category).toList();
  }
}