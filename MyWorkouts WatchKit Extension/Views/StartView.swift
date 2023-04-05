/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The start view.
*/

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var workoutTypes: [HKWorkoutActivityType] = [.rowing, .paddleSports]
    
    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(workoutType.name, destination: SessionPagingView(),
                           tag: .rowing, selection: $workoutManager.selectedWorkout)
                .padding(EdgeInsets(top: 30, leading: 5, bottom: 30, trailing: 5))
        }
        .listStyle(.carousel)
        .navigationBarTitle("Workouts")
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(WorkoutManager())
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .running:
            return "Run"
        case .cycling:
            return "Bike"
        case .paddleSports:
            return "Indoor Erg"
        case .rowing:
            return "Outdoor Row"
        default:
            return ""
        }
    }
}
