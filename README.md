# ShareCycle

USER ||--o{ ITEM : owns:
This relationship indicates that each user can own zero or more items.
The "||--o{" notation denotes a one-to-many relationship, implying that each user can own multiple items.
Each item is owned by only one user.

USER ||--o{ LOAN : benefits from:
This relationship signifies that each user can benefit from multiple loans.
The "||--o{" notation indicates a one-to-many relationship, meaning each user can participate in multiple loans.

ITEM ||--o{ LOAN : is:
This relationship represents that each item can be associated with multiple loans.
The "||--o{" notation denotes a one-to-many relationship, implying that each item can be associated with multiple loans.

LOAN ||--o{ ITEM : active_loan:
This relationship signifies that each loan is associated with one item as its active loan.
The "||--o{" notation denotes a one-to-many relationship, indicating that each loan is linked to one item as its active loan.
The active_loan relationship indicates which loan is currently active for an item.

ITEM ||--o{ PHOTO : has:
This relationship indicates that each item can have multiple photos associated with it.
The "||--o{" notation denotes a one-to-many relationship, implying that each item can have multiple photos.
Each photo is associated with only one item.