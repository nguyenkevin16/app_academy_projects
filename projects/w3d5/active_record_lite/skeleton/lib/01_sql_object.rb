require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @column_names ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    @column_names.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        attributes
        @attributes[col]
      end

      define_method("#{col}=") do |value|
        attributes
        @attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |params| self.new(params) }
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL

    data.nil? ? nil : self.parse_all(data).first
  end

  def initialize(params = {})
    self.class.finalize!

    params.each do |attr_name, value|
      name = attr_name.to_sym

      unless self.class.columns.include?(name)
        raise "unknown attribute '#{attr_name}'"
      end

      self.send("#{name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |col| self.send(col) }
  end

  def insert
    col_names = self.class.columns.join(", ")
    question_marks = [["?"] * self.class.columns.length].join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.map { |col| "#{col} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
