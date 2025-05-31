class StatusMaster < ApplicationRecord
    PENDING = 1
    COMPLETED = 2
    CANCELLED = 3
    COOKING = 4
    SERVED = 5
    PAID = 6
    AVAILABLE = 7
    UNAVAILABLE = 8
    RESERVED = 9
    OPENED = 10
end
