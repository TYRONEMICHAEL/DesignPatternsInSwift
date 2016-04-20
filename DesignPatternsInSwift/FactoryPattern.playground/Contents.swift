//: Playground - noun: a place where people can play

import Foundation

protocol Account {
    var balance: Double { get set }
    var rewardPoints: Int { get set }
    func calculateRewardPoints(amount: Double) -> Int
}

extension Account {
    mutating func addTransaction(amount: Double) {
        self.rewardPoints += self.calculateRewardPoints(amount)
        self.balance += amount
    }
}

struct SilverAccount: Account {
    var balance: Double
    var rewardPoints: Int
    
    let silverTransactionCostPerPoint: Double = 10
    
    func calculateRewardPoints(amount: Double) -> Int {
        return max(Int(floor(amount / silverTransactionCostPerPoint)), 0)
    }
}

struct GoldAccount: Account {
    var balance: Double
    var rewardPoints: Int
    
    let goldTransactionCostPerPoint: Double = 10
    let goldBalanceCostPerPoint:Double = 2000
    
    func calculateRewardPoints(amount: Double) -> Int {
        return max(Int(
                floor(amount / goldTransactionCostPerPoint) + (amount / goldBalanceCostPerPoint)
            ), 0)
    }
}


class AccountFactory {
    func createAccount(accountType: Account.Type) -> Account {
        switch accountType.self {
        case is GoldAccount.Type:
            return GoldAccount(balance: 100, rewardPoints: 20)
        default:
            return SilverAccount(balance: 0, rewardPoints: 0)
        }
    }
}

// Usage

let factory = AccountFactory()
var goldAccount = factory.createAccount(GoldAccount.self)
var silverAccount = factory.createAccount(SilverAccount.self)

goldAccount.addTransaction(500)
goldAccount.rewardPoints

silverAccount.addTransaction(200)
silverAccount.rewardPoints