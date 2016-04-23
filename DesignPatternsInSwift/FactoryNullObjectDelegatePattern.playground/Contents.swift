//: Playground - noun: a place where people can play

import Foundation

protocol RewardCard {
    var rewardPoints: Double { get set }
    func calculateRewardPoints(amount: Double) -> Double
}

public class Account {
    private let rewardCard: RewardCard
    public private(set) var balance: Double = 0
    
    init(rewardCard: RewardCard) {
        self.rewardCard = rewardCard
    }
    
    func addTransaction(amount: Double) {
        self.balance += self.rewardCard.calculateRewardPoints(amount) + amount
    }
    
}

class NoRewardCard: RewardCard {
    var rewardPoints: Double = 0
    
    func calculateRewardPoints(amount: Double) -> Double {
        return 0
    }
}

class SilverRewardCard: RewardCard {
    var rewardPoints: Double = 0
    let silverTransactionCostPerPoint: Double = 10
    
    func calculateRewardPoints(amount: Double) -> Double {
        return max(floor(amount / silverTransactionCostPerPoint), 0)
    }
}

class GoldRewardCard: RewardCard {
    var rewardPoints: Double = 0
    let silverTransactionCostPerPoint: Double = 10
    
    let goldTransactionCostPerPoint: Double = 10
    let goldBalanceCostPerPoint:Double = 2000
    
    func calculateRewardPoints(amount: Double) -> Double {
        return max(floor(amount / goldTransactionCostPerPoint) + (amount / goldBalanceCostPerPoint), 0)
    }
}


class AccountFactory {
    func createAccount(rewardType: RewardCard.Type?) -> Account {
        switch rewardType.self {
        case is GoldRewardCard.Type:
            return Account(rewardCard: GoldRewardCard())
        case is SilverRewardCard.Type:
            return Account(rewardCard: SilverRewardCard())
        default:
            return Account(rewardCard: NoRewardCard())
        }
    }
}

// Usage

let factory = AccountFactory()
var goldAccount = factory.createAccount(GoldRewardCard.self)
var silverAccount = factory.createAccount(SilverRewardCard.self)
var regularAccount = factory.createAccount(nil)

goldAccount.addTransaction(500)
goldAccount.balance

silverAccount.addTransaction(200)
silverAccount.balance

regularAccount.addTransaction(100)
regularAccount.balance
