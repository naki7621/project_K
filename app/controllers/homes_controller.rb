class HomesController < ApplicationController
  def index
    @memos = Memo.all
  end
end
