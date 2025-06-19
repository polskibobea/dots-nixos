 { config, pkgs, ... };

 {
   
   vim = {
      enable = true;
      viAlias =true;

      plugins = { 
       nvim-treesitter.enable = true;
       telescope.enable = true;
       };

       lsp = {
         enable = true; 
	 formatOnSave = true;
	 servers = {
	   nixd.enable = true;
	   lua-ls.enable = true;
	   };
	};
     };
   }
