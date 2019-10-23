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

  def print_bank_statement
    puts "date || credit || debit || balance"
    @bank_statement.each do |transaction|
      print transaction[:date] + ' || '
      print ('%.2f' % transaction[:credit]).to_s + ' || '
      print ('%.2f' % transaction[:debit]).to_s + ' || '
      puts  ('%.2f' % transaction[:balance]).to_s


    end

  end

private
  def date
    t = Time.now
    t.strftime("%m/%d/%Y at %I:%M%p")
  end

end
