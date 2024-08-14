//  Created by Harold José on 14/08/2024.

import Foundation

struct MainMenuItemModel {
    let id: MainMenuItemModel.Identifier
    let title: String
    let subtitle: String
    let systemImage: String

    enum Identifier {
        case populationFromNationByYear
        case populationByState
    }
}
