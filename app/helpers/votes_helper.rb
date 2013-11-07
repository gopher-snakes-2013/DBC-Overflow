module VotesHelper
  def upvote
    vote_form
  end

  def downvotes
    vote_form(-1)
  end

  def vote_form(value=1)
    form_for [submission, vote], remote: true do |f|
      f.hidden_field :direction, value: value
      f.submit 'Vote Up'
    end
  end
end
