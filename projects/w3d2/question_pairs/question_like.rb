require_relative 'questions_database'
require_relative 'question'
require_relative 'user'
require_relative 'model'

class QuestionLike < Model


  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_likes
      JOIN
        users ON
        question_likes.user_id = users.id
      WHERE
        question_id = ?
    SQL

    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    data.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions ON
        question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = ?
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions ON
        question_likes.question_id = questions.id
      GROUP BY
        question_likes.question_id
      ORDER BY
        count(*) DESC
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
