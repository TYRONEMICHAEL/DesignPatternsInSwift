//: Playground - noun: a place where people can play


protocol Discount {
    var discountValue: Double { get }
}

extension Discount {
    func calculateDiscount(productCost: Double) -> Double {
        return productCost * self.discountValue
    }
}

struct PremiumDiscount: Discount {
    let discountValue: Double = 0.5
}

struct SignUpDiscount: Discount {
    let discountValue: Double = 0.2
}

struct NullDiscount: Discount {
    let discountValue: Double = 0
}

struct Order {
    var name: String
    var cost: Double
    var discount: Discount
    
    func calculateDiscount() -> Double {
        return self.discount.calculateDiscount(self.cost)
    }
}

// Usage

let premiumOrder = Order(name: "XBOX 360", cost: 350, discount: PremiumDiscount())
let signupDiscount = Order(name: "PS4", cost: 400, discount: SignUpDiscount())
let regularOrder = Order(name: "HDTV", cost: 100, discount: NullDiscount())

premiumOrder.calculateDiscount()
signupDiscount.calculateDiscount()
regularOrder.calculateDiscount()



