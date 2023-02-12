class Program < ApplicationRecord
  enum :publish_target, { only_customer: 1, only_guest: 2, all_users: 3, unpublishded: 4 }
end
