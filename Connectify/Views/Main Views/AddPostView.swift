//
//  PostView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 15.07.23.
//

import SwiftUI

struct AddPostView: View {
    @EnvironmentObject var postManager: PostManager
    @Binding var isAddPost: Bool
    @State var text: String = ""
    @State var placeholder: String = "Write your expressions to post!"
    @State var images: [UIImage] = []
    @State var isImagePickerDisplayed: Bool = false
    
    var completion: () -> Void

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CTextView(text: $text, textStyle: .constant(.callout), placeholder: placeholder)
                        .padding()
                    
                    VStack {
                        CButton(backgroundColor: !text.isEmpty ? Color("mainColor") : Color.gray) {
                            
                            let post = PostModel(text: text, image: convertImage(uiImages: images))
                            postManager.postModel.append(post)
                            
                            isAddPost = false
                            completion()
                        } label: {
                            Text("Add Post")
                                
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(images.indices, id: \.self) { index in
                                    Image(uiImage: images[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                }
                            }
                            .padding()
                        }
                    }
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isAddPost = false
                        completion()
                    } label: {
                        Image(systemName: "xmark")
                            
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isImagePickerDisplayed = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .fullScreenCover(isPresented: $isImagePickerDisplayed) {
                AddImagePicker(sourceType: .photoLibrary) { image in
                    images.append(image)
                }
            }
        }
    }
    
    func convertImage(uiImages: [UIImage]) -> [Image] {
        var images: [Image] = []
        for uiImage in uiImages {
            images.append(Image(uiImage: uiImage))
        }
        return images
    }
}




struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView(isAddPost: .constant(true)) {
            
        }
    }
}
