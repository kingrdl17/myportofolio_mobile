/// URL dasar backend Django REST Framework.
///
/// Default ke `http://10.0.2.2:8000` untuk Android Emulator.
/// Gunakan `--dart-define=API_BASE_URL=http://localhost:8000` jika dijalankan di Chrome.
const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://10.0.2.2:8000',
);
