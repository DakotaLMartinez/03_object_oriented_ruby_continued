RSpec.describe "Examples" do
  describe "Computer" do 

    describe "Part 1" do 
      describe "initialize" do 
        it "accepts a hash of attributes as an argument and uses mass assignment to assign values to instance variables corresponding to the key names" do 
          computer = Computer.new(
            brand: "Apple",
            screen_size: 15.0,
            model_name: "Macbook Pro",
            model_year: 2012
          )
          expect(computer.instance_variable_get("@brand")).to eq("Apple")
          expect(computer.instance_variable_get("@screen_size")).to eq(15.0)
          expect(computer.instance_variable_get("@model_name")).to eq("Macbook Pro")
          expect(computer.instance_variable_get("@model_year")).to eq(2012)
        end
      end

      describe "attribute macros" do 
        it "are used to replace hard coded setters and getters for computer attributes" do 
          expect(Computer.instance_methods).to include(
            :brand,
            :brand=,
            :screen_size,
            :screen_size=,
            :model_name,
            :model_name=,
            :model_year,
            :model_year=,
            :asleep,
            :last_backed_up_at
          )
        end
      end

      describe "#first_computer" do 
        it "returns a computer instance with a brand, screen size, model name and model year" do 
          expect(first_computer).to be_a(Computer)
          expect(first_computer.brand).to be_a(String)
          expect(first_computer.screen_size).to be_a(Float)
          expect(first_computer.model_name).to be_a(String)
          expect(first_computer.model_year).to be_an(Integer)
        end
      end

      describe "#second_computer" do 
        it "returns a computer instance with a brand, screen size, model name and model year" do 
          expect(second_computer).to be_a(Computer)
          expect(second_computer.brand).to be_a(String)
          expect(first_computer.screen_size).to be_a(Float)
          expect(second_computer.model_name).to be_a(String)
          expect(second_computer.model_year).to be_an(Integer)
        end
      end
    end

    describe "Part 2" do 
      before(:each) do
        @time = DateTime.now
        Timecop.freeze(@time)
      end
  
      after(:each) do
        Timecop.return
      end

      let(:computer){
        Computer.new({
            brand: "Apple", 
            screen_size: 15.0, 
            model_name: "Macbook Pro", 
            model_year: 2012
          })
      }

      describe "instance methods" do
        

        describe "#asleep" do 
          it "returns a boolean indicating whether the computer is asleep" do 
            expect(computer.asleep).to be_nil
          end
        end
    
        describe "#sleep" do 
          it "puts the computer to sleep" do 
            computer.sleep
            expect(computer.asleep).to eq(true)
          end
        end
    
        describe "#wake_up" do 
          it "wakes the computer from sleep" do 
            
            computer.sleep
            expect(computer.asleep).to eq(true)
            computer.wake_up
            expect(computer.wake_up).to eq(false)
          end
        end
    
        describe "#back_up" do 
          it "backs up the computer and stores the current time as the last_backed_up_at time" do 
            computer.back_up
            expect(computer.instance_variable_get("@last_backed_up_at").strftime("%m-%e-%y %H:%M")).to eq(@time.strftime("%m-%e-%y %H:%M"))
          end
        end
    
        describe "#last_backed_up_at" do 
          it "returns the date and time of the last backup" do 
            computer.back_up
            expect(computer.last_backed_up_at.strftime("%m-%e-%y %H:%M")).to eq(@time.strftime("%m-%e-%y %H:%M"))
          end
        end
  
        describe "#about_this_computer" do 
          it "returns a hash containing information about the computer" do 
            computer.back_up
            about_this_computer_hash = computer.about_this_computer
            expect(about_this_computer_hash[:brand]).to eq("Apple")
            expect(about_this_computer_hash[:screen_size]).to eq(15.0)
            expect(about_this_computer_hash[:model_name]).to eq("Macbook Pro")
            expect(about_this_computer_hash[:model_year]).to eq(2012)
            expect(about_this_computer_hash[:last_backup_time]).to eq(@time.strftime("%m-%e-%y %H:%M"))
          end
        end

        describe "#save" do 
          it "saves the computer to the @@all class variable" do 
            computer.save
            expect(Computer.class_variable_get("@@all")).to include(computer)
          end
        end
      end

      describe "class methods for Computer" do
        describe ".all" do 
          it "returns an array containing all created instances of the computer class" do 
            expect(Computer.all).to eq(Computer.class_variable_get("@@all"))
          end
        end

        describe ".create(attributes)" do 
          it "accepts a hash of attributes, creates a new computer, saves it and returns it" do 
            mac = Computer.create(
              brand: "Apple", 
              screen_size: 24.0, 
              model_name: "iMac", 
              model_year: 2021
            )
            expect(mac).to be_a(Computer)
            expect(mac.brand).to eq("Apple")
            expect(mac.screen_size).to eq(24.0)
            expect(mac.model_name).to eq("iMac")
            expect(mac.model_year).to eq(2021)
            expect(Computer.class_variable_get("@@all")).to include(mac)
          end
        end

        describe ".backed_up" do 
          it "returns an array of all computers that have been backed up" do 
            mac = Computer.create(
              brand: "Apple", 
              screen_size: 24.0, 
              model_name: "iMac", 
              model_year: 2021
            )
            computer.back_up
            computer.save
            expect(Computer.backed_up).to include(computer)
            expect(Computer.backed_up).not_to include(mac)
          end
        end
      end

    end

  end
end
