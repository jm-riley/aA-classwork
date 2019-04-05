require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    @class_name.constantize
  end

  def table_name
    # ...
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    # ...
    # defaults = {foreign_key: "#{name}_id".to_sym, class_name: name.to_s.camelcase, primary_key: :id}
    # defaults.keys.each do |key|
    #   self.send("#{key}=",options[key] || defaults[key])
    # end
    self.foreign_key = options[:foreign_key] || "#{name}_id".to_sym
    self.primary_key = options[:primary_key] || :id
    self.class_name = options[:class_name] || "#{name}".singularize.camelize
  end
end

class HasManyOptions < AssocOptions   
  def initialize(name, self_class_name, options = {})
    # ...UserName
    #user_names_id
    #
    # debugger
    self.foreign_key = options[:foreign_key] || "#{self_class_name}".foreign_key.to_sym
    self.primary_key = options[:primary_key] || :id
    self.class_name = options[:class_name] || "#{name}".singularize.camelize
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name,options)
    
    define_method(name) do
      
       foreign_value = self.send(options.foreign_key)
       options.model_class.where(options.primary_key => foreign_value).first     
    end
  end
  
  def has_many(name, options = {})
    # ...
    options = HasManyOptions.new(name,options)
    define_method(name) do
       foreign_value = self.send(options.foreign_key)
       options.model_class.where(options.primary_key => foreign_value)   
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end
