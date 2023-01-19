class Order < ApplicationRecord
    enum method_payment: { credit_card: 0, transfer: 1 }
    enum order_status: { waiting: 0, confirm: 1, production: 2, preparing: 3, sent: 4}
end
