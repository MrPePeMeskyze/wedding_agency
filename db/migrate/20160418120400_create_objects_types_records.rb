class CreateObjectsTypesRecords < ActiveRecord::Migration
  def change
  	ObjectsTypes.create(name: "Новости", sort_order: "2")
  	ObjectsTypes.create(name: "Статьи", sort_order: "3")
  	ObjectsTypes.create(name: "Статическая страница", sort_order: "1")
  end
end
