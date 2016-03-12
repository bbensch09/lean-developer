class UserMailer < ApplicationMailer
  def thank_you_for_snippet(snippet)
    @snippet = snippet
    mail(to: @snippet.email, subject: "We appreciate your interest!")
  end
end
