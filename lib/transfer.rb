class Transfer

attr_accessor :sender, :receiver, :status, :amount
 def initialize (sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = amount
 end

 def valid?
  self.sender.valid? && self.receiver.valid? ? true : false
 end 
 
 def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
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
      @status = ""
      
 end 
 
end
