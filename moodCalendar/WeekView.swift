//
//  WeekView.swift
//  moodCalendar
//
//  Created by Benjamin Chang on 2021-05-02.
//

import SwiftUI

extension Date {
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: startDay)
    }
    
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: startDay)
    }
}

let now = Date()
let startWeek = now.startOfWeek!
let endWeek = now.endOfWeek!


struct WeekView: View {
    
    func getColor(i: Int) -> Color {
        switch i {
        case 1:
            return Color.blue
        case 2:
            return Color.purple
        case 3:
            return Color.yellow
        case 4:
            return Color.green
        case 5:
            return Color.red
        default:
            return Color.gray
        }
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("This is the week of \(startWeek.asString()) to \(endWeek.asString())")
            
            Spacer()
            // Days
            VStack{
                
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Monday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[2].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Tuesday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[3].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Wednesday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[4].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Thursday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[5].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Friday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[6].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Saturday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[7].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 120,height: 50)
                        Text("Sunday")
                    }
                    Spacer()
                    Rectangle().fill(getColor(i: colors.days[1].color)).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
                
            }
            
            Spacer()
            
            Rectangle().fill(Color.gray).frame(height:50)
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
