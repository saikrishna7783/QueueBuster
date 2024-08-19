enum RouteNames {
  authLogin,
  authSignup,
  emailVerification,
  home,
  stores,
  selectLocation,
  cart,
  settings,
  profile,
  menu
}

extension RouteNamesHelper on RouteNames {
  String get path {
    switch (this) {
      case RouteNames.authLogin:
        return "/auth/login";
      case RouteNames.authSignup:
        return "/auth/signup";
      case RouteNames.emailVerification:
        return "/auth/email-verification";
      case RouteNames.home:
        return "/";
      case RouteNames.stores:
        return "/stores";
      case RouteNames.selectLocation:
        return "/select-location";
      case RouteNames.cart:
        return "/cart";
      case RouteNames.settings:
        return "/settings";
      case RouteNames.profile:
        return "/profile";
      case RouteNames.menu:
        return "/menu";

    }
  }
}