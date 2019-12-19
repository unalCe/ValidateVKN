/*
	Vergi Numarasının ilk 9 rakamı için d, kontrol basamağı için c kullanırsak :

	Vergi No = d1 d2 d3 d4 d5 d6 d7 d8 d9 c1

	İlk 9 rakam olan d1..d9 değerlerini i = 1..9 için d[i] olarak ifade edersek;

	p[i] = (d[i] + 10 - i) mod 10

	p[i] = 9 => q[i] = 9
	p[i] != 9 => q[i] = (p[i] * 2^(10 - i)) mod 9

	c1 = (10 - (Σ q[i] mod 10)) mod 10
	*/

	func validateVKN(for strNumber: String) -> Bool {

		var digits = strNumber.compactMap({ Int(String($0)) })
		if !(digits.count == 10) {
			return false
		}

		let lastNumber = digits.popLast()

		var mods = [Int]()

		// $0 -> Index ( +1 -- starting index is 1 )      $1 -> Number itself
		digits.enumerated().forEach({
			let remainder = ($1 + 10 - ($0 + 1)) % 10
			mods.append(remainder)
		})

		mods.enumerated().forEach({
			if $1 == 9 { return }

			let powerNum = Double(10 - ($0 + 1))
			mods[$0] = Int( (Double(mods[$0]) * pow(2, powerNum)) ) % 9
		})

		let total = mods.reduce(0, +)
		let verificationNumber = (10 - (total % 10)) % 10

		return lastNumber == verificationNumber
	}
