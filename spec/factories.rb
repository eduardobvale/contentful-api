FactoryBot.define do
  factory :recipe do
    id { "4dT8tcb6ukGSIg2YyuGEOm" } 
    title { "White Cheddar Grilled Cheese with Cherry Preserves" }
    description { "Instead of an overly sugary BBQ sauce we make a fresh, flavorful rub with our own BBQ spice blend, olive oil, and pepper." }
    calories { 790 }
    photo_url { "//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg" }
    chef_name { "John Doe" }
    tags { ["vegan","healthy"] }
  end
end