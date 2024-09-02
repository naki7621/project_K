class MemosController < ApplicationController
  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id
    if @memo.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:category_id, :text, :quantity)
  end
end