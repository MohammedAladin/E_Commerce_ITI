package iti.jets.presentation;

import iti.jets.presentation.AuthCommands.LoginCommand;
import iti.jets.presentation.AuthCommands.RegisterCommand;
import iti.jets.presentation.PagesCommands.HomeCommand;

import java.util.HashMap;
import java.util.Map;   

public class CommandFactory {
        private Map<String, FrontCommand> commandMap;
    
        public CommandFactory() {
            commandMap = new HashMap<>();
            commandMap.put("Login", new LoginCommand());
            commandMap.put("Register", new RegisterCommand());
            commandMap.put("Home", new HomeCommand());
        }
    
        public FrontCommand getCommand(String commandName){
            FrontCommand command = commandMap.get(commandName);
            System.out.println("CommandFactory.getCommand() " + commandName);
            return command != null ? command : new UnknownCommand();
        }
}
