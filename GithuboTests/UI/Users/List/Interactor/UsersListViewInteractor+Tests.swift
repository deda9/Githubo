import Quick
import Nimble
import UIKit
import Moya

@testable import Githubo
class UsersListViewInteractorTests: QuickSpec {
    
    override func spec() {
        var interactor: UsersListViewInteractor!
        var interactorOutputs: UsersListViewInteractorOutputsMock!
        var firstUser: User {
            //swiftlint:disable force_unwrapping
            return interactorOutputs.users.first!
        }
        
        describe("Testing Interactor flow") {
            beforeEach {
                interactor = UsersListViewInteractor()
                interactorOutputs = UsersListViewInteractorOutputsMock()
                interactor.usersNetworkProvider = MoyaProvider<UsersAPIs>(stubClosure: MoyaProvider.immediatelyStub)
                interactor.outputs = interactorOutputs
            }
            
            it("Test loading status") {
                expect(interactorOutputs.isLoading).to(equal(false))
                interactor.loadUsers()
                expect(interactorOutputs.isLoaded).to(equal(true))
            }
            
            it("Test loading users response") {
                expect(interactorOutputs.users.isEmpty).to(equal(true))
                interactor.loadUsers()
                expect(interactorOutputs.users.isEmpty).to(equal(false))
                expect(interactorOutputs.users.count).to(equal(30))
            }
            
            describe("Test first user data") {
                beforeEach {
                    interactor.loadUsers()
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

extension UsersListResolver where Self: TestResolver {
    func resolve(outputs: UsersListViewInputs) -> UsersListViewPresenter {
        let presenter = UsersListViewPresenter()
        let interactor = UsersListViewInteractor()
        interactor.outputs = presenter
        presenter.interactor = interactor
        presenter.outputs = outputs
        return presenter
    }
}
