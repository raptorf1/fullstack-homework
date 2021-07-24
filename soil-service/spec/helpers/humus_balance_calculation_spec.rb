# I did try to test the method floowing RSpec docs (requiring ApplicationHelper) but I kept getting an error.
# I realize this is not the optimal way, but at least I get to test the method.

RSpec.describe 'humus_balance_calculator method' do

  it 'should outout the corect results' do
    results = [{:id=>1,
    :name=>"Mäeotsa",
    :area=>0.93,
    :crops=>
     [{:year=>2020, :crop=>{:value=>1, :label=>"Winter Wheat", :humus_delta=>-2}},
      {:year=>2021, :crop=>{:value=>1, :label=>"Oats", :humus_delta=>-2}},
      {:year=>2022, :crop=>{:value=>2, :label=>"Winter Wheat", :humus_delta=>1}},
      {:year=>2023, :crop=>{:value=>2, :label=>"Oats", :humus_delta=>1}},
      {:year=>2024, :crop=>{:value=>3, :label=>"Winter Wheat", :humus_delta=>3}}]}]

      expect(humus_balance_calculator(results).first[:balance]).to eq 0.7
  end

end