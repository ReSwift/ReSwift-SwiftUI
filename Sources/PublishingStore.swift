import Combine
import ReSwift
import SwiftUI

open class PublishingStore<State: StateType>: Store<State>, PublishingStoreType {
    public let stateSubject: PassthroughSubject<State, Never> = PassthroughSubject()
    public let subscriptionsAutomaticallySkipRepeats: Bool

    public required init(reducer: @escaping Reducer<State>, state: State?, middleware: [Middleware<State>] = [], automaticallySkipsRepeats: Bool = true) {
        self.subscriptionsAutomaticallySkipRepeats = automaticallySkipsRepeats
        super.init(reducer: reducer, state: state, middleware: middleware, automaticallySkipsRepeats: automaticallySkipsRepeats)
    }

    open func subscribe<SubState, Content: View>(
        _ selector: @escaping (State) -> SubState,
        transform: (AnyPublisher<SubState, Never>) -> AnyPublisher<SubState, Never>,
        @ViewBuilder content: @escaping (SubState) -> Content
    ) -> StoreSubscriberView<SubState, Content> {
        StoreSubscriberView(
            state: selector(state),
            publisher: transform(stateSubject.map(selector).eraseToAnyPublisher()),
            content: content
        )
    }

    open override func _defaultDispatch(action: Action) {
        super._defaultDispatch(action: action)
        if !(action is ReSwiftInit) {
            stateSubject.send(state)
        }
    }

    open func subscribe<SubState, Content: View>(
        _ selector: @escaping (State) -> SubState,
        @ViewBuilder content: @escaping (SubState) -> Content
    ) -> StoreSubscriberView<SubState, Content> {
        subscribe(
            selector,
            transform: { $0 },
            content: content
        )
    }

    open func subscribe<SubState: Equatable, Content: View>(
        _ selector: @escaping (State) -> SubState,
        @ViewBuilder content: @escaping (SubState) -> Content
    ) -> StoreSubscriberView<SubState, Content> {
        subscribe(
            selector,
            transform: { subscriptionsAutomaticallySkipRepeats ? $0.removeDuplicates().eraseToAnyPublisher() : $0 },
            content: content
        )
    }
}
