module Observable
	def subscribe
		raise NotImplementedError, "Hey, try defining an instance mthod of subscribe"

	end 

	def unsubscribe
		raise NotImplementedError, "Hey, try defining an instance mthod of unsubscribe"

	end 

	def notify_subscribers
		raise NotImplementedError, "Hey, try defining an instance mthod of notify_subscribers"

	end 

end 

module Observer
	def update
		raise NotImplementedError, "Hey, try defining an instance mthod of update"

	end 
end 

class EmailNotifier
	include Observer

	def update(balance)
		puts  "You have received a text message, the balance is ${balance}"
	end 
end 

class BankAccount
	attr_accessor  :subscribers, :balance, :changed

	include Observable


	def initialize(balance = 1000)
		@balance = balance
		@subscribers = []
		@changed = false
	end 

	def withdraw(amount)
		balance -= amount
		self.changed = true
		if balance < 1000
			notify_subscribers
		end 
	end 

	def subscribe(subscriber)
		subscribers.push subscriber
	end 

	def unsubscribe(subscriber)
		subscribers.delete subscriber
	end 

	def notify_subscribers
		if self.changed
			subscribers.each { |o| o.update balance}
		end 
		self.changed = false
	end 
end 

subscribers = [
	SMSNotifier.new, 
	EmailNotifier.new
]

bank_account = BankAccount.new(1200)
subscribers.each { |s| bank_account.subscribe s}


bank_account.withdraw 100 


BankAccount.new.subscribe

RSpec.describe "Observers" do
	let(:sms notifier) {SMSNOtifier.new}

	it "SMSNotifier will respond to an instance method of .update do
		epect(sms_notifier).to respond_to(:update)"