import Combine
import ReSwift
import SwiftUI

public protocol PublishingStoreType: DispatchingStoreType {
    associatedtype State

    func subscribe<SubState, Content: View>(
        _ selector: @escaping (State) -> SubState,
        @ViewBuilder content: @escaping (SubState) -> Content
    ) -> StoreSubscriberView<SubState, Content>

    func subscribe<SubState, Content: View>(
        _ selector: @escaping (State) -> SubState,
        transform: (AnyPublisher<SubState, Never>) -> AnyPublisher<SubState, Never>,
        @ViewBuilder content: @escaping (SubState) -> Content
    ) -> StoreSubscriberView<SubState, Content>

    func subscribe<SubState: Equatable, Content: View>(
        _ selector: @escaping (State) -> SubState,
        @ViewBuilder content: @escaping (SubState) -> Content
    ) -> StoreSubscriberView<SubState, Content>
}
