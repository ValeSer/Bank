class Account
  attr_reader :balance, :bank_statement

  def initialize
    @balance = 0
    @bank_statement = []
  end

  def deposit(amount, date)
    date
    @balance += amount
    @bank_statement.push(date: date, credit: amount, debit: 0, balance: @balance)
  end

  def withdrawal(amount, date)
    @balance -= amount
    @bank_statement.push(date: date, credit: 0, debit: amount, balance: @balance)
  end

private
  def date
    t = Time.now
    t.strftime("%m/%d/%Y at %I:%M%p")
  end

end
