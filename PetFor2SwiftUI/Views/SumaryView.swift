//
//  SumaryView.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 15/12/22.
//

import SwiftUI

struct SumaryView: View {
    @EnvironmentObject var activityManager : ActivityManager

    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Total")
                    ProgressView(value: activityManager.getRatioActivitiesDone())
                        .accessibilityLabel("Barra de progresso Total")
                    
                }
                
                
                ForEach(Category.allCases, id: \.self) { category in
                    VStack(alignment: .leading) {
                        Text(category.rawValue)
                        ProgressView(value: activityManager.getRatioActivitiesCategory(forCategory: category))
                            .accessibilityLabel("Barra de progresso \(category.rawValue)")
                        
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Distribuição por time")
                    ProgressView(value: activityManager.getRatioActivitiesTeam(forTeam: .orange))
                        .tint(Color(Team.orange.rawValue))
                        .background(Color(Team.blue.rawValue))
                        .accessibilityLabel("Distribuição das atividades")
                    
                }


            }
            .font(.title2)
            .bold()
            .navigationTitle("Sumário")
        }

    }
}

struct SumaryView_Previews: PreviewProvider {
    static var previews: some View {
        SumaryView()
            .environmentObject(ActivityManager())
    }
}
