import Quick
import Nimble

@testable import Githubo
class AppEnvironementTests: QuickSpec {
    
    override func spec() {
        
        describe("Test AppEnvironement") {

            it("Test AppEnvironement currentState should equal to") {
                expect(AppEnvironement.currentState).to(equal(AppEnvironement.development))
            }
            
            it("Test AppEnvironement baseUrl should equal to") {
                expect(AppEnvironement.baseURL).to(equal(URL(string: Servers.development)))
            }
        }
    }
}
