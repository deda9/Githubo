import Quick
import Nimble
import Moya

@testable import Githubo
class NetworkServiceTests: QuickSpec {
    
    override func spec() {
        
        var sutResponse: [User]!
        var sutProvider: MoyaProvider<UsersAPIs>!
        var firstUser: User {
            //swiftlint:disable force_unwrapping
            return sutResponse.first!
        }
        
        describe("Test NetworkService") {
            
            beforeEach {
                sutProvider = MoyaProvider<UsersAPIs>(stubClosure: MoyaProvider.immediatelyStub)
                sutProvider.request(UsersAPIs.usersList(1, 1), completion: { result in
                    if case let .success(response) = result {
                        sutResponse = JSONHelper.parseData(of: [User].self, from: response.data)
                    }
                })
            }
            
            it("Test NetworkService for getting users list should success") {
                expect(sutResponse).notTo(beNil())
            }
            
            it("Test NetworkService for getting users list count should not equal zero") {
                expect(sutResponse.count).to(equal(30))
            }
            
            it("Test User id should NOT equal to zero") {
                expect(firstUser.id).notTo(equal(0))
            }
            
            it("Test User nodeID should NOT equal to nil") {
                expect(firstUser.nodeID).notTo(beNil())
            }
            
            it("Test User followingURL should NOT equal to nil") {
                expect(firstUser.followingURL).notTo(beNil())
            }
            
            it("Test User followersURL should NOT equal to nil") {
                expect(firstUser.followersURL).notTo(beNil())
            }
            
            it("Test User type should NOT equal to nil") {
                expect(firstUser.type).notTo(beNil())
            }
        }
    }
}
