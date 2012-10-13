# -*- coding: utf-8 -*-
class Project < ActiveRecord::Base
  # attr_accessible :title, :started_at, :finish_at, :color_index
  # FIX
  attr_protected :secret

  before_validation do
    self.started_at ||= Date.today()
    self.color_index ||= 1
  end

  validates :title, :presence => true, :uniqueness => true
  validates :started_at, :presence => true
  validates :color_index, :presence => true
end
