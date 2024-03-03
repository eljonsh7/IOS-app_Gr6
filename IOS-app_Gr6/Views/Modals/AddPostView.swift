import SwiftUI

struct AddPostView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var location: String = ""
    @State private var selectedRegionIndex: Int = 0
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker: Bool = false
    @State private var regions: [Regions] = []
    @State private var randomPhotoNumber = Int.random(in: 0...20)

    init() {
        self._regions = State(initialValue: DBHelper.shared.getRegions())
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Post Info")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Location", text: $location)
                    Picker(selection: $selectedRegionIndex, label: Text("Region")) {
                        ForEach(0..<regions.count, id: \.self) { index in
                            Text(regions[index].region_name ?? "")
                        }
                    }
                }
            }
            .navigationTitle("Add Post")
            .navigationBarItems(trailing:
                Button(action: {
                    savePost()
                }) {
                    Text("Save")
                }
            )
        }
    }

    private func savePost() {
        guard selectedRegionIndex < regions.count else {
            return
        }
        
        let selectedRegion = regions[selectedRegionIndex]
        let thumbnail = "https://picsum.photos/800/600?random=\(randomPhotoNumber)";
        DBHelper.shared.addPost(title: title, description: description, thumbnail: thumbnail, region: selectedRegion.region_name ?? "", userId: UserDefaults.standard.string(forKey: "loggedInUserId") ?? "CAB67DF6-D85C-4D50-BFA0-42C6CA21F3D8")
    }
}


struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
