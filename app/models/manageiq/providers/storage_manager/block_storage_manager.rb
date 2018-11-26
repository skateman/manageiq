module ManageIQ::Providers
  class StorageManager::BlockStorageManager < ManageIQ::Providers::StorageManager
    ABSTRACT_STORAGE_FEATURE = :block_storage

    include ManageIQ::Providers::StorageManager::BlockMixin
    include ManageIQ::Providers::StorageManager::AbstractStorageMixin
  end
end
