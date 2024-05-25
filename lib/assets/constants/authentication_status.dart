enum AuthenticationStatus {
  authenticated,
  unauthenticated;

  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
  bool get isUnAuthenticated => this == AuthenticationStatus.unauthenticated;
}
