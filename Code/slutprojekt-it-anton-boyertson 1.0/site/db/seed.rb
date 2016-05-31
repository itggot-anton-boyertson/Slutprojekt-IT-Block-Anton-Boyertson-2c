class Seeder

  def self.seed!
    self.user
    self.item
    self.list
  end

  def self.user
    User.create(first_name: "Anton", last_name: "Eriksson", username: "anteri", mobil: "0468200000", password: "baconclub", e_mail_address: "antoneriksson@gmail.com")
    User.create(first_name: "Pontus", last_name: "Boyertson", username: "ponboy", mobil: "0595033344", password: "baconburger", e_mail_address: "pontusboyertson@gmail.com")
    User.create(first_name: "Martin", last_name: "Davidsson", username: "mardav", mobil: "0760550505", password: "baconfish", e_mail_address: "martindavidsson@gmail.com")
  end

  def self.list
    List.create(list_name: "köpslista", list_description: "köpslista beskriving",)
    List.create(list_name: "attgöralista", list_description: "attgöralista beskriving",)
    List.create(list_name: "baconattköpalista", list_description: "baconattköpalista beskriving", )

    UserList.create(user_id: 2, list_id: 1)
    UserList.create(user_id: 2, list_id: 3)
    UserList.create(user_id: 2, list_id: 2)

    UserList.create(user_id: 1, list_id: 1)
    UserList.create(user_id: 1, list_id: 3)
    UserList.create(user_id: 1, list_id: 2)
  end

  def self.item
    Item.create(item_name: "gurkor", list_id: 1)
    Item.create(item_name: "bananer", list_id: 2)
    Item.create(item_name: "bacon", list_id: 2)
  end

end