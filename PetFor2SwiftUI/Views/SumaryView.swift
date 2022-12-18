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
        VStack{
            Text("Sumário")
                .font(.title)
            Spacer()
            
            
            
            VStack(alignment: .leading) {
                Text("Total de Atividades")
                ProgressView(value: activityManager.getRatioActivitiesDone())
                    .accessibilityLabel("Barra de progresso Total")
                
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Distribuição das atividades")
                ProgressView(value: activityManager.getRatioActivitiesTeam(forTeam: .orange))
                    .tint(.orange)
                    .background(.blue)
                    .accessibilityLabel("Distribuição das atividades")
                
            }
            .padding()
            
         Spacer()
        }
        .padding()
        
    }

}

struct SumaryView_Previews: PreviewProvider {
    static var previews: some View {
        SumaryView()
            .environmentObject(ActivityManager())
    }
}
