class Response < ActiveRecord::Base
  validates :answer_choice_id, :user_id, presence: true
  validate :not_duplicate_response, :author_cant_respond_to_own_poll


  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  # private

  def not_duplicate_response
    if respondent_already_answered?
      errors[:response] << "already recorded"
    end
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    siblings = sibling_responses
    siblings.exists?(user_id: self.user_id)
  end

  def author_cant_respond_to_own_poll
    if poll_author_is_responding?
      errors[:author] << "can't respond to own poll"
    end
  end

  def poll_author_is_responding?
    return self.user_id == self.poll.author_id unless poll.nil?
    false
    # poll.responses.exists?(user_id: author)
  end



end
