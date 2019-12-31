import Foundation
import WCDBSwift

public struct Snapshot: BaseCodable {
    
    static var tableName: String = "snapshots"
    
    let snapshotId: String
    let type: String
    let assetId: String
    let amount: String
    let opponentId: String?
    let transactionHash: String?
    let sender: String?
    let receiver: String?
    let memo: String?
    let confirmations: Int?
    let traceId: String?
    var createdAt: String
    
    public enum CodingKeys: String, CodingTableKey {
        public typealias Root = Snapshot
        case snapshotId = "snapshot_id"
        case type
        case assetId = "asset_id"
        case amount
        case opponentId = "opponent_id"
        case transactionHash = "transaction_hash"
        case sender
        case receiver
        case memo
        case confirmations
        case traceId = "trace_id"
        case createdAt = "created_at"
        
        public static let objectRelationalMapping = TableBinding(CodingKeys.self)
        public static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                snapshotId: ColumnConstraintBinding(isPrimary: true)
            ]
        }
    }
    
    init(snapshotId: String, type: String, assetId: String, amount: String, transactionHash: String?, sender: String?, opponentId: String?, memo: String?, receiver: String?, confirmations: Int?, traceId: String?, createdAt: String) {
        self.snapshotId = snapshotId
        self.type = type
        self.assetId = assetId
        self.amount = amount
        self.transactionHash = transactionHash
        self.sender = sender
        self.opponentId = opponentId
        self.memo = memo
        self.receiver = receiver
        self.confirmations = confirmations
        self.traceId = traceId
        self.createdAt = createdAt
    }
    
    enum Sort {
        case createdAt
        case amount
    }
    
    enum Filter {
        case all
        case deposit
        case transfer
        case withdrawal
        case fee
        case rebate
        case raw
        
        var snapshotTypes: [SnapshotType] {
            switch self {
            case .all:
                return SnapshotType.allCases
            case .deposit:
                return [.deposit, .pendingDeposit]
            case .transfer:
                return [.transfer]
            case .withdrawal:
                return [.withdrawal]
            case .fee:
                return [.fee]
            case .rebate:
                return [.rebate]
            case .raw:
                return [.raw]
            }
        }
    }
    
}

enum SnapshotType: String, CaseIterable {
    case raw
    case deposit
    case transfer
    case withdrawal
    case fee
    case rebate
    case pendingDeposit = "pending_deposit"
}
