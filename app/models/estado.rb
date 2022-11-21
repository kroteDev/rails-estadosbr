class Estado < ApplicationRecord
  has_many :cidades
  validates_presence_of :sigla, uniqueness: true
  validates_presence_of :nome, uniqueness: true
end
