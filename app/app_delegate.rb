class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    login_controller = LoginController.alloc.init
    @navigationController = UINavigationController.alloc.initWithRootViewController(login_controller)

    @window.rootViewController = @navigationController
    @window.makeKeyAndVisible

    true
  end
end
