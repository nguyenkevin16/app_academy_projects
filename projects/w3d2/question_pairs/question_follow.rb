require_relative 'questions_database'
require_relative 'question'
require_relative 'user'
require_relative 'model'

class QuestionFollow < Model

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_follows
      JOIN
        users ON
        users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL

    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT DISTINCT
        questions.*
      FROM
        question_follows
      JOIN
        questions ON
        questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_follows
      JOIN
        questions ON
        questions.id = question_follows.question_id
      GROUP BY
        question_follows.question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
