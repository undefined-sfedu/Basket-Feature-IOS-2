//
//  RegisterPresenter.swift
//  BasketFeature3.0
//
//  Created by Daniil on 07.09.2022.
//

import Foundation
class RegisterPresenter{
    
    // MARK: - Properties
    private var view: RegisterView? = nil
    
    enum TypeError{
        case emailError
        case passwordError
        case repeatPasswordError
    }
    
    private var statesOfErrorLabels: [TypeError:Bool] = [.emailError:false, .passwordError:false, .repeatPasswordError: false]{
        didSet{
            if let view = view {
                for item in statesOfErrorLabels{
                    view.changeVisibleOfErrorFields(typeOfLabel: item.key,
                                                   visible: item.value)
                }
                
            }
        }
    }
    // MARK: - Access To Properties
    var accessView: RegisterView? = nil{
        didSet{
            self.view = accessView
        }
    }
    
    // MARK: - Methods
    func logIn(){
        
        for key in statesOfErrorLabels.keys{
            statesOfErrorLabels[key] = true
        }
    }
    
    
}


