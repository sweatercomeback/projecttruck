class CreateTransmissions < ActiveRecord::Migration
  def self.up
    create_table :transmissions do |t|
      t.column :name, :string
    end
    @transmission = Transmission.new
    @transmission.name = "Automatic"
    @transmission.save
    @transmission = Transmission.new
    @transmission.name = "3-Speed Manual"
    @transmission.save
    @transmission = Transmission.new
    @transmission.name = "4-Speed Manual"
    @transmission.save
    @transmission = Transmission.new
    @transmission.name = "5-Speed Manual"
    @transmission.save
  end

  def self.down
    drop_table :transmissions
  end
end
