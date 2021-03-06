require "nullifyable/version"
require "active_record"

module Nullifyable
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :nullifyable_attributes
    
    private

    def nullify(*attributes)
      @nullifyable_attributes = attributes
    end
  end

  included do
    before_save :nullify_blank_fields
  end

  private
  def nullify_blank_fields
    self.class.nullifyable_attributes.each do |attr|
      self[attr] = nil if self[attr].blank?
    end if self.class.nullifyable_attributes.present?
  end
end
