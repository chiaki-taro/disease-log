class Level < ActiveHash::Base
  self.data = [
    { id: 0, name: '上の顔から番号を選んでください' },
    { id: 1, name: '0：症状がない' },
    { id: 2, name: '1：ほんの少し辛い' },
    { id: 3, name: '2：少し辛い' },
    { id: 4, name: '3：もっと辛い' },
    { id: 5, name: '4：かなり辛い' },
    { id: 6, name: '5：耐えられないくらい辛い' },
  ]

  include ActiveHash::Associations
  has_many :symptoms
end