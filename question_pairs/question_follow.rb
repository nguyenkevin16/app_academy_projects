require_relative 'questions_database'
require_relative 'question'
require_relative 'user'

class QuestionFollow

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    data.map { |datum| QuestionFollow.new(datum) }.first
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
