class Question < ActiveRecord::Base
  validates :body, :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    a = answer_choices.includes(:responses)
    counts = {}
    a.each do |choice|
      counts[choice.body] = choice.responses.length
    end
    counts
  end
end
