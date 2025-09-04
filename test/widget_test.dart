import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cima_learn/config/supabase_config.dart';
import 'package:cima_learn/src/app.dart';
import 'package:cima_learn/src/screens/login_page.dart';
import 'package:cima_learn/src/screens/signup_page.dart';
import 'package:cima_learn/src/screens/home_page.dart';

void main() {
  setUpAll(() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  });

  group('LoginPage Widget Tests', () {
    testWidgets('LoginPage displays email, password fields, login, forgot password, social media buttons, and signup navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Welcome Back to CIMA Learn'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Email or Phone number'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Continue with social media'), findsOneWidget);
      expect(find.text('Facebook'), findsOneWidget);
      expect(find.text('Google'), findsOneWidget);
      expect(find.text("Don't have an account? Sign Up"), findsOneWidget);

      await tester.enterText(find.byType(TextField).first, 'test@example.com');
      await tester.enterText(find.byType(TextField).last, 'password123');
      await tester.pump();
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);

      await tester.tap(find.text('Login'));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.tap(find.text('Forgot Password?'));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });

  group('SignupPage Widget Tests', () {
    testWidgets('SignupPage displays full name, email, password fields, signup, social media buttons, and login navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SignupPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.text('Join CIMA Learn'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(3));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email or Phone number'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.text('Continue with social media'), findsOneWidget);
      expect(find.text('Facebook'), findsOneWidget);
      expect(find.text('Google'), findsOneWidget);
      expect(find.text('Already have an account? Log In'), findsOneWidget);

      await tester.enterText(find.byType(TextField).first, 'John Doe');
      await tester.enterText(find.byType(TextField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextField).last, 'password123');
      await tester.pump();
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);

      await tester.tap(find.text('Sign Up'));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('HomePage Widget Tests', () {
    testWidgets('HomePage displays Header, HeroSection, CourseCategories, and course cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('CIMA Learn'), findsOneWidget);
      expect(find.text('Dispute Resolution Training'), findsOneWidget);
      expect(find.text('Master International Dispute Resolution'), findsOneWidget);
      expect(find.text('Start Learning Today'), findsOneWidget);
      expect(find.text('All Courses (500)'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(CourseCard), findsNWidgets(6));
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('HomePage changes category when a category button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('International Arbitration (145)'));
      await tester.pumpAndSettle();

      expect(find.text('Arbitration Courses'), findsOneWidget);
    });

    testWidgets('HomePage shows toast when FloatingActionButton is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.text('Button clicked!'), findsOneWidget);
    });
  });
}