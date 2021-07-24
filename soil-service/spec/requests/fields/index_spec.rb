RSpec.describe 'Fields controller', type: :request do

  it 'responds with 200' do
    get '/fields'
    expect(response.status).to eq 200
  end

  it "has a 'balance' field in the results" do
    get '/fields'
    results = JSON.parse(response.body)
    expect(results.first).to include ('balance')
    expect(results.first['balance'].class).to eq(Integer).or eq(Float)
  end

  it "has a 'balance' field that is either Integer or Float Class" do
    get '/fields'
    results = JSON.parse(response.body)
    expect(results.first['balance'].class).to eq(Integer).or eq(Float)
  end

end
