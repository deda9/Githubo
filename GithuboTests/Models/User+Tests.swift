import Quick
import Nimble

@testable import Githubo
class UserTests: QuickSpec {
   
    override func spec() {
        var sutResponse: User!
        
        describe("Test User properties should not be nil") {
            beforeEach {
                sutResponse = self.getFirstUser()
            }
            
            it("Test User id should NOT equal to zero") {
                expect(sutResponse.id).notTo(equal(0))
            }
    
            it("Test User nodeID should NOT equal to nil") {
                expect(sutResponse.nodeID).notTo(beNil())
            }
            
            it("Test User followingURL should NOT equal to nil") {
                expect(sutResponse.followingURL).notTo(beNil())
            }
            
            it("Test User followersURL should NOT equal to nil") {
                expect(sutResponse.followersURL).notTo(beNil())
            }
            
            it("Test User type should NOT equal to nil") {
                expect(sutResponse.type).notTo(beNil())
            }
        }
    
    }
}
