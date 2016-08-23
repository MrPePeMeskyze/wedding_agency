class CreateObjectsTypesRecords < ActiveRecord::Migration
  def change
  	ObjectsTypes.create(name: "Главная", sort_order: "0")
  	ObjectsTypes.create(name: "Статическая страница", sort_order: "1")
  	ObjectsTypes.create(name: "Услуги", sort_order: "2")
  	ObjectsTypes.create(name: "Фото", sort_order: "3")
  	ObjectsTypes.create(name: "Видео", sort_order: "4")
  	ObjectsTypes.create(name: "Отзывы", sort_order: "5")
  end
end
