class Shop < ActiveRecord::Base
  has_many :manages
  has_many :users, through: :manages
  has_many :menus
  has_many :days
  has_many :photos

  def todaymenus
    menus = []

    # devolvemos los menus de hoy
    dia = Time.zone.now.wday # 1 al 7
    d = self.days
    if(d.count > 0)
      d = self.days.find_by_day_of_week(dia)
      if(d != nil)
        menus = d.menus
      end
    end

    return menus
  end

  def as_json(options={})
    super(:only => [:id, :title]);
  end

  def today_photo
    self.photos.find_by_date(Date.today)
  end
end
