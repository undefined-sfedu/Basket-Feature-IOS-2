//
//  LoginPresenter.swift
//  BasketFeature3.0
//
//  Created by Daniil on 08.09.2022.
//

import Foundation
class LoginPresenter{
    // MARK: - Properties
    private var view: LogInView? = nil
    
    enum TypeError{
        case emailError
        case passwordError
    }
    
    private var statesOfErrorLabels: [TypeError:Bool] = [.emailError:false, .passwordError:false]{
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
    var accessView: LogInView? = nil{
        didSet{
            self.view = accessView
        }
    }
    
    // MARK: - Methods
    func enter(){
        
        for key in statesOfErrorLabels.keys{
            statesOfErrorLabels[key] = true
        }
    }
    
    
}
