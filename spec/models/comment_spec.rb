require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it "contentが存在すれば投稿できる" do
      expect(@comment).to be_valid
    end
    it "contentが空だと投稿できない" do
      @comment.content = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Content can't be blank")
    end
    it "contentが20文字より多いと登録できない" do
      @comment.content = "あああああああああああああああああああああ"
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Content is too long (maximum is 20 characters)")
    end
  end
end
