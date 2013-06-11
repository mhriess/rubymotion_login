class LoginController < UIViewController
  def viewDidLoad
    super

    @login_view = LoginView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.addSubview(@login_view)

    true
  end

end
