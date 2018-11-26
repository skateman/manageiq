module ManageIQ::Providers
  class StorageManager::ObjectStorageManager < ManageIQ::Providers::StorageManager
    ABSTRACT_STORAGE_FEATURE = :object_storage

    include ManageIQ::Providers::StorageManager::ObjectMixin
    include ManageIQ::Providers::StorageManager::AbstractStorageMixin
  end
end
