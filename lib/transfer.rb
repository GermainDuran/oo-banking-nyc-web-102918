class Transfer
attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender,receiver,amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end


  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end

  end


  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
   else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
   end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
end













end # end of the class
