package iti.jets.Presentation;

import iti.jets.Presentation.AuthCommands.LoginCommand;

public class CommandFactory {

    public FrontCommand getCommand(String commandName){

        if(commandName.equals("Login")){
            return new LoginCommand();
        }
//        else if(commandName.equals("Register")){
//            return new RegisterCommand();
//        }
//        else if(commandName.equals("Home")){
//            return new HomeCommand();
//        }
//        else if(commandName.equals("About")){
//            return new AboutCommand();
//        }
//        else if(commandName.equals("New")){
//            return new NewCommand();
//        }
//        else if(commandName.equals("Contact")){
//            return new ContactCommand();
//        }
//        else if(commandName.equals("Shop")){
//            return new ShopCommand();
//        }


        return new UnknownCommand();


    }
}
