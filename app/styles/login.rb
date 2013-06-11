Teacup::Stylesheet.new :login_stylesheet do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :login_container,
    frame: [[70, app_size.height / 2 - 45],
      [180, 108]]

  style :input_field,
    textAlignment: UITextAlignmentCenter,
    autocapitalizationType: UITextAutocapitalizationTypeNone,
    borderStyle: UITextBorderStyleRoundedRect

  style :email_input, extends: :input_field,
    placeholder: 'email',
    frame: [[10, 10], [160, 26]],
    returnKeyType: UIReturnKeyNext

  style :password_input, extends: :input_field,
    placeholder: 'password',
    secureTextEntry: true,
    frame: [[10, 42], [160, 26]],
    returnKeyType: UIReturnKeyDone
end
