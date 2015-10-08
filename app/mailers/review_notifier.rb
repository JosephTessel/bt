class ReviewNotifier < ApplicationMailer
  default from: "tessel.joseph@gmail.com"

  def new_review(review)
    mail(
      to: review.user.email,
      subject: "New Review for #{review.design.design_name}")
  end
end
