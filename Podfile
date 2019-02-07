def testing_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'OHHTTPStubs/Swift'
end

def core_pods
    #Code Style
    pod 'SwiftLint'
    
    ##Network Layer
    pod 'Alamofire'
    
    ## AutoLayout
    pod 'Cartography'
    
    ##Network Layer
    pod 'Moya/RxSwift'
    pod 'RxCocoa'

    ## Image Downloader
    pod 'Kingfisher'

end 

target 'Githubo' do
    use_frameworks!
    core_pods
    
    target 'GithuboTests' do
        testing_pods
    end
    
end
