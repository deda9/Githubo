import Quick
import Nimble
import UIKit

@testable import Githubo
class UsersListViewPresenterTests: QuickSpec {
    
    override func spec() {
        var presenter: UsersListViewPresenter!
        let interactor = UsersListViewInteractorMock()
        var outputs: UsersListViewInputsMock!
        var firstUser: User {
            //swiftlint:disable force_unwrapping
            return outputs.users.first!
        }
        
        describe("Test UsersListViewPresenter LifeCyle") {
            beforeEach {
                outputs = UsersListViewInputsMock()
                presenter = UsersListViewPresenter()
                presenter.interactor = interactor
                interactor.outputs = presenter
                presenter.outputs = outputs
            }
            
            it("Test ViewDidLoad") {
                expect(outputs.isLoading).to(equal(false))
                expect(outputs.isLoaded).to(equal(false))
                presenter.viewDidLoad()
                expect(outputs.isLoaded).to(equal(true))
            }
            
            it("Test loading users") {
                expect(outputs.users.isEmpty).to(equal(true))
                presenter.viewDidLoad()
                expect(outputs.users.isEmpty).to(equal(false))
                expect(outputs.users.count).to(beGreaterThan(0))
            }
            
            describe("Test first user data") {
                beforeEach {
                    presenter.viewDidLoad()
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
}
