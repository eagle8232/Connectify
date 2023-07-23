//
//  ProfileView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileManager: ProfileManager
    
    @Binding var tabBarVisible: Bool
    @State var isEdit: Bool = false
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var imagePickerSourceType: ImagePicker.SourceType = .photoLibrary
    @State var selectedImage: UIImage? = nil
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ZStack {
                        ProfileBgView(profileBgImage: profileManager.myProfile?.profileBgImage)
                        HStack {
                            VStack {
                                
                                profileManager.myProfile?.profileImage?
                                    .circularImage()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                Button {
                                    showActionSheet = true
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .background {
                                            Circle()
                                                .fill(Color(.systemBackground))
                                                .shadow(color: Color(.label), radius: 2)
                                                .padding(-5)
                                        }
                                }
                                .offset(x: 30, y: -30)
                                
                            }
                            
                            Spacer()
                        }
                        .offset(y: 50)
                        .padding()
                    }
                    
                    PersonalInfoView(profileModel: profileManager.myProfile!)
                        .padding(.top, 40)
                        .padding(.horizontal)
                    
                    
                    BioView(profileModel: profileManager.myProfile!)
                        .padding()
                    
                    SkillsView(profileModel: profileManager.myProfile!)
                    
                    ProfileContents(profileModel: profileManager.myProfile!, tabBarVisible: $tabBarVisible)
                    
                }
                .padding(.bottom, 100)
            }
        
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                CButton(width: 35, height: 35) {
                    
                } label: {
                    Image(systemName: "gear")
                }
            }
        })
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Edit"), message: Text("Choose a photo source"), buttons: [
                .default(Text("Take a photo")) {
                    imagePickerSourceType = .camera
                    showImagePicker = true
                },
                .default(Text("Choose from gallery")) {
                    imagePickerSourceType = .photoLibrary
                    showImagePicker = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: imagePickerSourceType, completion: { selectedImage in
                profileManager.myProfile?.profileImage = Image(uiImage: selectedImage!)
            })
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}




struct ColorfulView: View {
    // Generate some random colors
    let colors: [Color] = (1...20).map { _ in Color(red: .random(in: 0..<4), green: .random(in: 0..<4), blue: .random(in: 0..<4)) }

    // Define the grid layout
    var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 20) {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(color)
                        .frame(height: 100)
                        .shadow(radius: 10)
                }
            }
            .padding(20)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(tabBarVisible: .constant(true))
    }
}
