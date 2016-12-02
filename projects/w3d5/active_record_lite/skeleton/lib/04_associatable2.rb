require_relative '03_associatable'
require 'active_support/inflector'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options =
        through_options.model_class.assoc_options[source_name]

      source_table = source_options.class_name.tableize
      through_table = through_options.class_name.downcase + "s"
      start_table = self.class.to_s.tableize

      first_foreign_key = through_options.foreign_key
      second_foreign_key = source_options.foreign_key

      cat_owner_id = self.send(first_foreign_key.to_s)

      data = DBConnection.execute(<<-SQL, cat_owner_id)
        SELECT
          #{source_table}.*
        FROM
          #{source_table}
        JOIN
          #{through_table} ON
          #{through_table}.#{second_foreign_key} = #{source_table}.id
        WHERE
          #{through_table}.id = ?
      SQL

      source_options.model_class.new(data.first)
      # self.send(through_name).send(source_name)
    end
  end
end
