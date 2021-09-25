class Grade < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :textbook_lists, through: :chapters
  enum number: { s_1: 1,
                s_2: 2,
                s_3: 3,
                s_4: 4,
                s_5: 5,
                s_6: 6,
                c_1: 7,
                c_2: 8,
                c_3: 9,
                k_1: 10,
                k_2: 11,
                k_3: 12
  }



end
