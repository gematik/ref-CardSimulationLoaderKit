//
// Copyright (c) 2019 gematik - Gesellschaft für Telematikanwendungen der Gesundheitskarte mbH
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//    http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import GemCommonsKit

/**
    KeepAliveRunLoop keeps a thread running in .default until the thread gets cancelled

    Actions can be scheduled on this thread's RunLoop to be executed on this Thread.
 */
public class KeepAliveRunLoop: Thread {
    private let _runloop = BlockingVar<RunLoop>()

    /**
        Get the runloop for this thread.

        Caution: make sure the Thread has been started before calling the runloop
        Note: this is a blocking call

        - Returns: the thread's RunLoop
     */
    public private(set) var runloop: RunLoop {
        get {
            return _runloop.value
        }
        set {
            _runloop.value = newValue
        }
    }

    /// Do not call directly
    override public func main() {
        DLog("KeepAliveRunLoop started")
        runloop = RunLoop.current
        let port = Port()
        RunLoop.current.add(port, forMode: .common)
        while !self.isCancelled {
            RunLoop.current.run(mode: .default, before: Date.distantFuture)
        }
        RunLoop.current.remove(port, forMode: .common)
        port.invalidate()
        DLog("Port invalidated and thread ended")
    }

    /// Cancel the Thread and RunLoop
    override public func cancel() {
        let cfRl = runloop.getCFRunLoop()
        CFRunLoopStop(cfRl)

        super.cancel()
    }
}
