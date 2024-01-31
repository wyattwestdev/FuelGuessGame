contract;
 
abi GuessGame
 {
	#[storage(write)]
	fn init_game(value: u64);

	#[storage(read)]
	fn guess_numer(value: u64) -> Guess;
}
 
storage 
{
	secret_number: u64 = 0,
}

enum Guess
{
	Lower: (),
	Winner: (),
	Higher: (),
}
 
impl GuessGame for Contract 
{
	#[storage(write)]
	fn init_game(value: u64) 
	{
		storage.secret_number.write(value);
	}

	#[storage(read)]
	fn guess_numer(value: u64) -> Guess
	{
		let mut result = Guess::Winner;

		if value > storage.secret_number.read()
		{
			result = Guess::Higher;
		} 
		else if value < storage.secret_number.read()
		{
			result = Guess::Lower;
		}

		result
	}
}
 