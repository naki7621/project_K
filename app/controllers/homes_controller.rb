class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @total_price = current_user.books.sum(:price)
      @category_totals = Category.all.reject { |category| category.name.include?('-') }.map do |category|
        total_price = current_user.books.where(category_id: category.id).sum(:price)
        [category.name, total_price]
      end.to_h

      @memos = current_user.memos
    end
  end
end
