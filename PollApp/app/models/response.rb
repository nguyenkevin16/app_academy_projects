class Response < ActiveRecord::Base
  validates :answer_choice_id, :user_id, presence: true
  validate :not_duplicate_response


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

  private

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



end
