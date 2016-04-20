protocol Strategy {
    func execute() -> String
}

struct PremiumMember: Strategy {
    func execute() -> String {
        return "Premium"
    }
}

struct RegularMember: Strategy {
    func execute() -> String {
        return "Regular"
    }
}

class Member {
    private var totalSpend: Double = 0
    private var premiumMember: Strategy = PremiumMember()
    private var regularMember: Strategy = RegularMember()
    private var currentMember: Strategy!
    
    init() {
        currentMember = regularMember
    }
    
    func increaseSpend(amount: Double) {
        totalSpend += amount
        if(totalSpend > 300.00) {
            currentMember = premiumMember
        }
    }
    
    func getMember() -> String {
        return currentMember.execute()
    }
}

let member = Member()
member.getMember()
member.increaseSpend(301)
member.getMember()