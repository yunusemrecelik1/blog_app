enum NetworkRoutes { login,register,categories,blog,getUser,favorite}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.login:
        return 'Login/SignIn';
      case NetworkRoutes.register:
        return 'Login/SignUp';
      case NetworkRoutes.categories:
        return 'Blog/GetCategories';
      case NetworkRoutes.blog:
        return 'Blog/GetBlogs';
      case NetworkRoutes.getUser:
        return 'Account/Get';
      case NetworkRoutes.favorite:
        return '/Blog/ToggleFavorite';

    }
  }
}
