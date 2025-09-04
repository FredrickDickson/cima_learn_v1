import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/course_service.dart';
import '../widgets/header.dart';
import '../widgets/hero_section.dart';
import '../widgets/course_categories.dart';
import '../widgets/course_card.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  String activeCategory = 'all';
  bool showMore = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final CourseService _courseService = CourseService();

  bool get isMobile => MediaQuery.of(context).size.width < 768;

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showToast('Welcome to CIMA Learn Hub!');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _courseService.getFilteredCourses(activeCategory);
    final displayedCourses = showMore ? filteredCourses : filteredCourses.take(6).toList();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Header(isMobile: isMobile),
          const SizedBox(height: 24),
          FadeTransition(
            opacity: _fadeAnimation,
            child: const HeroSection(),
          ),
          const SizedBox(height: 24),
          CourseCategories(
            activeCategory: activeCategory,
            onCategoryChange: (category) {
              setState(() {
                activeCategory = category;
                showMore = false;
                _controller.reset();
                _controller.forward();
              });
            },
            isMobile: isMobile,
          ),
          const SizedBox(height: 24),
          Text(
            activeCategory == 'all'
                ? 'Featured Courses'
                : '${activeCategory[0].toUpperCase()}${activeCategory.substring(1)} Courses',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Learn from internationally recognized experts and build your expertise in dispute resolution.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: displayedCourses.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 300 + (index * 100)),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: child,
                    ),
                  );
                },
                child: CourseCard(course: displayedCourses[index]),
              );
            },
          ),
          const SizedBox(height: 16),
          if (filteredCourses.length > 6)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showMore = !showMore;
                    _controller.reset();
                    _controller.forward();
                  });
                },
                child: Text(showMore ? 'Show Less' : 'View All ${filteredCourses.length} Courses'),
              ),
            ),
          const SizedBox(height: 24),
          const Footer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showToast('Button clicked!'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}