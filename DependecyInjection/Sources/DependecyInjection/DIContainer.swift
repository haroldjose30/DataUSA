//  Created by Harold José on 13/08/2024.

import Foundation
import AJDependencyInjection

public class DIContainer {
    private init() {}
    public static var shared: AJDIContainer = AJDIContainer()

    public static func Setup() {
        registerRepositories()
        registerUseCases()
    }
}
