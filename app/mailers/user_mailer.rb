class UserMailer < ApplicationMailer
  def thank_you_for_snippet(snippet,user)
    @snippet = snippet
    @user = user
    mail(to: @snippet.email, subject: "We appreciate your interest!")
  end
end
