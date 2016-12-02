require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    options.each { |attr_name, value| send("#{attr_name}=", value) }

    @foreign_key ||= "#{name}_id".to_sym
    @primary_key ||= "id".to_sym
    @class_name ||= name.to_s.camelcase
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    options.each { |attr_name, value| send("#{attr_name}=", value) }

    @foreign_key ||= "#{self_class_name.downcase}_id".to_sym
    @primary_key ||= "id".to_sym
    @class_name ||= name.to_s.singularize.camelcase
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    assoc_options
    options = BelongsToOptions.new(name, options)
    @assoc_options[name] = options

    define_method(name) do
      parent_class = options.model_class
      foreign_key = self.send(options.foreign_key)

      parent_class.where(id: foreign_key).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.name, options)

    define_method(name) do
      child_class = options.model_class
      foreign_key = options.foreign_key

      child_class.where(foreign_key => self.id)
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
