require './lib/account'

describe Account do
  it 'has balance 0' do
    expect(subject.balance).to eq(0)
  end
  it 'increases balance when #deposit' do
    subject.deposit(1000)
    expect(subject.balance).to eq(1000)
  end
  it 'makes #deposit when balance is not 0' do
    subject.deposit(500)
    subject.deposit(1000)
    expect(subject.balance).to eq(1500)
  end
  it 'decreases balance when #withdrawal' do
    subject.deposit(1000)
    subject.withdrawal(500)
    expect(subject.balance).to eq(500)
  end

end
