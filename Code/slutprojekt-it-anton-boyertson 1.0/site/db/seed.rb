class Seeder

  def self.seed!
    self.user
    self.item
    self.list
  end

  def self.user
    User.create(first_name: "Anton", lastname: "Eriksson", username: "anteri", mobil: "0468200000", password: "baconclub", e_mail_adress: "antoneriksson@gmail.com")
    User.create(first_name: "Pontus", lastname: "Boyertson", username: "ponboy", mobil: "0595033344", password: "baconburger", e_mail_adress: "pontusboyertson@gmail.com")
    User.create(first_name: "Martin", lastname: "Davidsson", username: "mardav", mobil: "0760550505", password: "baconfish", e_mail_adress: "martindavidsson@gmail.com")
  end

  def self.list
    List.create(list_name: "köpslista", list_description: "köpslista beskriving")
    List.create(list_name: "attgöralista", list_description: "attgöralista beskriving")
    List.create(list_name: "baconattköpalista", list_description: "baconattköpalista beskriving")
  end

  def self.item
    Item.create(item_name: "gurkor", list_id: 1)
    Item.create(item_name: "bananer", list_id: 2)
    Item.create(item_name: "bacon", list_id: 2)
  end

end