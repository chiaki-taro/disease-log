class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '観察中' },
    { id: 2, name: '観察終了' }
  ]

  include ActiveHash::Associations
  has_many :diseases

  end