public struct GitignoreList : Equatable{
    public let title : String
    public let arrayTags : [String]
    public let gitignoreString : String
    
    public init(
        title : String,
        arrayTags : [String],
        gitignoreString : String
    ){
        self.title = title
        self.arrayTags = arrayTags
        self.gitignoreString = gitignoreString
    }
}
