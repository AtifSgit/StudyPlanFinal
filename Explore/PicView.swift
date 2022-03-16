//
//  PicView.swift
//  StudyPlan
//
//  Created by ATIF on 15/03/2022.
//

import SwiftUI

struct PicView: View {
    var explore: Explore = exploreData[0]
    var body: some View {
        Image(explore.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct PicView_Previews: PreviewProvider {
    static var previews: some View {
        PicView()
    }
}
