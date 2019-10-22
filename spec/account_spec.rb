require './lib/account'

describe Account do
  it 'has balance 0' do
    expect(subject.balance).to eq(0)
  end
  it 'increases balance when #deposit' do
    subject.deposit(1000)
    expect(subject.balance).to eq(1000)
  end

end
