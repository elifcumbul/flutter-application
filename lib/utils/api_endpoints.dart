class ApiEndPoints {
  static final String baseUrl = "https://localhost:7179/api";
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/Auths/register';
  final String loginEmail = '/Auths/login';
}