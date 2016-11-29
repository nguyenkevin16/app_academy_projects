require_relative 'questions_database'
require_relative 'question'
require_relative 'user'

class Reply

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    data.map { |datum| Reply.new(datum) }.first
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    data.map { |datum| Reply.new(datum) }
  end

  def sibling_replies
    raise 'There is no parent reply for this comment' unless @parent_id
    data = QuestionsDatabase.instance.execute(<<-SQL, @parent_id, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
        AND id != ?
    SQL

    data.map { |datum| Reply.new(datum) }
  end
end
