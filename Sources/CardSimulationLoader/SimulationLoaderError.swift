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

/// CardSimulationLoader error cases
public enum SimulationLoaderError: Error {
    /// when a bash script terminated with non-0 status.
    /// - Parameter status: the termination status code
    case shellProcessTerminatedUnexpected(status: Int32)
    /// This project is only suitable for non-iOS platforms, since forking processes is forbidden on iOS
    /// - Parameter name: The current platform name
    case unsupportedPlatform(name: String)
    /// When resource data is non-existing or unusable
    case resourceNotFound(String)
    /// When configuration files and/or pom files are missing mandatory information
    case malformedConfiguration
}
