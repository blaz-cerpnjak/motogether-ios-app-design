//
//  AddPathView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 06/03/2023.
//

import SwiftUI

struct AddPathView: View {
    @State var username = ""
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Add new event")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                }
                .padding(.bottom, 30)
                
                Group {
                    ContentGroupView1()
                    
                    Divider()
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                    
                    ContentGroupView2()
                    
                    Divider()
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                    
                    ContentGroupView3()
                    
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 100)
            .background(Color.MainBackgroundColor)
        }
        .background(Color.MainBackgroundColor)
    }
}

struct AddPathView_Previews: PreviewProvider {
    static var previews: some View {
        AddPathView()
    }
}

struct ContentGroupView1: View {
    var body: some View {
        ChooseLocationView(title: "Start location")
        ChooseLocationView(title: "End location")
        AddStopView()
    }
}

struct ContentGroupView2: View {
    var body: some View {
        TextInputView(title: "Duration", placeholder: "70 min")
        TextInputView(title: "Date", placeholder: "11.3.2023")
            .padding(.top, 10)
    }
}

struct ContentGroupView3: View {
    @State var onlyForFriends = false
    @State var limitedParticipants = false
    
    var body: some View {
        CheckBoxView(description: "Only for friends", checked: $onlyForFriends)
        CheckBoxView(description: "Limited participants", checked: $limitedParticipants)
        
        Divider()
            .padding(.bottom, 10)
            .padding(.top, 10)
        
        TextInputView(title: "Description")
            .padding(.top, 10)
        
        Button(action: {}) {
            Text("Create event")
                .frame(maxWidth: .infinity)
        }
        .frame(height: 50)
        .foregroundColor(.white)
        .fontWeight(.semibold)
        .background(Color.PrimaryColor)
        .cornerRadius(10)
        .padding(.top, 30)
    }
}

struct ChooseLocationView: View {
    var title = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.body)
                    .bold()
                
                Spacer()
            }
            
            Button(action: {}) {
                HStack{
                    Text("Choose location")
                        .padding()
                        .foregroundColor(Color.TextColorPrimary)
                    
                    Spacer()
                    
                    Image(systemName: "map.fill")
                        .padding(.trailing, 15)
                        .foregroundColor(Color.TextColorPrimary)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.TextColorPrimary, lineWidth: 1.5)
                )
            }
            .background(.thinMaterial.opacity(0.5))
            .cornerRadius(10)
            .padding(.bottom, 10)
        }
    }
}

struct AddStopView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Add stop")
                    .font(.body)
                    .bold()
                
                Spacer()
            }
            
            HStack {
                Button(action: {}) {
                    HStack{
                        Text("New Stop")
                            .padding()
                            .foregroundColor(Color.TextColorPrimary)
                        
                        Spacer()
                        
                        Image(systemName: "plus")
                            .padding(.trailing, 15)
                            .foregroundColor(Color.TextColorPrimary)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.TextColorPrimary, lineWidth: 1.5)
                    )
                }
                .frame(width: UIScreen.main.bounds.width / 2)
                .background(.thinMaterial.opacity(0.5))
                .cornerRadius(10)
                .padding(.bottom, 10)
                
                Spacer()
            }
        }
    }
}

struct TextInputView: View {
    var title = ""
    var placeholder = ""
    @State var username = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.body)
                    .bold()
                
                Spacer()
            }
            
            TextField(placeholder, text: $username)
                .padding()
                .background(.thinMaterial.opacity(0.5))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.TextColorPrimary, lineWidth: 1)
                )
        }
    }
}

struct CheckBoxView: View {
    var description: String
    @Binding var checked: Bool

    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .resizable()
                .foregroundColor(checked ? Color.PrimaryColor : Color.TextColorSecondary)
                .onTapGesture {
                    self.checked.toggle()
                }
                .frame(width: 20, height: 20)
            
            Text(description)
                .padding()
                .font(.subheadline)
                .foregroundColor(Color.TextColorPrimary)
            
            Spacer()
        }
    }
}
