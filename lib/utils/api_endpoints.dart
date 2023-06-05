class ApiEndPoints {
  static final String baseUrl = "https://localhost:7179/api";
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _UserEndPoints userEndPoints = _UserEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/Auths/register';
  final String loginEmail = '/Auths/login';
}

class _UserEndPoints {
  final String addPhoto = 'Users/addPhoto';
}
