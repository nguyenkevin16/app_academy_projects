require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    # self.results_as_hash = false
  end

  def self.get_first_row(*args)
   instance.get_first_row(*args)
  end

end
