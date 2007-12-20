class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.column :make_id, :integer
      t.column :name, :string
    end
    
execute("insert into models(make_id,name) values(1,'Bronco')")
execute("insert into models(make_id,name) values(1,'Bronco II')")
execute("insert into models(make_id,name) values(1,'Econoline')")
execute("insert into models(make_id,name) values(1,'Excursion')")
execute("insert into models(make_id,name) values(1,'Explorer')")
execute("insert into models(make_id,name) values(1,'Expedition')")
execute("insert into models(make_id,name) values(1,'F-150')")
execute("insert into models(make_id,name) values(1,'F-250')")
execute("insert into models(make_id,name) values(1,'F-350')")
execute("insert into models(make_id,name) values(1,'Ranger')")
execute("insert into models(make_id,name) values(2,'D50 Pick Up')")
execute("insert into models(make_id,name) values(2,'Dakota')")
execute("insert into models(make_id,name) values(2,'Durango')")
execute("insert into models(make_id,name) values(2,'Power Wagon')")
execute("insert into models(make_id,name) values(2,'Ram 1500')")
execute("insert into models(make_id,name) values(2,'Ram 2500')")
execute("insert into models(make_id,name) values(2,'Ram 3500')")
execute("insert into models(make_id,name) values(2,'Ram SRT-10')")
execute("insert into models(make_id,name) values(2,'Ram Van')")
execute("insert into models(make_id,name) values(2,'Ramcharger')")
execute("insert into models(make_id,name) values(3,'Jimmy')")
execute("insert into models(make_id,name) values(3,'S15 Pick Up')")
execute("insert into models(make_id,name) values(3,'Sierra C/K1500')")
execute("insert into models(make_id,name) values(3,'Sierra C/K2500')")
execute("insert into models(make_id,name) values(3,'Sierra C/K3500')")
execute("insert into models(make_id,name) values(3,'Yukon')")
execute("insert into models(make_id,name) values(3,'Typhoon')")
execute("insert into models(make_id,name) values(3,'Sonoma')")
execute("insert into models(make_id,name) values(4,'Avalanche')")
execute("insert into models(make_id,name) values(4,'Blazer')")
execute("insert into models(make_id,name) values(4,'Colarado')")
execute("insert into models(make_id,name) values(4,'El Camino')")
execute("insert into models(make_id,name) values(4,'Express Van')")
execute("insert into models(make_id,name) values(4,'S10 Blazer')")
execute("insert into models(make_id,name) values(4,'S10 Pick Up')")
execute("insert into models(make_id,name) values(4,'Silverado (C/K1500)')")
execute("insert into models(make_id,name) values(4,'Silverado (C/K2500)')")
execute("insert into models(make_id,name) values(4,'Silverado (C/K3500)')")
execute("insert into models(make_id,name) values(4,'Suburban')")
execute("insert into models(make_id,name) values(4,'Tahoe')")
execute("insert into models(make_id,name) values(4,'Trailblazer')")
execute("insert into models(make_id,name) values(5,'Pick Up')")
execute("insert into models(make_id,name) values(6,'H1')")
execute("insert into models(make_id,name) values(6,'H2')")
execute("insert into models(make_id,name) values(6,'H3')")
execute("insert into models(make_id,name) values(7,'Pick Up')")
execute("insert into models(make_id,name) values(7,'Hombre')")
execute("insert into models(make_id,name) values(7,'Rodeo')")
execute("insert into models(make_id,name) values(7,'Trooper')")
execute("insert into models(make_id,name) values(7,'Trooper II')")
execute("insert into models(make_id,name) values(8,'Land Rover')")
execute("insert into models(make_id,name) values(8,'Range Rover')")
execute("insert into models(make_id,name) values(8,'Freelander')")
execute("insert into models(make_id,name) values(8,'Discovery')")
execute("insert into models(make_id,name) values(9,'B-Series Pick Up')")
execute("insert into models(make_id,name) values(10,'Frontier')")
execute("insert into models(make_id,name) values(10,'Murano')")
execute("insert into models(make_id,name) values(10,'Pathfinder')")
execute("insert into models(make_id,name) values(10,'Pick Up')")
execute("insert into models(make_id,name) values(10,'Titan')")
execute("insert into models(make_id,name) values(11,'4Runner')")
execute("insert into models(make_id,name) values(11,'Tacoma')")
execute("insert into models(make_id,name) values(11,'T100')")
execute("insert into models(make_id,name) values(11,'FJ Cruiser')")
execute("insert into models(make_id,name) values(11,'Sequoia')")
execute("insert into models(make_id,name) values(11,'RAV4')")
execute("insert into models(make_id,name) values(11,'Pick Up')")
execute("insert into models(make_id,name) values(12,'Touareg')")
execute("insert into models(make_id,name) values(13,'Sidekick')")
execute("insert into models(make_id,name) values(13,'Samurai')")
execute("insert into models(make_id,name) values(14,'Pick Up')")
execute("insert into models(make_id,name) values(14,'Mighty Max')")
execute("insert into models(make_id,name) values(15,'Comanche')")
execute("insert into models(make_id,name) values(15,'CJ')")
execute("insert into models(make_id,name) values(15,'Wrangler')")
execute("insert into models(make_id,name) values(15,'Cherokee')")
execute("insert into models(make_id,name) values(15,'Grand Cherokee')")
execute("insert into models(make_id,name) values(15,'Wagoneer')")
execute("insert into models(make_id,name) values(15,'Grand Wagoneer')")
execute("insert into models(make_id,name) values(15,'Liberty')")
execute("insert into models(make_id,name) values(15,'Commander')")
execute("insert into models(make_id,name) values(15,'Pick Up')")

  end

  def self.down
    drop_table :models
  end
end
