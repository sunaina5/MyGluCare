import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> getSignedUrl(String? filePath) async {
  if (filePath == null || filePath.isEmpty) return null;

  final supabase = Supabase.instance.client;
  final signedUrl = await supabase.storage
      .from('profile-pic')
      .createSignedUrl(filePath, 60 * 60); // 1 hour
  return signedUrl;
}
