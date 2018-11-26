module ManageIQ::Providers::StorageManager::AbstractStorageMixin
  extend ActiveSupport::Concern

  included do
    # STI is not desired in the abstract storage classes, but abstract_class doesn't support default_scope
    self.inheritance_column = :_type_disabled
    # The default_scope below needs to access self
    klass = self
    # Only those storage managers are desired that suppoer the ABSTRACT_STORAGE_FEATURE
    default_scope do
      where(:type => superclass.descendants.select { |m| m.supports?(klass::ABSTRACT_STORAGE_FEATURE) && m != klass })
    end
  end
end