//
//  Home.swift
//  PopOver
//
//  Created by Roberto D'Anna on 24/03/22.
//

import SwiftUI

struct MainView1: View {
    
    @State var graphicalDate = false
    @State var showPicker = false
    @State var show = false
     
    var body: some View {
        
        NavigationView{
            
            List{
                
                Toggle(isOn: $showPicker) {
                    
                    Text("Show Picker")
                }
                .toggleStyle(SwitchToggleStyle(tint: .orange))

                
                Toggle(isOn: $graphicalDate) {
                    
                    Text("Show Graphical Date")
                }
                .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            .navigationTitle("Example 1")
            
//          ToolBar
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        withAnimation{
                            show.toggle()
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.below.square.fill.and.square")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .toolBarPopover(show: $show, placement: .leading){
                        
//            Showing dynamic usage
            if showPicker{
                
                Picker(selection: .constant("")){
                    
                    ForEach(1...10, id: \.self){index in
                        Text ("Example \(index)")
                            .tag(index)
                    }
                    } label: {
                        }
                        .pickerStyle(.wheel)
                        .applyTextColor(.orange)
                        .background(Color(UIColor.systemBackground))

                        
            } else{
                
                if graphicalDate{
                    
//                  Popover View
                    DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(.graphical)
                    .accentColor(.orange)
                    .background(Color(UIColor.systemBackground))

                    
                } else {
                    //              Popover View
                                    DatePicker("", selection: .constant(Date()))
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                                    .accentColor(.orange)
                                    .background(Color(UIColor.systemBackground))

            }
        }
    }
  }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView1()
    }
}
