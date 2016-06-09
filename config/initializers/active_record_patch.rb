# In config/initializers/active_record_patch.rb
# needed for paper_trail has and belongs to many associations
module ActiveRecord
  # = Active Record Has Many Through Association
  module Associations
    class HasManyThroughAssociation < HasManyAssociation #:nodoc:
      alias_method :original_delete_records, :delete_records

      def delete_records(records, method)
        method ||= :destroy
        original_delete_records(records, method)
      end
    end
  end
end

module ActiveRecordExtensions
  extend ActiveSupport::Concern

  included do
    extend ClassMethods
  end

  module ClassMethods
  end

  def to_s
    names = Kernel.const_get(::Config.const_name).LABEL_METHODS.collect{|n| n if self.respond_to?(n.to_sym)}.compact
    if names.empty?
      [id||'new', self.class.name].join("-")
    else
      self.send(names.first.to_sym)
    end
  end

  def slug
    [id, to_s].compact.join("-").parameterize
  end
end
ActiveRecord::Base.send :include, ActiveRecordExtensions
