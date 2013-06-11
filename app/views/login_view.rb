class LoginView < UIView
  def initWithFrame(rect)
    super.tap do
      # tell teacup which stylesheet to use
      self.stylesheet = :login_stylesheet
      # tell teacup which style to apply to the view itself
      self.stylename = :root

      @container = subview(UIView, :login_container) do
        @email_field = subview(UITextField, :email_input)
        @email_field.delegate = self

        @password_field = subview(UITextField, :password_input)
        @password_field.delegate = self
      end
    end

    self
  end

  def textFieldShouldReturn(textField)
    # if we're moving from email field to password, activate the password field for editing
    if textField == @email_field
      @password_field.becomeFirstResponder
    else
    # otherwise, shift the container back down
      container_frame = @container.frame
      container_frame.origin.y += 70

      UIView.animateWithDuration(0.3,
        animations: lambda {
          @container.frame = container_frame
        },
        completion: lambda { |finished|
          @offset = false
        }
      )
      textField.resignFirstResponder
    end

    false
  end

  def textFieldDidBeginEditing(textField)
    # if we've already shifted the view up, don't do it again
    return if @offset
    # grab our current frame and modify it so it's visible
    container_frame = @container.frame
    container_frame.origin.y -= 70

    # animate the replacement of the current frame with the new one
    UIView.animateWithDuration(0.3,
      animations: lambda {
        @container.frame = container_frame
      },
      completion: lambda { |finished|
        @offset = true
      }
    )
  end
end
