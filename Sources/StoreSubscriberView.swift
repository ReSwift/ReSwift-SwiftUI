import Combine
import SwiftUI

public struct StoreSubscriberView<S, Content: View>: View {
    @State var state: S

    let publisher: AnyPublisher<S, Never>
    let content: (S) -> Content

    public var body: some View {
        content(state)
            .onReceive(publisher) { output in
                self.state = output
            }
    }
}
