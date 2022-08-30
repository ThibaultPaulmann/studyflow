class ChangeUpvotesOfQuestionsAndAnswers < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :upvotes, :integer, null: false, default: 0
    change_column :answers, :upvotes, :integer, null: false, default: 0
  end
end
