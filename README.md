# テーブル設計

## users テーブル

| Column             | Type     | Options                       |
| ------------------ | -------- | ----------------------------- |
| email              |  string  | null: false, uniqueness: true |
| encrypted_password |  string  | null: false                   |
| nickname           |  string  | null: false                   |
| last_name          |  string  | null: false                   |
| first_name         |  string  | null: false                   |
| last_name_kana     |  string  | null: false                   |
| first_name_kana    |  string  | null: false                   |
| birthday           | datetime | null: false                   |

### Association

- has_many :items
- has_one :order


## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| produst        |   string   | null: false                   |
| text           |    text    | null: false                   |
| category       |    text    | null: false                   |
| status         |    text    | null: false                   |
| defrayment     |    text    | null: false                   |
| region         |    text    | null: false                   |
| day            |  datetime  | null: false                   |
| price          |  integer   | null: false                   |
| user           | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| card_number    |  integer   | null: false                   |
| deadline       |  integer   | null: false                   |
| seculitycode   |  integer   | null: false                   |
| user           | references | null: false,foreign_key: true |
| item           | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postcode       |  integer   | null: false                   |
| prefecture     |   string   | null: false                   |
| city           |   string   | null: false                   |
| block          |   string   | null: false                   |
| building       |    text    |                               |
| postcode       |  integer   | null: false                   |
| item           | references | null: false,foreign_key: true |

### Association

- belongs_to :order