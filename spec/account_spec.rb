require './lib/account'

describe Account do
  it 'has balance 0' do
    expect(subject.balance).to eq(0)
  end
  it 'increases balance when #deposit' do
    subject.deposit(1000, '22/03/2018')
    expect(subject.balance).to eq(1000)
  end
  it 'makes #deposit when balance is not 0' do
    subject.deposit(500, '21/03/2018')
    subject.deposit(1000, '22/03/2018')
    expect(subject.balance).to eq(1500)
  end
  it 'decreases balance when #withdrawal' do
    subject.deposit(1000, '21/03/2018')
    subject.withdrawal(500, '22/03/2018')
    expect(subject.balance).to eq(500)
  end
  it 'adds statement elements with deposit into @bank_statement' do
    subject.deposit(1000, '21/03/2018')
    statement = {date: '21/03/2018', credit: 1000, debit: 0, balance: 1000}
    expect(subject.bank_statement[0]).to eq(statement)
  end
  it 'adds statement elements with withdrawal into @bank_statement' do
    subject.deposit(1000, '21/03/2018')
    subject.withdrawal(500, '22/03/2018')
    statement = {date: '21/03/2018', credit: 1000, debit: 0, balance: 1000},
      {date: '22/03/2018', credit: 0, debit: 500, balance: 500}
    expect(subject.bank_statement).to eq(statement)
  end
  it 'prints bank_statement out' do
    credit = rand(500..1500)
    debit = rand(1..credit)
    subject.deposit(credit, '21/03/2018')
    subject.withdrawal(debit, '22/03/2018')
    expect do
      subject.print_bank_statement
    end.to output("date || credit || debit || balance\n" +
      "21/03/2018 || #{credit}.00 || 0.00 || #{credit}.00\n" +
      "22/03/2018 || 0.00 || #{debit}.00 || #{credit - debit}.00\n").to_stdout
  end




end
