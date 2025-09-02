# Starship for terminals

{

	programs.starship = {
		enable = true;
		 settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];
         directory = {
          style = "bold blue";
          truncate_to_repo = true;
         };
         git_branch = {
          style = "bold purple";
         };
      	 git_status = {
          style = "red";
	 };
    	}; 
    };




}
