require './lib/account'

describe Account do
  it 'has balance 0' do
    expect(subject.balance).to eq(0)
  end
end
