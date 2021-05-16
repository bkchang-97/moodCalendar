//
//  MoodSelect.swift
//  moodCalendar
//
//  Created by Benjamin Chang on 2021-05-04.
//

import SwiftUI

extension Date {
    func asString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}

struct MoodSelect: View {
    @State var mood:Color = Color.gray
    @State var continuePressed: Int? = nil
    
    let date = Date()
    let weekday = Calendar.current.component(.weekday, from: Date())
    
    func updateColor(c: Color) -> Void {
        var i: Int = 0
        
        switch c {
        case Color.blue:
            i = 1
        case Color.purple:
            i = 2
        case Color.yellow:
            i = 3
        case Color.green:
            i = 4
        case Color.red:
            i = 5
        default:
            i = 0
        }
    
        days[weekday].color = i
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
                Text("\(date.asString())").font(.system(size: 25)).padding()
                
                Text(String(weekday))

                
                Text("How are you feeling today?").font(.system(size: 27))
                
                Spacer()
                
                Rectangle().fill(mood)
                    .frame(width: 175, height: 175)
                
                Spacer()
                
                HStack{
                    Spacer().frame(width:25)
                    HStack{
                        
                        Button(action: {
                            mood = Color.blue
                            print("I'm feeling like a 1")
                        }, label: {
                            ZStack{
                                Rectangle().fill(Color.blue).frame(width: 50, height:50)
                                
                                Text("1").foregroundColor(Color.black)
                            }
                        })
                        Spacer()
                        
                        Button(action: {
                            mood = Color.purple
                            print("I'm feeling like a 2")
                        }, label: {
                            ZStack{
                                Rectangle().fill(Color.purple).frame(width: 50, height:50)
                                
                                Text("2").foregroundColor(Color.black)
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            mood = Color.yellow
                            print("I'm feeling like a 3")
                        }, label: {
                            ZStack{
                                Rectangle().fill(Color.yellow).frame(width: 50, height:50)
                                
                                Text("3").foregroundColor(Color.black)
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            mood = Color.green
                            print("I'm feeling like a 4")
                        }, label: {
                            ZStack{
                                Rectangle().fill(Color.green).frame(width: 50, height:50)
                                
                                Text("4").foregroundColor(Color.black)
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            mood = Color.pink
                            print("I'm feeling like a 5")
                        }, label: {
                            ZStack{
                                Rectangle().fill(Color.pink).frame(width: 50, height:50)
                                
                                Text("5").foregroundColor(Color.black)
                            }
                        })
                    }
                    Spacer().frame(width:25)
                }
                Spacer()
                
                HStack{
                    Spacer()
                    NavigationLink(destination: WeekView()) {
                        Text("Skip")
                    }

                    Spacer()
                    
                    NavigationLink(destination: WeekView(), tag: 1, selection: $continuePressed) {
                        Button("Continue", action: {updateColor(c: mood)
                            print(days)
                            save(data: days)
//                            days = load("colorlist.json")
                            self.continuePressed = 1
                            print("test")
                        })
                    }
                    Spacer()
                }
                Spacer()
            }
        
        }
    }
}

struct MoodSelect_Previews: PreviewProvider {
    static var previews: some View {
        MoodSelect()
    }
}
