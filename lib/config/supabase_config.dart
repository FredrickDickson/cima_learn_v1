import 'package:flutter_dotenv/flutter_dotenv.dart';

const String supabaseUrl = 'https://pgmtaemwcueobaexthaq.supabase.co';
String get supabaseAnonKey => dotenv.env['SUPABASE_KEY'] ?? '';