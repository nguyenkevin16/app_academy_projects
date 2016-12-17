require_relative 'questions_database'
require 'active_support/inflector'

class Model

  # TABLE_NAME = "users"

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.get_first_row(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
    p data
    # data.map { |datum| self.new(datum) }.first
    self.new(data)
    # data.nil? ? nil : self.new(data)
  end

  def self.table
    self.to_s.tableize
  end
  #
  # def self.find_by_id(id)
  #   data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
  #     SELECT
  #       *
  #     FROM
  #       #{table}
  #     WHERE
  #       id = :id
  #   SQL
  #
  #   data.nil? ? nil : self.new(data)
  # end
end
